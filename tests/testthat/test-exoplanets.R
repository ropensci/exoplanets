# remove all messages from `exoplanets` for a clean test log
quiet <- function(x) {
  sink(tempfile())
  on.exit(sink())
  suppressMessages(invisible(force(x)))
}

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

with_mock_dir("exoplanets-default", {
  test_that("exoplanets default works", {
    expect_true("data.frame" %in% class(quiet(exoplanets("k2names"))))
  })
})

with_mock_dir("exoplanets-csv", {
  test_that("exoplanets csv works", {
    expect_true("data.frame" %in% class(quiet(exoplanets("k2names", format = "csv"))))
  })
})

with_mock_dir("exoplanets-tsv", {
  test_that("exoplanets tsv works", {
    expect_true("data.frame" %in% class(quiet(exoplanets("k2names", format = "tsv"))))
  })
})

with_mock_dir("exoplanets-json", {
  test_that("exoplanets json works", {
    expect_true("list" %in% class(quiet(exoplanets("k2names", format = "json"))))
  })
})

# ----

with_mock_dir("exoplanets-default-select", {
  test_that("exoplanets default works when selecting", {
    r <- quiet(exoplanets("k2names", c("epic_id", "k2_name")))
    expect_true("data.frame" %in% class(r))
    expect_true(all(c("epic_id", "k2_name") %in% names(r)))
  })
})

with_mock_dir("exoplanets-csv-select", {
  test_that("exoplanets csv works when selecting", {
    r <- quiet(exoplanets("k2names", c("epic_id", "k2_name"), format = "csv"))
    expect_true("data.frame" %in% class(r))
    expect_true(all(c("epic_id", "k2_name") %in% names(r)))
  })
})

with_mock_dir("exoplanets-tsv-select", {
  test_that("exoplanets tsv works when selecting", {
    r <- quiet(exoplanets("k2names", c("epic_id", "k2_name"), format = "tsv"))
    expect_true("data.frame" %in% class(r))
    expect_true(all(c("epic_id", "k2_name") %in% names(r)))
  })
})

with_mock_dir("exoplanets-json-select", {
  test_that("exoplanets json works when selecting", {
    r <- quiet(exoplanets("k2names", c("epic_id", "k2_name"), format = "json"))
    expect_true("list" %in% class(r))
    expect_true(all(c("epic_id", "k2_name") %in% unique(unlist(lapply(r, names)))))
  })
})
