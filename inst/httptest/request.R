function (request) {
  gsub_request(request, "https://exoplanetarchive.ipac.caltech.edu/TAP/", "r/", fixed=TRUE)
}
