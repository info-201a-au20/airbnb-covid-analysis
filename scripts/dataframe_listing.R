
get_listings <- function(dataframe) {
  current_dataframe <- read.csv(dataframe, stringsAsFactors = FALSE) 
  current_dataframe$price <- as.numeric(sub("\\$","", current_dataframe$price))
  
  return(current_dataframe)
  
}

seattle_listings <- suppressWarnings(get_listings("data/Seattle_2020_October/listings.csv.gz"))
tokyo_listings <- suppressWarnings(get_listings("data/Tokyo_2020_October/listings.csv.gz"))
mexico_listings <- suppressWarnings(get_listings("data/MexicoCity_2020_October/listings.csv.gz"))
melbourne_listings <- suppressWarnings(get_listings("data/Melbourne_2020_October/listings.csv.gz"))
london_listings <- suppressWarnings(get_listings("data/London_2020_October/listings.csv.gz"))
capetown_listings <- suppressWarnings(get_listings("data/CapeTown_2020_October/listings.csv.gz"))
sanfrancisco_listings <- suppressWarnings(get_listings("data/SanFrancisco_2020_October/listings.csv.gz"))
newyork_listings <- suppressWarnings(get_listings("data/NewYork_2020_October/listings.csv.gz"))
