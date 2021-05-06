
<!-- README.md is generated from README.Rmd. Please edit that file -->

# exoplanets <img src="man/figures/logo.png" align="right" height=150/>

<!-- badges: start -->

[![R build
status](https://github.com/ropensci/exoplanets/workflows/R-CMD-check/badge.svg)](https://github.com/ropensci/exoplanets/actions/workflows/check-pak.yaml)
[![Codecov test
coverage](https://codecov.io/gh/ropensci/exoplanets/branch/master/graph/badge.svg)](https://codecov.io/gh/ropensci/exoplanets?branch=master)
[![Peer
review](https://badges.ropensci.org/309_status.svg)](https://github.com/ropensci/software-review/issues/309)
<!-- badges: end -->

The goal of exoplanets is to provide access to [NASA’s Exoplanet Archive
TAP
Service](https://exoplanetarchive.ipac.caltech.edu/docs/TAP/usingTAP.html).
The functionality of this package is minimal and is simply an R
interface to access exoplanet data.

<img src="man/figures/README-unnamed-chunk-2-1.png" title="Exoplanets color coded by discovery method" alt="Exoplanets color coded by discovery method" width="100%" />

## Installation

You can install from from ropensci’s *R-universe* repository with:

``` r
install.packages("exoplanets", repos = "https://ropensci.r-universe.dev")
```

Or you can install from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("ropensci/exoplanets")
```

## Example

This is a basic example which shows you how to access data from the
[k2names](https://exoplanetarchive.ipac.caltech.edu/docs/API_k2names_columns.html)
table:

``` r
library(exoplanets)

exoplanets("k2names", progress = FALSE)
#> • https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+*+from+k2names&format=csv
#> # A tibble: 449 x 3
#>    epic_id        k2_name  pl_name     
#>    <chr>          <chr>    <chr>       
#>  1 EPIC 246199087 K2-112 f TRAPPIST-1 f
#>  2 EPIC 246199087 K2-112 h TRAPPIST-1 h
#>  3 EPIC 220383386 K2-96 d  HD 3167 d   
#>  4 EPIC 211331236 K2-117 c K2-117 c    
#>  5 EPIC 212398486 K2-125 b K2-125 b    
#>  6 EPIC 217941732 K2-130 b K2-130 b    
#>  7 EPIC 228754001 K2-132 b K2-132 b    
#>  8 EPIC 247887989 K2-133 d K2-133 d    
#>  9 EPIC 246389858 K2-135 b GJ 9827 b   
#> 10 EPIC 247589423 K2-136 b K2-136 b    
#> # … with 439 more rows
```

If you wish, you can select only the columns you need:

``` r
exoplanets("ps", c("pl_name", "hostname"), progress = FALSE)
#> • https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,hostname+from+ps&format=csv
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   pl_name = col_character(),
#>   hostname = col_character()
#> )
#> # A tibble: 29,398 x 2
#>    pl_name      hostname  
#>    <chr>        <chr>     
#>  1 Kepler-11 c  Kepler-11 
#>  2 Kepler-11 f  Kepler-11 
#>  3 HAT-P-1 b    HAT-P-1   
#>  4 OGLE-TR-10 b OGLE-TR-10
#>  5 TrES-2 b     TrES-2    
#>  6 WASP-3 b     WASP-3    
#>  7 47 UMa b     47 UMa    
#>  8 47 UMa d     47 UMa    
#>  9 HD 167042 b  HD 167042 
#> 10 HD 210702 b  HD 210702 
#> # … with 29,388 more rows
```

Information on the tables and columns available can be found with:

``` r
tableinfo
#> # A tibble: 394 x 13
#>    table database_column_… table_label description  in_ps_table in_ps_comp_pars…
#>    <chr> <chr>             <chr>       <chr>        <chr>       <chr>           
#>  1 ps    default_flag      Default Pa… Boolean fla… X           ""              
#>  2 ps    soltype           Solution T… Disposition… X           ""              
#>  3 ps    pl_controv_flag   Controvers… Flag indica… X           "X"             
#>  4 ps    pl_name           Planet Name Planet name… X           "X"             
#>  5 ps    hostname          Host Name   Stellar nam… X           "X"             
#>  6 ps    pl_letter         Planet Let… Letter assi… X           "X"             
#>  7 ps    hd_name           HD ID       Name of the… X           "X"             
#>  8 ps    hip_name          HIP ID      Name of the… X           "X"             
#>  9 ps    tic_id            TIC ID      Name of the… X           "X"             
#> 10 ps    gaia_id           GAIA ID     Name of the… X           "X"             
#> # … with 384 more rows, and 7 more variables:
#> #   uncertainties_column_positive_negative <chr>, limit_column <chr>,
#> #   default <lgl>, notes <chr>, displayed_string_name <chr>, flag_column <lgl>,
#> #   number_of_measurements <lgl>
```

## Capabilities

At one time, this package used the *Exoplanet Archive Application
Programming Interface (API)*. Since then, a handful of tables have been
transitioned to the *Table Access Protocol (TAP) service*. More tables
will be transitioned to TAP and as such, this package only supports
queries from TAP. For more information, you can read
<https://exoplanetarchive.ipac.caltech.edu/docs/exonews_archive.html#29April2021>.

## Contributing

Please note that this package is released with a [Contributor Code of
Conduct](https://ropensci.org/code-of-conduct/). By contributing to this
project, you agree to abide by its terms.
