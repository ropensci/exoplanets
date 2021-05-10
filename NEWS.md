# exoplanets (development version)

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
