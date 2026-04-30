#' Match Weather to Wardrobe Logic
#' @description Internal engine to process weather data against the logic table.
#' @keywords internal
apply_wardrobe_logic <- function(weather_data) {
  lapply(wardrobe_logic, function(category) {
    match <- Filter(function(rule) rule(weather_data), category)
    names(match)[1]
  })
}

#' Scrape NWS Data
#' @export
# 1. Define the Scraper Function (Simplified from the shiny server logic)
scrape_nws <- function(city_name, lat, lon) {
  url <- paste0("https://forecast.weather.gov/MapClick.php?lat=", lat, "&lon=", lon)
  page <- rvest::read_html(url)
  
  # 1. Isolate the "Today/Tonight" segments specifically
  # We look for the forecast labels and their corresponding text
  labels <- page %>% html_elements(".forecast-label") %>% html_text()
  texts  <- page %>% html_elements(".forecast-text") %>% html_text()
  
  # 2. Combine into a small internal table to find "Today" and "Tonight"
  forecast_df <- data.frame(period = labels, text = texts)
  
  # 3. Filter for only the immediate 24-hour window
  # We use the first two entries (usually Today/Tonight or Tonight/Tomorrow)
  immediate_text <- paste(forecast_df$text[1:2], collapse = " ") %>% tolower()
  
  # 4. Extract Probability from ONLY this window
  precip_matches <- stringr::str_extract_all(immediate_text, "\\d+(?=%| percent)") %>% unlist() %>% as.numeric()
  precip_chance <- if(length(precip_matches) > 0) max(precip_matches) else 0
  
  # Current Temp & Conditions
  temp_text <- page %>% html_element(".myforecast-current-lrg") %>% html_text()
  temp <- as.numeric(stringr::str_extract(temp_text, "\\d+"))
  cond_text <- tolower(page %>% html_element(".myforecast-current") %>% html_text())
  
  # Detailed Text Forecast (For rain/sun detection)
  detailed_text <- page %>% html_element("#detailed-forecast-body") %>% html_text() %>% tolower()
  
  # Detail Table Variables
  detail_table <- page %>% html_element("#current_conditions_detail")
  humidity <- detail_table %>% html_element("td:contains('Humidity') + td") %>% html_text()
  
  # --- THE WIND ENGINE (Table-Based) ---
  rows <- detail_table %>% html_elements("tr")
  
  # 2. Find the row text and extract the wind data specifically
  wind_row_text <- rows[grep("Wind Speed", html_text(rows))] %>% html_text()
  
  # 3. Clean and Extract
  # Remove the label "Wind Speed" to leave just the data
  wind_raw <- stringr::str_remove(wind_row_text, "Wind Speed") %>% stringr::str_trim()
  
  # Extract the number from strings like "NW 10 mph" or "15 mph"
  wind_num <- as.numeric(stringr::str_extract(wind_raw, "\\d+"))
  
  # If str_extract is NA but the string contains "calm", set to 0
  wind_final <- if(!is.na(wind_num)) {
    wind_num 
  } else if (stringr::str_detect(tolower(wind_raw), "calm")) {
    0 
  } else {
    NA
  }
  
  wind <- wind_final
  
  dewpoint <- detail_table %>% html_element("td:contains('Dewpoint') + td") %>% html_text()
  
  # Logic Flags
  # 1. TIME-OF-DAY DETECTION (Label-Based)
  # Look at the first label from the forecast table (e.g., "Today", "This Afternoon", or "Tonight")
  first_label <- tolower(forecast_df$period[1])
  
  # If the first label contains "night" or "evening", it is night.
  # Otherwise, if it's "today" or "afternoon", it is day.
  is_night <- grepl("night|evening", first_label)
  
  is_rain_likely <- stringr::str_detect(immediate_text, "rain|shower|drizzle|storm|sprinkles") | stringr::str_detect(cond_text, "rain|shower|drizzle|storm") | precip_chance >= 30 
  is_sunny <- !is_night & 
    stringr::str_detect(immediate_text, "sun|clear|fair|partly") & 
    !is_rain_likely
  
  # --- TELEMETRY LOG ---
  return(data.frame(
    night = is_night,
    text = immediate_text,
    cityName = city_name,
    temp = temp, 
    precip = precip_chance,
    condition = cond_text, 
    humidity = humidity,
    wind = wind,
    dewpoint = dewpoint,
    is_sunny = is_sunny,
    is_rain_likely = is_rain_likely,
    scrape_time = Sys.time()
  ))
}