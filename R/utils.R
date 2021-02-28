fetch_data <- function(x, quiet) {
  if (!quiet) message("* <", x, ">")
  tibble::as_tibble(utils::read.csv(x))
}

base_url <- function() {
  "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?"
}
