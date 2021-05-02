r <- httr::GET("https://exoplanetarchive.ipac.caltech.edu/docs/Exoplanet_Archive_Column_Mapping_CSV.csv")
df <- httr::content(r, encoding = "UTF-8")

parse_table_info <- function(x) {
  table_name <- unlist(x[1, 1], use.names = FALSE)
  table <- x[-c(1, 2), ]
  names(table) <- c("column", "description")
  table$table <- table_name
  table[c("table", "column", "description")]
}

i <- 1:ncol(df)
idx <- split(i, ceiling(seq_along(i) / 2))

tableinfo <- dplyr::bind_rows(lapply(idx, function(j) {
  parse_table_info(df[j])
}))

usethis::use_data(tableinfo, overwrite = TRUE)
