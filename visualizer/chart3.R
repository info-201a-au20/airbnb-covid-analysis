library(stringr)
library(leaflet)
library(tidytext)
library(dplyr)
source("scripts/general_info.R")
source("scripts/dataframe_review.R")

# filter property list with keyword "COVID" related terms we want to examine and
# compare it with seattle_reviews <id> so as to merge two datasets.
filtered_reviews <- seattle_reviews %>%
  select(listing_id, date, comments) %>%
  filter(str_detect(comments, "COVID|COVID-19|coronavirus|covid|virus|pandemic|remote|remote work|workation
                    |staycation")) %>%
  filter(date > "2020-01-01")

matched_dataframe <- seattle_listings[seattle_listings$id %in% filtered_reviews$listing_id, ]


# color setting for the circle maker, color changes depends on minimum night stay.
color_setting <- colorNumeric("YlGnBu", domain = matched_dataframe$minimum_nights)
# this function will create leaflet that shows geographic representation of Airbnb's location in Seattle.
# the matched_dataframe is used as dataset and popup includes short description and link to the airbnb site.
chart3 <- leaflet(data = matched_dataframe) %>%
  addProviderTiles(providers$CartoDB.DarkMatter, group="Dark") %>%
  addProviderTiles(providers$CartoDB.Positron, group="Light") %>%
  addCircleMarkers(~longitude,
             ~latitude,
             color = ~color_setting(minimum_nights),
             stroke = FALSE,
             radius = ~minimum_nights / 5, 
             fillOpacity = ~minimum_nights/10,
             popup = paste0("<b> You have to stay here at least: </b>", matched_dataframe$minimum_nights, "days!",
                            "<br><b> Overview: </b></br>", matched_dataframe$description,
                            "<a href='", matched_dataframe$listing_url, "' target =' _blank'>", 
                            "<br>Click Here for more details</a></br>", sep = "<br/>")) %>% 
  
  addLegend("bottomright", pal = color_setting,
            values = ~minimum_nights, title = "Minimum Nights", opacity = 1)

