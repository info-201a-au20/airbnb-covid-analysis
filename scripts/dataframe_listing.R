
seattle_listings <- read.csv("data/Seattle_2020_October/listings.csv", stringsAsFactors = FALSE)
# data cleaning
seattle_listings$price <- as.numeric(sub("\\$","", seattle_listings$price))

## Will use for the next analysis
# tokyo_listings <- read.csv("../data/Tokyo_2020_October/listings.csv", stringsAsFactors = FALSE)

