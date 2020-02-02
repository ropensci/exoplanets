## Resubmission
This is a resubmission. In this version I have:

* Converted the DESCRIPTION title to title case.

* Implemented a tryCatch when fetching data from the API. There were cases where the function would fail when using curl but pass when using read.csv from base, see https://github.com/jeroen/curl/issues/206.
