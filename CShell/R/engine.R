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
# 1. Define the Scraper Function 
scrape_nws <- function(city_name, lat, lon) {
  url <- paste0("https://forecast.weather.gov/MapClick.php?lat=", lat, "&lon=", lon)
  page <- rvest::read_html(url)
  
  # 1. Isolate the "Today/Tonight" segments specifically
  # We look for the forecast labels and their corresponding text
  labels <- page |> rvest::html_elements(".forecast-label") |> rvest::html_text()
  texts  <- page |> rvest::html_elements(".forecast-text") |> rvest::html_text()
  
  # 2. Combine into a small internal table to find "Today" and "Tonight"
  forecast_df <- data.frame(period = labels, text = texts)
  
  # 3. Filter for only the immediate 24-hour window
  
  # 4. Identify the index of the "Tonight" anchor
  # We use match() to find the first exact occurrence
  tonight_index <- match("tonight", tolower(forecast_df$period))
  
  # 5. Determine the slice range
  # If "Tonight" isn't found (rare), default to first 2.
  # If found, take everything from index 1 up to tonight_index.
  if (!is.na(tonight_index)) {
    valid_indices <- 1:tonight_index
  } else {
    valid_indices <- 1:2
  }
  
  # 6. Collapse the validated text
  immediate_text <- paste(forecast_df$text[valid_indices], collapse = " ") |> tolower()
  
  # 1. --- Extract Precipitation Probability 
  precip_matches <- stringr::str_extract_all(immediate_text, "\\d+(?=%| percent)") |> unlist() |> as.numeric()
  precip_chance <- if(length(precip_matches) > 0) max(precip_matches) else 0
  
  # 1.---- Current Temperature & Conditions
  temp_text <- page |> rvest::html_element(".myforecast-current-lrg") |> rvest::html_text()
  temp <- as.numeric(stringr::str_extract(temp_text, "\\d+"))
  cond_text <- tolower(page |> rvest::html_element(".myforecast-current") |> rvest::html_text())
  
  # Detail Table Variables
  detail_table <- page |> rvest::html_element("#current_conditions_detail")
  humidity <- detail_table |> rvest::html_element("td:contains('Humidity') + td") |> rvest::html_text()
  
  # 1. --- THE WIND ENGINE (Table-Based) ---
  rows <- detail_table |> rvest::html_elements("tr")
  
  # 2. Find the row text and extract the wind data specifically
  wind_row_text <- rows[grep("Wind Speed", rvest::html_text(rows))] |> rvest::html_text()
  
  # 3. Clean and Extract
  # Remove the label "Wind Speed" to leave just the data
  wind_raw <- stringr::str_remove(wind_row_text, "Wind Speed") |> stringr::str_trim()
  
  # 4. Extract the number from strings like "NW 10 mph" or "15 mph"
  wind_num <- as.numeric(stringr::str_extract(wind_raw, "\\d+"))
  
  # 5. If str_extract is NA but the string contains "calm", set to 0
  wind_final <- if(!is.na(wind_num)) {
    wind_num 
  } else if (stringr::str_detect(tolower(wind_raw), "calm")) {
    0 
  } else {
    NA
  }
  
  wind <- wind_final
  
  # --- Find the row text and extract the dewpoint data 
  dewpoint <- detail_table |> rvest::html_element("td:contains('Dewpoint') + td") |> rvest::html_text()
  
  # Logic Flags
  # TIME-OF-DAY DETECTION (Label-Based)
  # Look at the first label from the forecast table (e.g., "Today", "This Afternoon", or "Tonight")
  first_label <- tolower(forecast_df$period[1])
  
  # If the first label contains "night" or "evening", it is night.
  # Otherwise, if it's "today" or "afternoon", it is day.
  is_night <- grepl("night|evening", first_label)
  
  # PRECIPITATION LOGIC 
  # 1. High Probability Flag (Direct Hit)
  chance_is_high <- precip_chance >= 30
  
  # 2. Immediate Threat Flag (Right Now)
  # Check current conditions text only
  currently_raining <- stringr::str_detect(cond_text, "rain|shower|drizzle|storm|snow")
  
  # 3. Future Threat Flag (Today/Tonight text)
  # Only trigger if chance is significant
  future_rain_likely <- (precip_chance >= 30) && 
    stringr::str_detect(immediate_text, "rain|shower|drizzle|storm")
  
  # 4. FINAL CONSOLIDATED PRECIP FLAG
  is_rain_likely <- currently_raining || chance_is_high || future_rain_likely
  
  # SOLAR LOGIC
  has_direct_sun <- stringr::str_detect(immediate_text, "sunny|clear|fair") || 
    stringr::str_detect(cond_text, "sunny|clear|fair")
  
  # 'Partly' is only sunny if it's 'partly sunny'
  is_partly_sunny <- stringr::str_detect(immediate_text, "partly sunny") ||
    stringr::str_detect(cond_text, "partly sunny")
  
  # FINAL CONSOLIDATED SOLAR FLAG
  is_sunny <- !is_night && (has_direct_sun || is_partly_sunny) && !is_rain_likely
  
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
    source_url = url,
    scrape_time = Sys.time()
  ))
}