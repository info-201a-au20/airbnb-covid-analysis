## function to store general information from the dataset

library(skimr)
# A function that takes in a dataset and returns a list of infor about it:


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


# use View() to check description
tokyo_listing_overview <- get_summary_info(tokyo_listing)
seattle_listing_overview <- get_summary_info(seattle_listing)
mexico_listing_overview <- get_summary_info(mexico_listing)
melbourne_listing_overview <- get_summary_info(melbourne_listing)
london_listing_overview <- get_summary_info(london_listing)
capetown_listing_overview <- get_summary_info(capetown_listing)



