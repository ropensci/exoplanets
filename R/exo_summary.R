#' Exoplanet Summary
#'
#' @description A list of data summarising the exoplanet database. The goal of
#' this function is to provide the information found here
#' <\url{https://exoplanetarchive.ipac.caltech.edu/docs/counts_detail.html}>.
#'
#' @param quiet If FALSE, suppress query message.
#' @return An object of class \code{data.frame}.
#' @export
exo_summary <- function(quiet = FALSE) {
  exo_cols <- c(exo_columns("exoplanets", quiet = quiet), "pl_masse", "pl_rade")

  df_exo <- exo("exoplanets", exo_cols, quiet = quiet)
  df_cumulative <- exo("cumulative", quiet = quiet)
  df_k2_can <- exo("k2candidates", quiet = quiet)

  counts_summary <- list(
    all_exoplanets = nrow(df_exo),
    confirmed_planets_with_kepler_light_curves_for_stellar_host = nrow(df_exo[df_exo[["pl_kepflag"]] == 1, ]),
    confirmed_planets_discovered_by_kepler = nrow(df_exo[df_exo[["pl_facility"]] == "Kepler", ]),
    kepler_project_candidates_yet_to_be_confirmed = table(grepl("can", df_cumulative[["koi_disposition"]], ignore.case = TRUE))[["TRUE"]],
    confirmed_planets_with_k2_light_curves_for_stellar_host = nrow(df_exo[df_exo[["pl_k2flag"]] == 1, ]),
    confirmed_planets_discovered_by_k2 = nrow(df_exo[df_exo[["pl_facility"]] == "K2", ]),
    k2_candidates_yet_to_be_confirmed = table(grepl("can", df_k2_can[df_k2_can[["k2c_recentflag"]] == 1, ][["k2c_disp"]], ignore.case = TRUE))[["TRUE"]],
    confirmed_planets_discovered_by_tess = table(grepl("tess", df_exo[["pl_facility"]], ignore.case = TRUE))[["TRUE"]]
  )

  discovery_summary <- as.list(table(df_exo[["pl_discmethod"]]))

  mass_summary <- as.list(table(
    cut(
      x = df_exo$pl_masse,
      breaks = c(0, 3, 10, 30, 100, 300, Inf),
      labels = c(
        "M <= 3 M_Earth",
        "3 < M <= 10 M_Earth",
        "10 < M <= 30 M_Earth",
        "30 < M <= 100 M_Earth",
        "100 < M <= 300 M_Earth",
        "300 M_Earth < M"
      )
    )
  ))

  radius_summary <- as.list(table(
    cut(
      x = df_exo$pl_rade,
      breaks = c(0, 1.25, 2, 6, 15, Inf),
      labels = c(
        "R <= 1.25 R_Earth",
        "1.25 < R <= 2 R_Earth",
        "2 < R <= 6 R_Earth",
        "6 < R <= 15 R_Earth",
        "15 R_Earth < R"
      )
    )
  ))

  x <- list(
    counts_summary = counts_summary,
    discovery_summary = discovery_summary,
    mass_summary = mass_summary,
    radius_summary = radius_summary
  )

  lapply(x, function(x) tibble::as_tibble(utils::stack(x)[2:1]))
}
