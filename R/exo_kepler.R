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
#' @param quiet If FALSE, suppress query message.
#' @export
exo_kepler <- function(quarter = NULL, kepid = NULL, quiet = FALSE) {
  params <- c(quarter = quarter, kepid = kepid)
  if (!is.null(quarter) && !is.null(kepid))
    stop(paste("Only one of quarter or kepid can be provided, not both."))
  else if (is.null(quarter) && is.null(kepid))
    stop(paste("One of quarter or kepid must be provided."))

  table <- "&table=keplertimeseries&"
  x <- paste0(base_url(), table, names(params), "=", params)
  exo_raw(x, quiet)
}
