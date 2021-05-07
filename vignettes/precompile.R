# Code here is used to precompile the 'getting started' vignette

# remove old image
old_img <- list.files("vignettes", pattern = "^exoplanets_vignette.*png", full.names = TRUE)
file.remove(old_img)

# precompile the rmd
knitr::knit("vignettes/exoplanets.Rmd.orig", "vignettes/exoplanets.Rmd")

# copy new image from root, to vignette folder
new_img <- list.files(".", pattern = "^exoplanets_vignette.*png", full.names = TRUE)
file.copy(new_img, "vignettes/")

# remove new image from root
file.remove(new_img)
