#' Access NASA's Exoplanet Archive by URL
#'
#' @description Access NASA's Exoplanet Archive by URL. For a list of example
#' queries, see the documentation, <https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html>
#' @param query The full query URL. At this time, the only supported format
#' is CSV. If utilizing SQL, do not worry about spaces or single quotes, these
#' are escaped automatically.
#' @examples
#' qry <- "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets"
#' exoplanets <- exo_raw(qry)
#' @export
exo_raw <- function(query) {
  if(is.null(query))
    stop("Please provide a valid query")

  query <- gsub(" ", "%20", query)
  query <- gsub("'", "%27", query)
  utils::read.csv(query, stringsAsFactors = FALSE)
}

#' Access NASA's Exoplanet Archive by Table
#'
#' @description Access NASA's Exoplanet Archive by table name. For a list of
#' all available tables, see \code{tbls}.
#' @param table The name of the table, see \code{tbls} for all available table
#' names.
#' @param cols Either "default" for default columns, "all" for all columns or
#' individual column names separated by a comma, defaults to "default".
#' default set, defaults to TRUE.
#' @examples
#' exoplanets <- exo("exoplanets")
#' k2candidates <- exo("k2candidates")
#' @export
exo <- function(table = "exoplanets", cols = "default") {
  base_url <- "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?"

  if(cols == "default") {
    utils::read.csv(paste0(base_url, "table=", table), stringsAsFactors = FALSE)
  } else if(cols == "all") {
    utils::read.csv(paste0(base_url, "table=", table, "&select=*"), stringsAsFactors = FALSE)
  } else {
    cols <- gsub(" ", "", cols)
    utils::read.csv(paste0(base_url, "table=", table, "&select=", cols), stringsAsFactors = FALSE)
  }
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
"tbls"
