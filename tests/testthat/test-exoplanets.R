test_that("multiplication works", {
  # This test grabs a random table (excluding time series tables because
  # they are large) and confirms that a data.frame was successfully created.
  # Some datasets are larger than others and so this test can take awhile,
  # longest at the moment was 31 seconds. Maybe using httr would be helpful to
  # make the test quicker.
  non_time_series <- names(tbls)[-which(grepl("timeseries", names(tbls)))]
  random_tbl <- sample(non_time_series, 1)
  exo_output <- class(exo(random_tbl))
  exo_raw_output <- class(exo_raw("https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets"))
  expect_equal(exo_output, "data.frame")
  expect_equal(class(tbls), "list")
  expect_equal(exo_raw_output, "data.frame")
  expect_error(exo_raw())
})
