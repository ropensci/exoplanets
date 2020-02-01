
<!-- README.md is generated from README.Rmd. Please edit that file -->

# exoplanets <img src="man/figures/logo.png" align="right" height=150/>

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/tyluRp/exoplanets.svg?branch=master)](https://travis-ci.org/tyluRp/exoplanets)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/tyluRp/exoplanets?branch=master&svg=true)](https://ci.appveyor.com/project/tyluRp/exoplanets)
[![R build
status](https://github.com/tyluRp/exoplanets/workflows/R-CMD-check/badge.svg)](https://github.com/tyluRp/exoplanets)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/exoplanets/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/exoplanets?branch=master)
<!-- badges: end -->

The goal of exoplanets is to provide access to [NASA’s Exoplanet
Archive](https://exoplanetarchive.ipac.caltech.edu/index.html) database
in R. The functionality of this package is fairly minimal and is simply
an R interface to access exoplanet data in the following ways:

  - By providing a table name using `exo`
  - By providing a query URL using `exo_raw`
  - By summarising the database using `exo_summary`

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("tylurp/exoplanets")
```

## Example

This is a basic example which shows you how to access data from the
exoplanet table:

``` r
library(exoplanets)

exo(table = "exoplanets")
#> # A tibble: 4,116 x 82
#>    pl_hostname pl_letter pl_name pl_discmethod pl_controvflag pl_pnum
#>    <chr>       <chr>     <chr>   <chr>                  <dbl>   <dbl>
#>  1 HD 128311   c         HD 128… Radial Veloc…              0       2
#>  2 HD 129445   b         HD 129… Radial Veloc…              0       1
#>  3 HD 130322   b         HD 130… Radial Veloc…              0       1
#>  4 HD 131496   b         HD 131… Radial Veloc…              0       1
#>  5 HD 132406   b         HD 132… Radial Veloc…              0       1
#>  6 HD 132563   b         HD 132… Radial Veloc…              0       1
#>  7 HD 131664   b         HD 131… Radial Veloc…              0       1
#>  8 HD 134987   b         HD 134… Radial Veloc…              0       2
#>  9 HD 134987   c         HD 134… Radial Veloc…              0       2
#> 10 HD 136418   b         HD 136… Radial Veloc…              0       1
#> # … with 4,106 more rows, and 76 more variables: pl_orbper <dbl>,
#> #   pl_orbpererr1 <dbl>, pl_orbpererr2 <dbl>, pl_orbperlim <dbl>,
#> #   pl_orbpern <dbl>, pl_orbsmax <dbl>, pl_orbsmaxerr1 <dbl>,
#> #   pl_orbsmaxerr2 <dbl>, pl_orbsmaxlim <dbl>, pl_orbsmaxn <dbl>,
#> #   pl_orbeccen <dbl>, pl_orbeccenerr1 <dbl>, pl_orbeccenerr2 <dbl>,
#> #   pl_orbeccenlim <dbl>, pl_orbeccenn <dbl>, pl_orbincl <dbl>,
#> #   pl_orbinclerr1 <dbl>, pl_orbinclerr2 <dbl>, pl_orbincllim <dbl>,
#> #   pl_orbincln <dbl>, pl_bmassj <dbl>, pl_bmassjerr1 <dbl>,
#> #   pl_bmassjerr2 <dbl>, pl_bmassjlim <dbl>, pl_bmassn <dbl>,
#> #   pl_bmassprov <chr>, pl_radj <dbl>, pl_radjerr1 <dbl>,
#> #   pl_radjerr2 <dbl>, pl_radjlim <dbl>, pl_radn <dbl>, pl_dens <dbl>,
#> #   pl_denserr1 <dbl>, pl_denserr2 <dbl>, pl_denslim <dbl>,
#> #   pl_densn <dbl>, pl_ttvflag <dbl>, pl_kepflag <dbl>, pl_k2flag <dbl>,
#> #   ra_str <chr>, dec_str <chr>, ra <dbl>, st_raerr <dbl>, dec <dbl>,
#> #   st_decerr <dbl>, st_posn <dbl>, st_dist <dbl>, st_disterr1 <dbl>,
#> #   st_disterr2 <dbl>, st_distlim <dbl>, st_distn <dbl>, st_optmag <dbl>,
#> #   st_optmagerr <dbl>, st_optmaglim <dbl>, st_optband <chr>,
#> #   gaia_gmag <dbl>, gaia_gmagerr <lgl>, gaia_gmaglim <dbl>,
#> #   st_teff <dbl>, st_tefferr1 <dbl>, st_tefferr2 <dbl>, st_tefflim <dbl>,
#> #   st_teffn <dbl>, st_mass <dbl>, st_masserr1 <dbl>, st_masserr2 <dbl>,
#> #   st_masslim <dbl>, st_massn <dbl>, st_rad <dbl>, st_raderr1 <dbl>,
#> #   st_raderr2 <dbl>, st_radlim <dbl>, st_radn <dbl>, pl_nnotes <dbl>,
#> #   rowupdate <date>, pl_facility <chr>
```

To access data from a different table you can use the table parameter:

``` r
exo(table = "keplernames")
#> # A tibble: 2,356 x 13
#>     kepid    ra ra_err   dec dec_err ra_str dec_str kepoi_name kepler_name
#>     <dbl> <dbl>  <dbl> <dbl>   <dbl> <chr>  <chr>   <chr>      <chr>      
#>  1 1.10e7  293.      0  48.4       0 19h33… +48d26… K01931.02  Kepler-339…
#>  2 5.20e6  296.      0  40.3       0 19h43… +40d18… K01932.02  Kepler-340…
#>  3 5.20e6  296.      0  40.3       0 19h43… +40d18… K01932.01  Kepler-340…
#>  4 7.75e6  290.      0  43.5       0 19h19… +43d28… K01952.03  Kepler-341…
#>  5 7.75e6  290.      0  43.5       0 19h19… +43d28… K01952.01  Kepler-341…
#>  6 7.75e6  290.      0  43.5       0 19h19… +43d28… K01952.02  Kepler-341…
#>  7 7.75e6  290.      0  43.5       0 19h19… +43d28… K01952.04  Kepler-341…
#>  8 9.89e6  293.      0  46.7       0 19h30… +46d43… K01955.01  Kepler-342…
#>  9 9.89e6  293.      0  46.7       0 19h30… +46d43… K01955.04  Kepler-342…
#> 10 9.89e6  293.      0  46.7       0 19h30… +46d43… K01955.02  Kepler-342…
#> # … with 2,346 more rows, and 4 more variables: alt_name <chr>,
#> #   tm_designation <chr>, koi_list_flag <chr>, last_update <date>
```

To get a list of all available tables:

``` r
names(exo_tables) 
#>  [1] "exoplanets"               "compositepars"           
#>  [3] "exomultpars"              "aliastable"              
#>  [5] "microlensing"             "cumulative"              
#>  [7] "q1_q17_dr25_sup_koi"      "q1_q17_dr25_koi"         
#>  [9] "q1_q17_dr24_koi"          "q1_q16_koi"              
#> [11] "q1_q12_koi"               "q1_q8_koi"               
#> [13] "q1_q6_koi"                "q1_q17_dr25_tce"         
#> [15] "q1_q17_dr24_tce"          "q1_q16_tce"              
#> [17] "q1_q12_tce"               "keplerstellar"           
#> [19] "q1_q17_dr25_supp_stellar" "q1_q17_dr25_stellar"     
#> [21] "q1_q17_dr24_stellar"      "q1_q16_stellar"          
#> [23] "q1_q12_stellar"           "keplertimeseries"        
#> [25] "keplernames"              "kelttimeseries"          
#> [27] "superwasptimeseries"      "k2targets"               
#> [29] "k2candidates"             "k2names"                 
#> [31] "missionstars"             "mission_exocat"
```

To get a vector of column names for a specific table:

``` r
default_names <- exo_column_names(
  table = "cumulative", 
  cols = "default"
  )

all_names <- exo_column_names(
  table = "cumulative", 
  cols = "all"
  )

str(default_names)
#>  chr [1:50] "kepid" "kepoi_name" "kepler_name" "koi_disposition" ...
str(all_names)
#>  chr [1:153] "kepid" "kepoi_name" "kepler_name" "ra" "ra_err" "ra_str" ...
```

To summarise the database, you can use `exo_summary`, which doesn’t
include everything found
[here](https://exoplanetarchive.ipac.caltech.edu/docs/counts_detail.html)
(yet) but might in the future. The default output is a list, you can
override this with `output = "dataframe"`:

``` r
db_summary <- exo_summary(output = "dataframe", progress = FALSE)
str(db_summary)
#> List of 4
#>  $ counts_summary   :'data.frame':   8 obs. of  2 variables:
#>   ..$ ind   : Factor w/ 8 levels "all_exoplanets",..: 1 2 3 4 5 6 7 8
#>   ..$ values: int [1:8] 4116 2356 2347 2420 427 394 891 38
#>  $ discovery_summary:'data.frame':   11 obs. of  2 variables:
#>   ..$ ind   : Factor w/ 11 levels "Astrometry","Disk Kinematics",..: 1 2 3 4 5 6 7 8 9 10 ...
#>   ..$ values: int [1:11] 1 1 16 49 86 6 7 2 789 3138 ...
#>  $ mass_summary     :'data.frame':   6 obs. of  2 variables:
#>   ..$ ind   : Factor w/ 6 levels "M <= 3 M_Earth",..: 1 2 3 4 5 6
#>   ..$ values: int [1:6] 32 128 89 83 208 364
#>  $ radius_summary   :'data.frame':   5 obs. of  2 variables:
#>   ..$ ind   : Factor w/ 5 levels "R <= 1.25 R_Earth",..: 1 2 3 4 5
#>   ..$ values: int [1:5] 401 849 1314 438 160
```

Finally, you can take a look at the
[docs](https://exoplanetarchive.ipac.caltech.edu/docs/program_interfaces.html)
and use `eco_raw` to write out queries in their entirety. Spaces and
single quotes will be escaped automatically. The only supported format
is CSV so do not request JSON, ipac, or others:

``` r
x <- c(
  base = "https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?",
  table = "table=exoplanets",
  columns = "&select=pl_hostname,ra,dec",
  parameters = "&order=dec"
)

query <- paste(x, collapse = "")

exo_raw(query)
#> # A tibble: 4,116 x 3
#>    pl_hostname     ra   dec
#>    <chr>        <dbl> <dbl>
#>  1 HD 142022 A 243.   -84.2
#>  2 HD 39091     84.3  -80.5
#>  3 HD 39091     84.3  -80.5
#>  4 HD 137388   234.   -80.2
#>  5 GJ 3021       4.05 -79.9
#>  6 HD 63454    115.   -78.3
#>  7 HD 212301   337.   -77.7
#>  8 HD 97048    167.   -77.7
#>  9 CHXR 73     167.   -77.6
#> 10 HD 221420   353.   -77.4
#> # … with 4,106 more rows
```

## Contributing

Please note that the ‘exoplanets’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
