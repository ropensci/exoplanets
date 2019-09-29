#' Access NASA's Exoplanet Archive by URL
#'
#' @description Access NASA's Exoplanet Archive by URL. For a list of example
#' queries, see the documentation,
#' \url{https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html}.
#' @param query The full query URL. At this time, the only supported format
#' is CSV. If utilizing SQL, do not worry about spaces or single quotes, these
#' are escaped automatically.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @return A \code{data.frame} containing data for the respective table
#' @export
exo_raw <- function(query, progress = TRUE, col_spec = FALSE) {
  if(is.null(query))
    stop("Please provide a valid query")

  query <- gsub(" ", "%20", query)
  query <- gsub("'", "%27", query)
  get_exo(query, progress = progress, col_spec = col_spec)
}

#' Access NASA's Exoplanet Archive by Table
#'
#' @description Access NASA's Exoplanet Archive by table name. For a list of
#' all available tables, see \code{exo_tables}.
#' @param table The name of the table, see \code{exo_tables} for all available table
#' names.
#' @param cols Either "default" for default columns, "all" for all columns or
#' individual column names.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @return A \code{data.frame} containing data for the respective table
#' @export
exo <- function(table = "exoplanets", cols = "default", progress = TRUE, col_spec = FALSE) {
  base_url <- base_url()

  cols <- paste0(cols, collapse = ",")

  if(cols == "default") {
    x <- paste0(base_url, "table=", table)
    get_exo(x, progress = progress, col_spec = col_spec)
  } else if(cols == "all") {
    x <- paste0(base_url, "table=", table, "&select=*")
    get_exo(x, progress = progress, col_spec = col_spec)
  } else {
    x <- paste0(base_url, "table=", table, "&select=", cols)
    get_exo(x, progress = progress, col_spec = col_spec)
  }
}

#' Access column names for each table
#'
#' @description Simply pull column names for a specified table. You can either
#' pull the default columns assigned to a table or all columns.
#' @param table The name of the table, see \code{exo_tables} for all available
#' table names.
#' @param cols Either "default" for default columns, "all" for all columns,
#' defaults to "default".
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @return A character vector containing column names for the respective table
#' @export
exo_column_names <- function(table = "exoplanets", cols = "default", progress = TRUE, col_spec = FALSE) {
  base_url <- base_url()

  if(cols == "default") {
    x <- paste0(base_url, "table=", table, "&getDefaultColumns&format=csv")
    names(get_exo(x, progress = progress, col_spec = col_spec))
  } else if(cols == "all") {
    x <- paste0(base_url, "table=", table, "&getAllColumns&format=csv")
    names(get_exo(x, progress = progress, col_spec = col_spec))
  }
}

#' Exoplanet Summary
#'
#' @description A list of data summarising the exoplanet database. The goal of
#' this function is to provide the information found here
#' <\url{https://exoplanetarchive.ipac.caltech.edu/docs/counts_detail.html}>. By
#' default, a list is returned but a \code{data.frame} can be returned with
#' \code{output = "dataframe"}.
#'
#' @param output One of \code{list} or \code{dataframe}, defaults to list.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @return An object of class \code{list} or \code{data.frame}.
#' @export
exo_summary <- function(output = "list", progress = TRUE, col_spec = FALSE) {
  exo_cols <- c(exo_column_names("exoplanets", progress = progress, col_spec = col_spec), "pl_masse", "pl_rade")

  df_exo <- exo("exoplanets", exo_cols, progress = progress, col_spec = col_spec)
  df_cumulative <- exo("cumulative", progress = progress, col_spec = col_spec)
  df_k2_can <- exo("k2candidates", progress = progress, col_spec = col_spec)

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

  switch (output,
    "list" = x,
    "dataframe" = lapply(x, function(x) utils::stack(x)[2:1]),
    {
      warning("Output must be one of 'list' of 'dataframe', not '", output, "'")
      x
    }
  )

}

