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
#' @param quiet If FALSE, suppress query message.
#' @export
exo_wasp <- function(tile = NULL, sourceid = NULL, quiet = FALSE) {
  params <- c(tile = tile, sourceid = sourceid)
  if (!is.null(tile) && !is.null(sourceid))
    stop(paste("Only one of tile or sourceid can be provided, not both."))
  else if (is.null(tile) && is.null(sourceid))
    stop(paste("One of tile or sourceid must be provided."))

  table <- "&table=superwasptimeseries&"
  x <- paste0(base_url(), table, names(params), "=", params)
  exo_raw(x, quiet)
}
