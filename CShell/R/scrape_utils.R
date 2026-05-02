#' Recommend by City Name (with State detection)
#' @param city A character string representing the city name (e.g., "Tampa, FL", "Tampa").
#' @export

city_outfit <- function(city) {
  # 1. GEO-LOCATE
  city_input <- NULL
  geo_raw <- data.frame(city_input = city) |>
    tidygeocoder::geocode(city_input, method = 'arcgis', full_results = TRUE, quiet = TRUE)
  
  if (is.na(geo_raw$lat)) stop("Node not found.")
  
  detected_state <- if ("attributes.Region" %in% names(geo_raw)) geo_raw$attributes.Region else "Unknown"
  
  # 2. FETCH WEATHER DATA  
  weather <- scrape_nws(city, geo_raw$lat, geo_raw$long)
  
  
  # 3. CALL INTERNAL OUTFIT ENGINE
  outfit <- apply_wardrobe_logic(weather)
  
  # 4. CREATE OBJECT
  res <- list(
    Input   = city,
    State   = detected_state,
    Coords  = c(geo_raw$lat, geo_raw$long),
    Weather = weather,
    Outfit  = outfit
  )
  # ASSIGN S3 CLASS
  class(res) <- "outfit"
  
  # CREATE HYPERLINK
  link_text <- cli::style_hyperlink("View Raw NWS Telemetry", res$Weather$source_url[1])
  
  # IMMEDIATE TELEMETRY REPORT 
  cat("\n[ C-SHELL TACTICAL REPORT ]\n")
  cat("--------------------------------------------\n")
  cat(sprintf("LOC: %s, %s | COORDS: %s, %s\n", res$Input, res$State, res$Coords[1], res$Coords[2]))
  cat(sprintf("WEATHER: %sF | HUM: %s | PRECIP: %s%%\n", res$Weather$temp, res$Weather$humidity, res$Weather$precip))
  cat(sprintf("SKY: %s | RAIN: %s | SUNNY: %s\n", toupper(res$Weather$condition), res$Weather$is_rain_likely, res$Weather$is_sunny))
  cat("--------------------------------------------\n")
  
  items <- unlist(res$Outfit)
  active <- items[items != "None"]
  for (i in seq_along(active)) {
    cat(sprintf("%-15s >> %s\n", names(active)[i], active[i]))
  }
  cat("SOURCE: ", link_text, "\n") # Accessing the URL from the Weather df
  cat("--------------------------------------------\n\n")
  
  # 5. SILENT RETURN (For variable assignment)
  return(invisible(res))
}

#' Recommend by Coordinates
#' @param lat Numeric. The latitude of the target node.
#' @param long Numeric. The longitude of the target node.
#' @export
coords_outfit <- function(lat, long) {
  # 1. GEO-LOCATE
  coords_input <- data.frame(lat, long)
  geo_raw <- tidygeocoder::reverse_geocode(coords_input, lat = lat, long = long, method = 'arcgis', full_results = TRUE, quiet = TRUE)
  
  if (is.na(geo_raw$lat)) stop("Node not found.")
  
  detected_state <- if ("Region" %in% names(geo_raw)) geo_raw$Region else "Unknown"
  detected_city <- if ("City" %in% names(geo_raw)) geo_raw$City else "Unknown"
  
  # 2. FETCH WEATHER DATA  
  weather <- scrape_nws(detected_city, lat, long)
  
  # 3. CALL INTERNAL OUTFIT ENGINE
  outfit <- apply_wardrobe_logic(weather)
  
  # 4. CREATE OBJECT
  res <- list(
    Input   = detected_city,
    State   = detected_state,
    Coords  = c(geo_raw$lat, geo_raw$long),
    Weather = weather,
    Outfit  = outfit
  )
  # ASSIGN S3 CLASS
  class(res) <- "outfit"
  
  # CREATE HYPERLINK
  link_text <- cli::style_hyperlink("View Raw NWS Telemetry", res$Weather$source_url[1])
  
  # IMMEDIATE TELEMETRY REPORT 
  cat("\n[ C-SHELL TACTICAL REPORT ]\n")
  cat("--------------------------------------------\n")
  cat(sprintf("LOC: %s, %s | COORDS: %s, %s\n", res$Input, res$State, res$Coords[1], res$Coords[2]))
  cat(sprintf("WEATHER: %sF | HUM: %s | PRECIP: %s%%\n", res$Weather$temp, res$Weather$humidity, res$Weather$precip))
  cat(sprintf("SKY: %s | RAIN: %s | SUNNY: %s\n", toupper(res$Weather$condition), res$Weather$is_rain_likely, res$Weather$is_sunny))
  cat("--------------------------------------------\n")
  
  items <- unlist(res$Outfit)
  active <- items[items != "None"]
  for (i in seq_along(active)) {
    cat(sprintf("%-15s >> %s\n", names(active)[i], active[i]))
  } 
  cat("SOURCE: ", link_text, "\n")
  cat("--------------------------------------------\n\n")
  
  # 5. SILENT RETURN (For variable assignment)
  return(invisible(res))
}