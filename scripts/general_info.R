## function to store general information from the dataset
library(readr)


seattle_listings <- read.csv("../data/Seattle_2020_October/listings.csv", stringsAsFactors = FALSE)
dim(seattle_listings)
seattle_listings$price <- as.numeric(sub("\\$","", seattle_listings$price))
# A function that takes in a dataset and returns a list of infor about it:


get_summary_info <- function(dataset) {
  summary_list <- list()
  # Most Expensive
  summary_list$most_expensive <- sum(max(dataset$price, na.rm = TRUE))
  
  # Average Price
  summary_list$avg_price <- mean(dataset$price, na.rm = TRUE)
  
  # Average people size they can host
  summary_list$avg_accommodates <- mean(dataset$accommodates, na.rm = TRUE)
  
  # Average avaiability in last 90 days
  summary_list$avg_availability_90 <- mean(dataset$availability_90, na.rm = TRUE)
  
  # Average availability in last 60 days
  summary_list$avg_availability_60 <- mean(dataset$availability_60, na.rm = TRUE)
  
  # average availability in last 30 days
  summary_list$avg_availability_30 <- mean(dataset$availability_30, na.rm = TRUE)
  
  # Average Total Host listing count 
  summary_list$avg_host_listing <- mean(dataset$calculated_host_listings_count, na.rm = TRUE)
  # Room type count

  # minimum night average
  summary_list$avg_min_night <- mean(dataset$minimum_nights, na.rm = TRUE)
  
  # average number of reviews in last 30 days
  summary_list$avg_num_reviews_30 <- mean(dataset$number_of_reviews_l30d, na.rm = TRUE)
  
  # total number of reviews in last 30 days
  summary_list$num_reviews_30 <- sum(dataset$number_of_reviews_l30d, na.rm = TRUE)
  
  # instant bookable rate
  
  # number of comment with keyword "COVID", "Corona Virus" or "COVID-19"
  
  return(summary_list)
}
seattle_listing_overview <- get_summary_info(seattle_listings)
seattle_listing_overview



# use View() to check description
tokyo_listing_overview <- get_summary_info(tokyo_listing)
mexico_listing_overview <- get_summary_info(mexico_listing)
melbourne_listing_overview <- get_summary_info(melbourne_listing)
london_listing_overview <- get_summary_info(london_listing)
capetown_listing_overview <- get_summary_info(capetown_listing)



