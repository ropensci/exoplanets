fetch_data <- function(x, quiet) {
  if (!quiet) message("* <", x, ">")
  tryCatch(
    expr = {
      tibble::as_tibble(httr::content(
        x = httr::GET(x),
        type = "text/csv",
        encoding = "UTF-8",
        col_types = readr::cols()
      ))
    },
    error = function(e) {
      tibble::as_tibble(utils::read.csv(x))
    }
  )
}

base_url <- function() {
  "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?"
}
