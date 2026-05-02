
# CShell

<!-- badges: start -->

<!-- badges: end -->

**CShell** is a tactical weather telemetry and logistical engine built
in R. It automates the extraction of National Weather Service (NWS) data
and processes it through an internal logic-gate system to provide
real-time wardrobe and equipment recommendations.

## Technical Identity

- **Domain:** Data Analytics & Logistics Automation
- **Logic Engine:** Symbolic logic circuits (AND/OR gates) mapped to
  environmental variables.
- **Architecture:** Modular R package with internalized logic tables for
  data sovereignty.

## Installation

You can install the development version of CShell from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("cryo-cell/r-programming-assignments", subdir = "CShell")
```

## Example Code

This is a basic example which shows you how to solve use the CShell
package:

``` r
library(CShell)
## basic example code

# Execute the core engine for a specific node
weather <- scrape_nws("Largo", 27.91, -82.79)

# Generate wardrobe requirements based on internal logic gates
outfit <- city_outfit("Largo")
```

    ## 
    ## [ C-SHELL TACTICAL REPORT ]
    ## --------------------------------------------
    ## LOC: Largo, Florida | COORDS: 27.91829, -82.774936
    ## WEATHER: 72F | HUM: 97% | PRECIP: 70%
    ## SKY:  LIGHT RAIN | RAIN: TRUE | SUNNY: FALSE
    ## --------------------------------------------
    ## Socks           >> Short Socks
    ## Undergarments   >> Breathable Undergarments
    ## Bottoms         >> Shorts
    ## Primary Top     >> Standard T-Shirt
    ## Apex Shell      >> Rain Shell
    ## SOURCE:  View Raw NWS Telemetry 
    ## --------------------------------------------

``` r
print(outfit)
```

    ## $Input
    ## [1] "Largo"
    ## 
    ## $State
    ## [1] "Florida"
    ## 
    ## $Coords
    ## [1]  27.91829 -82.77494
    ## 
    ## $Weather
    ##   night
    ## 1 FALSE
    ##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          text
    ## 1 showers likely and possibly a thunderstorm. some of the storms could be severe.  cloudy, with a steady temperature around 79. breezy, with a west wind around 15 mph, with gusts as high as 22 mph.  chance of precipitation is 70%. new rainfall amounts of less than a tenth of an inch, except higher amounts possible in thunderstorms.  a chance of showers and thunderstorms before 11pm, then a slight chance of showers and thunderstorms after 2am. some of the storms could be severe.  mostly cloudy, with a low around 63. west wind 8 to 10 mph becoming north after midnight.  chance of precipitation is 50%. new rainfall amounts between a tenth and quarter of an inch, except higher amounts possible in thunderstorms. 
    ##   cityName temp precip   condition humidity wind    dewpoint is_sunny
    ## 1    Largo   72     70  light rain      97%    0 71°F (22°C)    FALSE
    ##   is_rain_likely
    ## 1           TRUE
    ##                                                              source_url
    ## 1 https://forecast.weather.gov/MapClick.php?lat=27.91829&lon=-82.774936
    ##           scrape_time
    ## 1 2026-05-02 17:46:46
    ## 
    ## $Outfit
    ## $Outfit$Socks
    ## [1] "Short Socks"
    ## 
    ## $Outfit$Undergarments
    ## [1] "Breathable Undergarments"
    ## 
    ## $Outfit$Bottoms
    ## [1] "Shorts"
    ## 
    ## $Outfit$`Thermal Base`
    ## [1] "None"
    ## 
    ## $Outfit$`Primary Top`
    ## [1] "Standard T-Shirt"
    ## 
    ## $Outfit$`Intermediate Top`
    ## [1] "None"
    ## 
    ## $Outfit$`Apex Shell`
    ## [1] "Rain Shell"
    ## 
    ## $Outfit$Eyewear
    ## [1] "None"
    ## 
    ## $Outfit$Hats
    ## [1] "None"
    ## 
    ## $Outfit$Gloves
    ## [1] "None"
    ## 
    ## 
    ## attr(,"class")
    ## [1] "outfit"

Detailed Documentation For a full tactical breakdown of the logic engine
and data-raw processing, please refer to the package vignette:

``` r
vignette("CShell-Tactical-Guide", package = "CShell")
```
