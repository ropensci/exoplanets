#' Access column names for each table
#'
#' @description Simply pull column names for a specified table. You can either
#' pull the default columns assigned to a table or all columns.
#' @param table The name of the table, see \code{exo_tables} for all available
#' table names.
#' @param cols Either "default" for default columns, "all" for all columns,
#' defaults to "default".
#' @param quiet If FALSE, suppress query message.
#' @return A character vector containing column names for the respective table
#' @export
exo_columns <- function(table = "exoplanets", cols = "default", quiet = FALSE) {
  if (cols == "default") {
    x <- paste0(base_url(), "table=", table, "&getDefaultColumns&format=csv")
    names(fetch_data(x, quiet = quiet))
  } else if(cols == "all") {
    x <- paste0(base_url(), "table=", table, "&getAllColumns&format=csv")
    names(fetch_data(x, quiet = quiet))
  }
}
