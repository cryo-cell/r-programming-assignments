devtools::load_all()

library(maps)
library(rvest)
library(stringr)
library(dplyr)

# 1. Generate the coordinate list of the 50 state capitals and their lat and long values
capitals_raw <- us.cities[us.cities$capital == 2, ]
capitals_list <- data.frame(
  city = stringr::str_remove(capitals_raw$name, "\\s[A-Z]{2}$"),
  state = capitals_raw$country.etc,
  lat = capitals_raw$lat,
  lon = capitals_raw$long
)

# 2. THE LOOP: Build the Master Dataframe
# Note: Use a loop or purrr::map_df to ping all 50
CShell_capitals <- capitals_list |>
  group_by(city) |>
  mutate(weather = list(scrape_nws(city, lat, lon))) |>
  tidyr::unnest(weather)

# 3. SENSOR FAIL OVERRIDE
# Drop any rows where critical data (temp, condition, or wind) is missing
CShell_capitals <- CShell_capitals |>
  filter(!is.na(temp), !is.na(condition), !is.na(wind))

# 4. *OPTIONAL: LOG THE DROPPED CITIES
dropped <- nrow(capitals_list) - nrow(CShell_capitals)
if (dropped > 0) {
  message("[WARN] Sensors down for ", dropped, " locations. Purging from dataset.")
}
# 5. SAVE TO PACKAGE
usethis::use_data(CShell_capitals, overwrite = TRUE)