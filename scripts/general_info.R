## function to store general information from the dataset

library(skimr)
# A function that takes in a dataset and returns a list of infor about it:


capetown <- read.csv("data/CapeTown_2020_October/listings.csv", stringsAsFactors = FALSE)
london <- read.csv("data/London_2020_October/listings.csv", stringsAsFactors = FALSE)
melbourne <- read.csv("data/Melbourne_2020_October/listings.csv", stringsAsFactors = FALSE)
mexico <- read.csv("data/MexicoCity_2020_October/listings.csv", stringsAsFactors = FALSE)
seattle <- read.csv("data/Seattle_2020_October/listings.csv", stringsAsFactors = FALSE)
tokyo <- read.csv("data/Tokyo_2020_October/listings.csv", stringsAsFactors = FALSE)


get_summary_info <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  ret$row <- nrow(dataset)
  ret$head <- head(dataset, 10)
  ret$dim <- dim(dataset)
  ret$sumamry <- summary(dataset)
  ret$skim <- skim(dataset)
  
  
  return(ret)
}

tokyo_listing_overview <- get_summary_info(tokyo)
seattle_listing_overview <- get_summary_info(seattle)
mexico_listing_overview <- get_summary_info(mexico)
melbourne_listing_overview <- get_summary_info(melbourne)
london_listing_overview <- get_summary_info(london)
capetown_listing_overview <- get_summary_info(capetown)



