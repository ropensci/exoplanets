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
#' @param quiet If FALSE, suppress query message.
#' @export
exo_kelt <- function(kelt_field = NULL, quiet = FALSE) {
  if(is.null(kelt_field))
    stop("Missing value for kelt_field.")

  param <- c(kelt_field = kelt_field)
  table <- "&table=kelttimeseries&"
  x <- paste0(base_url(), table, names(param), "=", param)
  exo_raw(x, quiet)
}
