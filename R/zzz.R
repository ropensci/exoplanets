.onLoad <- function(libname, pkgname) {
  exo <<- memoise::memoise(exo)
  exo_columns <<- memoise::memoise(exo_columns)
  exo_kelt <<- memoise::memoise(exo_kelt)
  exo_kepler <<- memoise::memoise(exo_kepler)
  exo_raw <<- memoise::memoise(exo_raw)
  exo_summary <<- memoise::memoise(exo_summary)
  exo_wasp <<- memoise::memoise(exo_wasp)
}
