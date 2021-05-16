# exoplanets (development version)

* Added `forget_exoplanets` to clear the `exoplanets` cache.
* Added pacakge level documentation with `usethis::use_package_doc`.
* Added `limit` parameter to `exoplanets`.
* Removed the `progress` parameter from `exoplanets` in favor of using `options`. Most people will prefer to either turn progress on or off entirely, so setting the option globally seems like a better user experience.
* Added `quiet` option to surpress progress and query message.

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
