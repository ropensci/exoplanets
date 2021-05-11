#' Clear the exoplanets cache
#'
#' Forget past results and reset the \code{exoplanets} cache.
#'
#' @examples
#' if (interactive()) {
#'   system.time(exoplanets("k2names"))
#'   system.time(exoplanets("k2names"))
#'   forget_exoplanets()
#'   system.time(exoplanets("k2names"))
#' }
#'
#' @export
forget_exoplanets <- function() {
  memoise::forget(exoplanets)
}