#' SuperWASP Time Series Table
#'
#' The NASA Exoplanet Archive provides access to the public SuperWASP light
#' curves from Data Release One. See the SuperWASP page for more information
#' on the SuperWASP data products available at the NASA Exoplanet Archive.
#' The following table lists all of the data columns in the SuperWASP Time
#' Series table (superwasptimeseries) that can be returned through the
#' Exoplanet Archive's Application Programming Interface (API).
#'
#' @param tile Survey Tile, subdivision of DR1 targets for survey processing,
#' tile168060 for example.
#' @param sourceid SuperWASP Object ID, 1SWASP J191645.46+474912.3 for example.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @export
exo_wasp <- function(tile = NULL, sourceid = NULL, progress = TRUE,
                     col_spec = FALSE) {
  params <- c(tile = tile, sourceid = sourceid)
  if (!is.null(tile) && !is.null(sourceid))
    stop(paste("Only one of tile or sourceid can be provided, not both."))
  else if (is.null(tile) && is.null(sourceid))
    stop(paste("One of tile or sourceid must be provided."))

  base_url <- base_url()
  table <- "&table=superwasptimeseries&"
  x <- paste0(base_url, table, names(params), "=", params)
  exo_raw(x, progress, col_spec)
}

#' KELT light curves (not including KELT Praesepe data)
#'
#' The NASA Exoplanet Archive provides access to KELT time series through a
#' search interface and the application programming interface (API). The
#' following table lists all the data columns in the KELT Time Series table
#' (kelttimeseries) that can be returned through the API. See the KELT page
#' for more information on the KELT data products available at the NASA
#' Exoplanet Archive.
#'
#' @param kelt_field KELT field of observation. Fields available are N02, N04,
#' N06, N08, N10 and N12.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
#' @export
exo_kelt <- function(kelt_field = NULL, progress = TRUE, col_spec = FALSE) {
  if(is.null(kelt_field))
    stop("Missing value for kelt_field.")

  param <- c(kelt_field = kelt_field)
  base_url <- base_url()
  table <- "&table=kelttimeseries&"
  x <- paste0(base_url, table, names(param), "=", param)
  exo_raw(x, progress, col_spec)
}

#' Kepler Time Series Table
#'
#' The NASA Exoplanet Archive provides access to the public Kepler light
#' curves as they are released to the community. The primary mission archive
#' to all Kepler data is provided by MAST at STScI. The NASA Exoplanet Archive
#' also serves Kepler Objects of Interest (KOIs). See the Kepler Mission
#' Summary Page for more information on the Kepler mission data products
#' available at the NASA Exoplanet Archive. The following table lists all of
#' the data columns in the Kepler Time Series table (keplertimeseries) that
#' can be returned through the Exoplanet Archive's Application Programming
#' Interface (API).
#'
#' @param quarter Kepler operates observing campaigns in 'quarters' with
#' durations of ~90 days, including safe mode and other interruptions to the
#' data collection. After the conclusion of a quarter, the spacecraft is
#' rotated 90 degrees to compensate for the orbital motion of the spacecraft.
#' Quarter 0 and 1 were shorter, 10 and 33 days in duration respectively.
#' @param kepid Kepler Input Catalog Number, 8561063 for example.
#' @param progress If FALSE, suppresses progress of request (unix OS only).
#' @param col_spec If FALSE, suppresses column specification message from
#' \code{readr} (unix OS only).
exo_kepler <- function(quarter = NULL, kepid = NULL, progress = TRUE,
                       col_spec = FALSE) {
  params <- c(quarter = quarter, kepid = kepid)
  if (!is.null(quarter) && !is.null(kepid))
    stop(paste("Only one of quarter or kepid can be provided, not both."))
  else if (is.null(quarter) && is.null(kepid))
    stop(paste("One of quarter or kepid must be provided."))

  base_url <- base_url()
  table <- "&table=keplertimeseries&"
  x <- paste0(base_url, table, names(params), "=", params)
  exo_raw(x, progress, col_spec)
}


#' All Available Tables
#'
#' @description This dataset provides a list of all available tables and
#' their names, convenient for calling on tables when using \code{exo()}.
#' Please note that a few tables require additional parameters. For example,
#' the \code{keplertimeseries} table requires either the quarter or a Kepler
#' ID must be specified, e.g. \code{exo("keplertimeseries&quarter=14")}.
#' This requirements only occurs for a small number of tables, mostly time
#' series.
"exo_tables"
