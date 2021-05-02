library(rvest)
library(dplyr)
library(purrr)
library(janitor)
library(stringr)

r <- "https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html" %>%
  read_html() %>%
  html_nodes("table.half_table")

tables <- r %>%
  html_table() %>%
  .[[1]] %>%
  select(X1, X2) %>%
  set_names("title", "table")

links <- r %>%
  html_nodes("a") %>%
  html_attr("href")

tables$link <- paste0("https://exoplanetarchive.ipac.caltech.edu", links)

get_table_info <- function(link) {
  link %>%
    read_html() %>%
    html_table() %>%
    map(clean_names) %>%
    bind_rows() %>%
    mutate_if(is.character, str_squish) %>%
    mutate(default = case_when(
      str_detect(database_column_name, "†") ~ TRUE,
      TRUE ~ FALSE
    )) %>%
    mutate(database_column_name = str_remove(database_column_name, "†"))
}

tableinfo <- lapply(tables$link, get_table_info)

names(tableinfo) <- tables$table

tableinfo <- bind_rows(tableinfo, .id = "table")

usethis::use_data(tableinfo, overwrite = TRUE)
