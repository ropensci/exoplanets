#' Access NASA's Exoplanet Archive by Table
#'
#' @description Access NASA's Exoplanet Archive by table name. For a list of
#' all available tables, see \code{exo_tables}.
#' @param table The name of the table, see \code{exo_tables} for all available table
#' names.
#' @param cols Either "default" for default columns, "all" for all columns or
#' individual column names.
#' @param quiet If FALSE, suppress query message.
#' @return A \code{data.frame} containing data for the respective table
#' @export
exo <- function(table = "exoplanets", cols = "default", quiet = FALSE) {
  cols <- paste0(cols, collapse = ",")

  if (cols == "default") {
    x <- paste0(base_url(), "table=", table)
    fetch_data(x, quiet = quiet)
  } else if(cols == "all") {
    x <- paste0(base_url(), "table=", table, "&select=*")
    fetch_data(x, quiet = quiet)
  } else {
    x <- paste0(base_url(), "table=", table, "&select=", cols)
    fetch_data(x, quiet = quiet)
  }
}
