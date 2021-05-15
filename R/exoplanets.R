parse_url <- function(table, columns, limit, format) {
  if (!format %in% FORMATS) {
    stop("Expected formats are:", paste0("\n* ", FORMATS), call. = FALSE)
  }

  columns <- paste0(columns, collapse = ",")
  q_lim <- ifelse(limit == Inf, "", paste0("+top+", limit))
  query <- paste0("select+", columns, "+from+", table, q_lim, "&format=", format)
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
    limit = limit,
    format = format,
    type = type
  )
}

fetch_data <- function(table, columns, limit, format, progress) {
  url <- parse_url(table, columns, limit, format)
  cli::cat_bullet(BASE, cli::style_bold(url$query))

  if (progress) {
    r <- httr::RETRY("GET", url$url, httr::progress())
  } else {
    r <- httr::RETRY("GET", url$url)
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
#' name is required. Tables names are documented in the `tableinfo` dataset.
#'
#' At one time, this package used the Exoplanet Archive Application Programming
#' Interface (API). Since then, a handful of tables have been transitioned to
#' the Table Access Protocol (TAP) service. More tables will be transitioned to
#' TAP and as such, this package only supports queries from TAP. For more
#' information, you can read
#' \url{https://exoplanetarchive.ipac.caltech.edu/docs/exonews_archive.html#29April2021.}
#'
#' @param table A table name, see `tableinfo`
#' @param columns A vector of valid column names, by default will return all default columns, see `tableinfo`
#' @param limit Number of rows to return. Defaulted to `Inf`, which returns all data in table.
#' @param format Desired format, either csv, tsv, or json
#' @param progress Whether or not to display the progress of the request
#'
#' @source \url{https://exoplanetarchive.ipac.caltech.edu/}
#' @seealso tableinfo
#' @returns
#' A \code{data.frame} if \code{format="csv"} or \code{format="tsv"}.
#' A \code{list} if \code{format="json"}.
#'
#' @examples
#' if (interactive()) {
#'   # request all default columns from the `ps` table
#'   exoplanets("ps")
#'
#'   # request the planet name and discovery method from the `ps` table
#'   exoplanets("ps", c("pl_name", "discoverymethod"))
#'
#'   # request the first 5 rows from the `keplernames` table
#'   exoplanets("keplernames", "*", limit = 5)
#'
#'   # request in json format (returns list)
#'   exoplanets("ps", c("pl_name", "discoverymethod"), format = "json")
#'
#'   # hide progress information
#'   exoplanets("k2names", progress = FALSE)
#' }
#'
#' @export
exoplanets <- function(table, columns = NULL, limit = Inf, format = "csv", progress = TRUE) {
  if (is.null(columns)) columns <- "*"
  fetch_data(table, columns, limit, format, progress)
}
