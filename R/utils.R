quiet <- function(x) {
  sink(tempfile())
  on.exit(sink())
  suppressMessages(force(x))
}
