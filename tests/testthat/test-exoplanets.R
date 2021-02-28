test_that("exoplanets works", {
  # This test grabs a random table (excluding time series tables because
  # they are large) and confirms that a data.frame was successfully created.
  # For speed, only the first column is taken.

  # set up
  non_time_series <- names(exo_tables)[-which(grepl("timeseries|alias", names(exo_tables)))]
  random_tbl <- sample(non_time_series, 1)
  random_tbl_cols <- exo_columns(random_tbl, cols = "default")
  test <- paste0(random_tbl, "&select=distinct%20", random_tbl_cols[1])
  exo_output <- class(exo(test))
  exo_raw_output <- class(exo_raw(paste0("https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=", test)))
  exo_cols_default <- exo_columns()
  exo_cols_all <- exo_columns(cols = "all")
  df_db_summary <- exo_summary()
  df_timeseries <- exo_wasp(sourceid = "1SWASP J191645.46+474912.3")

  # tests
  expect_true(any(exo_output == "data.frame"))
  expect_equal(class(exo_tables), "list")
  expect_true(any(exo_raw_output == "data.frame"))
  expect_error(exo_raw(NULL))
  expect_equal(class(exo_cols_default), "character")
  expect_true(length(exo_cols_default) > 1)
  expect_true(length(exo_cols_default) < length(exo_cols_all))
  expect_equal(unique(lapply(df_db_summary, class))[[1]], c("tbl_df", "tbl", "data.frame"))
  expect_equal(ncol(exo("cumulative", "kepid")), 1)
  expect_true(any(class(df_timeseries) == "data.frame"))
  expect_error(exo_kepler(tile = "cant have", sourceid = "both!"))
  expect_error(exo_kepler(quarter = "still cant have", kepid = "both!"))
})
