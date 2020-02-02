fetch_with_httr <- function(x, progress = TRUE) {
  if (progress) {
    response <- httr::GET(x, httr::progress())
    cat("\n")
  } else {
    response <- httr::GET(x)
  }

  httr::content(
    x = response,
    type = "text/csv",
    encoding = "UTF-8",
    col_types = readr::cols()
  )
}

fetch_with_base <- function(x) {
  utils::read.csv(x)
}

fetch_data <- function(x, progress = TRUE) {
  tryCatch(fetch_with_httr(x, progress),
    error = function(c) fetch_with_base(x)
  )
}

base_url <- function() {
  "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?"
}
