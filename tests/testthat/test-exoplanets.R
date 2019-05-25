test_that("multiplication works", {
  # This test grabs a random table (excluding time series tables because
  # they are large) and confirms that a data.frame was successfully created.
  # For speed, only the first column is taken.

  # set up
  non_time_series <- names(tbls)[-which(grepl("timeseries", names(tbls)))]
  random_tbl <- sample(non_time_series, 1)
  random_tbl_cols <- exo(paste0(random_tbl, "&getDefaultColumns"))
  test <- paste0(random_tbl, "&select=", names(random_tbl_cols[1]))
  exo_output <- class(exo(test))
  exo_raw_output <- class(exo_raw(paste0("https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=", test)))

  # tests
  expect_equal(exo_output, "data.frame")
  expect_equal(class(tbls), "list")
  expect_equal(exo_raw_output, "data.frame")
  expect_error(exo_raw())
})
