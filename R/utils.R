detect_os <- function() {
  switch(Sys.info()[['sysname']],
    Windows = "windows",
    Linux   = "linux",
    Darwin  = "macos"
  )
}

get_exo_unix <- function(x, progress = TRUE, col_spec = TRUE) {
  if (progress) {
    response <- httr::GET(x, httr::progress())
    cat("\n")
  }
  else {
    response <- httr::GET(x)
  }

  if (col_spec)
    httr::content(
      response,
      type = "text/csv",
      encoding = "UTF-8"
    )
  else
    httr::content(
      response,
      type = "text/csv",
      encoding = "UTF-8",
      col_types = readr::cols()
    )
}

get_exo_windows <- function(x) {
  utils::read.csv(x)
}

get_exo <- function(x, progress = TRUE, col_spec = TRUE) {
  os <- detect_os()

  switch (os,
    "windows" = get_exo_windows(x),
    get_exo_unix(x, progress, col_spec)
  )
}

base_url <- function() {
  "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?"
}
