.onLoad <- function(libname, pkgname) {
  # modifies packages namespace (not global environment)
  exoplanets <<- memoise::memoise(exoplanets)

  # allows setting custom options for this package
  op <- options()
  op.exoplanets <- list(
    exoplanets.quiet = FALSE,
    exoplanets.progress = TRUE
  )
  toset <- !(names(op.exoplanets) %in% names(op))
  if(any(toset)) options(op.exoplanets[toset])
}
