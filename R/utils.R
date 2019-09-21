get_exo <- function(x, progress = TRUE, col_spec = TRUE) {
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
