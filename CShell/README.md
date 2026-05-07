
# CShell

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

# Execute the core engine for a specific node
weather <- scrape_nws("Largo", 27.91, -82.79)

# Generate wardrobe requirements based on internal logic gates
outfit <- city_outfit("Largo")
```

    ## 
    ## [ C-SHELL TACTICAL REPORT ]
    ## --------------------------------------------
    ## LOC: Largo, Florida | COORDS: 27.91829, -82.774936
    ## WEATHER: 76F | HUM: 60% | PRECIP: 20%
    ## SKY: A FEW CLOUDS | RAIN: FALSE | SUNNY: FALSE
    ## --------------------------------------------
    ## Socks           >> Short Socks
    ## Undergarments   >> Breathable Undergarments
    ## Bottoms         >> Shorts
    ## Primary Top     >> Standard T-Shirt
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
    ## 1  TRUE
    ##                                                                                                                                                                                     text
    ## 1 a slight chance of showers between 2am and 3am.  partly cloudy, with a low around 68. north northeast wind around 6 mph becoming east after midnight.  chance of precipitation is 20%.
    ##   cityName temp precip    condition humidity wind    dewpoint is_sunny
    ## 1    Largo   76     20 a few clouds      60%    8 61°F (16°C)    FALSE
    ##   is_rain_likely
    ## 1          FALSE
    ##                                                              source_url
    ## 1 https://forecast.weather.gov/MapClick.php?lat=27.91829&lon=-82.774936
    ##           scrape_time
    ## 1 2026-05-04 21:06:56
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
    ## [1] "None"
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

AI COLLABORATION LOG: CSHELL PROJECT

1.  ARCHITECTURAL DESIGN (STRATEGY) AI Role: Architectural Consultant.

Execution: Used Gemini to refactor legacy R scripts into a hardened S3
package structure. AI assisted in determining the optimal placement for
internal data logic within data-raw/ and sysdata.rda to ensure data
sovereignty.

2.  LOGIC GATE ENGINEERING (DISCRETE MATH) AI Role: Logic Validator.

Execution: AI was used to verify the boolean logic for wardrobe
recommendations. We mapped NWS telemetry variables (temperature,
precipitation, wind) to series (AND) and parallel (OR) circuits to
ensure logical consistency in the apply_wardrobe_logic function.

3.  SCRAPER OPTIMIZATION (ETL) AI Role: Debugging & Refinement.

Execution: Collaborated with AI to implement a “Tonight-Anchor”
algorithm using rvest. AI helped troubleshoot timezone offset errors and
optimized the regex for cleaning NWS telemetry strings.

4.  DOCUMENTATION & UX AI Role: Technical Writer.

Execution: Used AI to generate roxygen2 skeletons and ensure the
CShell-Tactical-Guide vignette met professional standards. AI assisted
in integrating cli and crayon for high-visibility terminal output.

The AI’s suggestions to use @import for entire libraries (e.g., rvest,
cli) in the NAMESPACE were rejected in favor of explicit namespacing
(e.g., cli::cli_alert_info(), rvest::read_html()) to improve code
legibility for peer review, prevent namespace conflicts, and make
package dependencies more transparent.

Suggestions to keep wardrobe logic in an external CSV or JSON file were
rejected in favor of moving the logic into sysdata.rda within the data/
directory to secure the business logic of the package, preventing
external tampering and ensuring the package remains self-contained.
