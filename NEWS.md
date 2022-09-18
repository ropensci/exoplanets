# exoplanets 0.2.3

# exoplanets 0.2.2

* `tableinfo` has been updated to include additional tables.

# exoplanets 0.2.1

## Breaking changes

* The `progress` parameter in `exoplanets` is no longer available. It has been replaced as an option that can be set with `options`.

## Minor improvements

* Added `forget_exoplanets` to clear the `exoplanets` cache.
* Added package level documentation with `usethis::use_package_doc`.
* Added `limit` parameter to `exoplanets`.
* Added `quiet` option to suppress progress and query message.
* Cleaned up `tableinfo` to remove trailing spaces and other small improvements.

# exoplanets 0.2.0

* Complete rewrite to work with the new TAP service: https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html
* No longer supporting the older API: https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html
* Use of `httr` for progress indicators and better request handling.
* Added `tableinfo` dataset for table and column information.
* Removed all `exo_` functions, added `exoplanets` as a single function for extracting data.
* Added memoization to `exoplanets`.
* Using `httptest` to avoid potential CRAN errors when checking the package.
* Precompiled vignettes to avoid potential CRAN errors when checking the package.
* Transferred ownership to ropensci organization.

# exoplanets 0.1.0

* Added a `NEWS.md` file to track changes to the package.
