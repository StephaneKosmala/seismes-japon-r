library(httr)
library(jsonlite)
library(dplyr)
library(lubridate)

url <- "https://earthquake.usgs.gov/fdsnws/event/1/query"

params <- list(
  format = "geojson",
  starttime = "2000-01-01",
  endtime = "2024-12-31",
  minlatitude = 24,
  maxlatitude = 46,
  minlongitude = 122,
  maxlongitude = 146,
  minmagnitude = 4.5
)

response <- GET(url, query = params)
data_raw <- fromJSON(content(response, "text", encoding = "UTF-8"), flatten = TRUE)

seismes <- data_raw$features %>%
  as_tibble() %>%
  transmute(
    id = id,
    magnitude = properties.mag,
    lieu = properties.place,
    temps = as_datetime(properties.time / 1000),
    profondeur_km = geometry.coordinates %>% sapply(`[`, 3),
    longitude = geometry.coordinates %>% sapply(`[`, 1),
    latitude = geometry.coordinates %>% sapply(`[`, 2)
  ) %>%
  arrange(desc(temps))

glimpse(seismes)

dir.create("data/raw", recursive = TRUE, showWarnings = FALSE)
write.csv(seismes, "data/raw/seismes_japon.csv", row.names = FALSE)

