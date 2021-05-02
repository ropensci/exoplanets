parse_url <- function(table, columns, format) {
  if (!format %in% FORMATS) {
    stop("Expected formats are:", paste0("\n* ", FORMATS), call. = FALSE)
  }

  columns <- paste0(columns, collapse = ",")
  query <- paste0("select+", columns, "+from+", table, "&format=", format)
  url <- paste0(BASE, query)
  type <- switch (format,
    "csv" = "text/csv",
    "tsv" = "text/tab-separated-values",
    "json" = "application/json"
  )
  list(
    url = url,
    query = query,
    table = table,
    columns = columns,
    format = format,
    type = type
  )
}

fetch_data <- function(table, columns, format, progress) {
  url <- parse_url(table, columns, format)
  cli::cat_bullet(BASE, cli::style_bold(url$query))

  if (progress) {
    r <- httr::GET(url$url, httr::progress())
  } else {
    r <- httr::GET(url$url)
  }

  httr::stop_for_status(r)
  httr::content(
    x = r,
    type = url$type,
    encoding = "UTF-8"
  )
}

#' Retrieve Data from NASAs Exoplanet Archive
#'
#' A simple interface for accessing exoplanet data. At the bare minimum, a table
#' name is required. Tables names are documented in the `tap` dataset.
#'
#' @param table A table name
#' @param columns A vector of valid column names, by default will return all columns
#' @param format Desired format, either csv, tsv, or json
#' @param progress Whether or not to display the progress of the request
#'
#' @examples
#' if (interactive()) {
#'   exoplanets("ps", columns = c("pl_name", "pl_massj"))
#' }
#'
#' @export
exoplanets <- function(table, columns = NULL, format = "csv", progress = TRUE) {
  if (is.null(columns)) columns <- "*"
  fetch_data(table, columns, format, progress)
}
