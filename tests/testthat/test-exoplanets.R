test_that("parse_url works", {
  # test errors when required parameters aren't given
  expect_error(parse_url())
  expect_error(parse_url("ps"))
  expect_error(parse_url("ps", "*"))

  # test csv url parsing
  x <- parse_url("ps", "*", "csv")
  expect_equal(x$table, "ps")
  expect_equal(x$columns, "*")
  expect_equal(x$format, "csv")
  expect_equal(x$type, "text/csv")
  expect_equal(x$query, "select+*+from+ps&format=csv")
  expect_equal(x$url, "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+*+from+ps&format=csv")

  # test json url parsing
  x <- parse_url("k2names", c("epic_id", "k2_name"), "json")
  expect_equal(x$table, "k2names")
  expect_equal(x$columns, "epic_id,k2_name")
  expect_equal(x$format, "json")
  expect_equal(x$type, "application/json")
  expect_equal(x$query, "select+epic_id,k2_name+from+k2names&format=json")
  expect_equal(x$url, "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+epic_id,k2_name+from+k2names&format=json")

  # test tsv url parsing
  x <- parse_url("k2names", c("epic_id", "k2_name"), "tsv")
  expect_equal(x$table, "k2names")
  expect_equal(x$columns, "epic_id,k2_name")
  expect_equal(x$format, "tsv")
  expect_equal(x$type, "text/tab-separated-values")
  expect_equal(x$query, "select+epic_id,k2_name+from+k2names&format=tsv")
  expect_equal(x$url, "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+epic_id,k2_name+from+k2names&format=tsv")
})


