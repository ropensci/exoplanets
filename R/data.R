#' All Available Tables
#'
#' @description This dataset provides a list of all available tables and
#' their names, convenient for calling on tables when using \code{exo()}.
#' Please note that a few tables require additional parameters. For example,
#' the \code{keplertimeseries} table requires either the quarter or a Kepler
#' ID must be specified, e.g. \code{exo("keplertimeseries&quarter=14")}.
#' This requirements only occurs for a small number of tables, mostly time
#' series.
"exo_tables"
