
<!-- README.md is generated from README.Rmd. Please edit that file -->

# exoplanets <img src="man/figures/logo.png" align="right" height=150/>

<!-- badges: start -->

[![R build
status](https://github.com/tyluRp/exoplanets/workflows/R-CMD-check/badge.svg)](https://github.com/tyluRp/exoplanets)
[![Codecov test
coverage](https://codecov.io/gh/tyluRp/exoplanets/branch/master/graph/badge.svg)](https://codecov.io/gh/tyluRp/exoplanets?branch=master)
<!-- badges: end -->

The goal of exoplanets is to provide access to [NASA’s Exoplanet
Archive](https://exoplanetarchive.ipac.caltech.edu/index.html) database
in R. The functionality of this package is fairly minimal and is simply
an R interface to access exoplanet data in the following ways:

-   By providing a table name using `exo`
-   By providing a query URL using `exo_raw`
-   By summarising the database using `exo_summary`

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

exo("exoplanets")
#> # A tibble: 4,352 x 82
#>    pl_hostname pl_letter pl_name  pl_discmethod pl_controvflag pl_pnum pl_orbper
#>    <chr>       <chr>     <chr>    <chr>                  <dbl>   <dbl>     <dbl>
#>  1 Kepler-128  b         Kepler-… Transit                    0       2     15.1 
#>  2 Kepler-128  c         Kepler-… Transit                    0       2     22.8 
#>  3 Kepler-129  b         Kepler-… Transit                    0       2     15.8 
#>  4 Kepler-129  c         Kepler-… Transit                    0       2     82.2 
#>  5 Kepler-130  b         Kepler-… Transit                    0       3      8.46
#>  6 Kepler-130  c         Kepler-… Transit                    0       3     27.5 
#>  7 Kepler-130  d         Kepler-… Transit                    0       3     87.5 
#>  8 Kepler-131  b         Kepler-… Transit                    0       2     16.1 
#>  9 Kepler-131  c         Kepler-… Transit                    0       2     25.5 
#> 10 Kepler-132  b         Kepler-… Transit                    0       4      6.18
#> # … with 4,342 more rows, and 75 more variables: pl_orbpererr1 <dbl>,
#> #   pl_orbpererr2 <dbl>, pl_orbperlim <dbl>, pl_orbpern <dbl>,
#> #   pl_orbsmax <dbl>, pl_orbsmaxerr1 <dbl>, pl_orbsmaxerr2 <dbl>,
#> #   pl_orbsmaxlim <dbl>, pl_orbsmaxn <dbl>, pl_orbeccen <dbl>,
#> #   pl_orbeccenerr1 <dbl>, pl_orbeccenerr2 <dbl>, pl_orbeccenlim <dbl>,
#> #   pl_orbeccenn <dbl>, pl_orbincl <dbl>, pl_orbinclerr1 <dbl>,
#> #   pl_orbinclerr2 <dbl>, pl_orbincllim <dbl>, pl_orbincln <dbl>,
#> #   pl_bmassj <dbl>, pl_bmassjerr1 <dbl>, pl_bmassjerr2 <dbl>,
#> #   pl_bmassjlim <dbl>, pl_bmassn <dbl>, pl_bmassprov <chr>, pl_radj <dbl>,
#> #   pl_radjerr1 <dbl>, pl_radjerr2 <dbl>, pl_radjlim <dbl>, pl_radn <dbl>,
#> #   pl_dens <dbl>, pl_denserr1 <dbl>, pl_denserr2 <dbl>, pl_denslim <dbl>,
#> #   pl_densn <dbl>, pl_ttvflag <dbl>, pl_kepflag <dbl>, pl_k2flag <dbl>,
#> #   ra_str <chr>, dec_str <chr>, ra <dbl>, st_raerr <dbl>, dec <dbl>,
#> #   st_decerr <dbl>, st_posn <dbl>, st_dist <dbl>, st_disterr1 <dbl>,
#> #   st_disterr2 <dbl>, st_distlim <dbl>, st_distn <dbl>, st_optmag <dbl>,
#> #   st_optmagerr <dbl>, st_optmaglim <dbl>, st_optband <chr>, gaia_gmag <dbl>,
#> #   gaia_gmagerr <lgl>, gaia_gmaglim <dbl>, st_teff <dbl>, st_tefferr1 <dbl>,
#> #   st_tefferr2 <dbl>, st_tefflim <dbl>, st_teffn <dbl>, st_mass <dbl>,
#> #   st_masserr1 <dbl>, st_masserr2 <dbl>, st_masslim <dbl>, st_massn <dbl>,
#> #   st_rad <dbl>, st_raderr1 <dbl>, st_raderr2 <dbl>, st_radlim <dbl>,
#> #   st_radn <dbl>, pl_nnotes <dbl>, rowupdate <date>, pl_facility <chr>
```

To access data from a different table you can use the table parameter:

``` r
exo("keplernames")
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=keplernames>
#> # A tibble: 2,414 x 13
#>      kepid    ra ra_err   dec dec_err ra_str    dec_str   kepoi_name kepler_name
#>      <dbl> <dbl>  <dbl> <dbl>   <dbl> <chr>     <chr>     <chr>      <chr>      
#>  1  1.10e7  293.      0  48.4       0 19h33m24… +48d26m4… K01931.02  Kepler-339…
#>  2  5.20e6  296.      0  40.3       0 19h43m44… +40d18m0… K01932.02  Kepler-340…
#>  3  5.20e6  296.      0  40.3       0 19h43m44… +40d18m0… K01932.01  Kepler-340…
#>  4  7.75e6  290.      0  43.5       0 19h19m26… +43d28m2… K01952.03  Kepler-341…
#>  5  7.75e6  290.      0  43.5       0 19h19m26… +43d28m2… K01952.01  Kepler-341…
#>  6  7.75e6  290.      0  43.5       0 19h19m26… +43d28m2… K01952.02  Kepler-341…
#>  7  7.75e6  290.      0  43.5       0 19h19m26… +43d28m2… K01952.04  Kepler-341…
#>  8  9.89e6  293.      0  46.7       0 19h30m42… +46d43m3… K01955.01  Kepler-342…
#>  9  9.89e6  293.      0  46.7       0 19h30m42… +46d43m3… K01955.04  Kepler-342…
#> 10  9.89e6  293.      0  46.7       0 19h30m42… +46d43m3… K01955.02  Kepler-342…
#> # … with 2,404 more rows, and 4 more variables: alt_name <chr>,
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
default_names <- exo_columns("cumulative", "default")
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=cumulative&getDefaultColumns&format=csv>
all_names <- exo_columns("cumulative", "all")
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=cumulative&getAllColumns&format=csv>

str(default_names)
#>  chr [1:50] "kepid" "kepoi_name" "kepler_name" "koi_disposition" ...
str(all_names)
#>  chr [1:153] "kepid" "kepoi_name" "kepler_name" "ra" "ra_err" "ra_str" ...
```

To summarise the database, you can use `exo_summary`, which doesn’t
include everything found
[here](https://exoplanetarchive.ipac.caltech.edu/docs/counts_detail.html),
but might in the future:

``` r
exo_summary()
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&getDefaultColumns&format=csv>
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=exoplanets&select=pl_hostname,pl_letter,pl_name,pl_discmethod,pl_controvflag,pl_pnum,pl_orbper,pl_orbpererr1,pl_orbpererr2,pl_orbperlim,pl_orbpern,pl_orbsmax,pl_orbsmaxerr1,pl_orbsmaxerr2,pl_orbsmaxlim,pl_orbsmaxn,pl_orbeccen,pl_orbeccenerr1,pl_orbeccenerr2,pl_orbeccenlim,pl_orbeccenn,pl_orbincl,pl_orbinclerr1,pl_orbinclerr2,pl_orbincllim,pl_orbincln,pl_bmassj,pl_bmassjerr1,pl_bmassjerr2,pl_bmassjlim,pl_bmassn,pl_bmassprov,pl_radj,pl_radjerr1,pl_radjerr2,pl_radjlim,pl_radn,pl_dens,pl_denserr1,pl_denserr2,pl_denslim,pl_densn,pl_ttvflag,pl_kepflag,pl_k2flag,ra_str,dec_str,ra,st_raerr,dec,st_decerr,st_posn,st_dist,st_disterr1,st_disterr2,st_distlim,st_distn,st_optmag,st_optmagerr,st_optmaglim,st_optband,gaia_gmag,gaia_gmagerr,gaia_gmaglim,st_teff,st_tefferr1,st_tefferr2,st_tefflim,st_teffn,st_mass,st_masserr1,st_masserr2,st_masslim,st_massn,st_rad,st_raderr1,st_raderr2,st_radlim,st_radn,pl_nnotes,rowupdate,pl_facility,pl_masse,pl_rade>
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=cumulative>
#> * <https://exoplanetarchive.ipac.caltech.edu/cgi-bin/nstedAPI/nph-nstedAPI?table=k2candidates>
#> $counts_summary
#> # A tibble: 8 x 2
#>   ind                                                         values
#>   <fct>                                                        <int>
#> 1 all_exoplanets                                                4352
#> 2 confirmed_planets_with_kepler_light_curves_for_stellar_host   2414
#> 3 confirmed_planets_discovered_by_kepler                        2394
#> 4 kepler_project_candidates_yet_to_be_confirmed                 2366
#> 5 confirmed_planets_with_k2_light_curves_for_stellar_host        450
#> 6 confirmed_planets_discovered_by_k2                             425
#> 7 k2_candidates_yet_to_be_confirmed                              889
#> 8 confirmed_planets_discovered_by_tess                           113
#> 
#> $discovery_summary
#> # A tibble: 11 x 2
#>    ind                           values
#>    <fct>                          <int>
#>  1 Astrometry                         1
#>  2 Disk Kinematics                    1
#>  3 Eclipse Timing Variations         16
#>  4 Imaging                           51
#>  5 Microlensing                     106
#>  6 Orbital Brightness Modulation      6
#>  7 Pulsar Timing                      7
#>  8 Pulsation Timing Variations        2
#>  9 Radial Velocity                  827
#> 10 Transit                         3314
#> 11 Transit Timing Variations         21
#> 
#> $mass_summary
#> # A tibble: 6 x 2
#>   ind                    values
#>   <fct>                   <int>
#> 1 M <= 3 M_Earth             44
#> 2 3 < M <= 10 M_Earth       154
#> 3 10 < M <= 30 M_Earth      106
#> 4 30 < M <= 100 M_Earth      98
#> 5 100 < M <= 300 M_Earth    229
#> 6 300 M_Earth < M           393
#> 
#> $radius_summary
#> # A tibble: 5 x 2
#>   ind                   values
#>   <fct>                  <int>
#> 1 R <= 1.25 R_Earth        419
#> 2 1.25 < R <= 2 R_Earth    880
#> 3 2 < R <= 6 R_Earth      1399
#> 4 6 < R <= 15 R_Earth      475
#> 5 15 R_Earth < R           165
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
#> # A tibble: 4,352 x 3
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
#> # … with 4,342 more rows
```

## Contributing

Please note that the ‘exoplanets’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
