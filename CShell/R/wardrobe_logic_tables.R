# Internal Logic Table
wardrobe_logic <- list(
  "Socks" = list(
    "Heavy Wool Socks (Long)" = function(w) w$temp < 40,
    "Athletic Crew Socks"     = function(w) w$temp >= 40 && w$temp < 65,
    "Short Socks"   = function(w) w$temp >= 65,
    "Standard Socks"    = function(w) TRUE
  ),
  "Undergarments" = list(
    "Thermal Long Johns"   = function(w) w$temp < 35,
    "Breathable Material" = function(w) w$temp > 75 || w$humidity > 70,
    "Standard Cotton"      = function(w) TRUE
  ),
  "Bottoms" = list(
    "Jeans"             = function(w) w$temp < 70 && w$temp >= 32,
    "Pants / Chinos"    = function(w) w$temp < 70 && w$temp >= 32 && w$is_sunny,
    "Sweatpants"        = function(w) w$temp < 50 && !w$is_sunny,
    "Shorts"            = function(w) w$temp >= 70,
    "Standard Bottoms"  = function(w) TRUE
  ),
  "Thermal Base" = list(
    "Heavy Thermal Base"   = function(w) w$temp < 32,
    "Light Synthetic Base" = function(w) w$temp >= 32 && w$temp < 45,
    "None"                 = function(w) w$temp >= 45
  ),
  "Primary Top" = list(  
    "Heavy Flannel"      = function(w) w$temp < 50,
    "Long Sleeve Shirt"  = function(w) w$temp >= 50 && w$temp < 65,
    "Standard T-Shirt"   = function(w) w$temp >= 65,
    "Breathable Tee"     = function(w) w$temp > 80
  ),
  "Intermediate Top" = list( 
    "Heavy Fleece"       = function(w) w$temp < 40,
    "Sweater / Cardigan" = function(w) w$temp >= 40 && w$temp < 55,
    "Hoodie"             = function(w) w$temp >= 55 && w$temp < 68,
    "None"               = function(w) w$temp >= 68
  ),
  "Apex Shell" = list(
    "Winter Parka" = function(w) w$temp < 32, 
    "Rain Shell"   = function(w) w$is_rain_likely && w$temp >= 32,
    "Windbreaker"  = function(w) w$wind > 10 && w$temp >= 32,
    "None"         = function(w) TRUE
  ),
  "Eyewear" = list(
    "Polarized Sunglasses" = function(w) w$is_sunny,
    "None"                 = function(w) TRUE
  ),
  "Hats" = list(
    "Thermal Beanie"    = function(w) w$temp < 40,
    "Sun Hat"           = function(w) w$is_sunny && w$temp > 75,
    "Ball Cap"          = function(w) w$is_sunny || w$wind > 15,
    "None"              = function(w) TRUE
  ),
  "Gloves" = list(
    "Heavy Gloves" = function(w) w$temp < 32,
    "Light Gloves" = function(w) w$temp < 45, 
    "None"         = function(w) TRUE
  )
)
