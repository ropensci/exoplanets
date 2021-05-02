.onLoad <- function(libname, pkgname) {
  exoplanets <<- memoise::memoise(exoplanets)
}
