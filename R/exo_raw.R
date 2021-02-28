#' Access NASA's Exoplanet Archive by URL
#'
#' @description Access NASA's Exoplanet Archive by URL. For a list of example
#' queries, see the documentation,
#' \url{https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html}.
#' @param query The full query URL. At this time, the only supported format
#' is CSV. If utilizing SQL, do not worry about spaces or single quotes, these
#' are escaped automatically.
#' @param quiet If FALSE, suppress query message.
#' @return A \code{data.frame} containing data for the respective table
#' @export
exo_raw <- function(query, quiet = TRUE) {
  if(is.null(query))
    stop("Please provide a valid query")

  query <- gsub(" ", "%20", query)
  query <- gsub("'", "%27", query)
  fetch_data(query, quiet)
}
