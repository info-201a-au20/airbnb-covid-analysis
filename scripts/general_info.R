library(readr)
library(dplyr)
source("scripts/dataframe_listing.R")

# A function that takes in a dataset and returns a list of information.
         
get_summary_info <- function(dataset) {
  summary_list <- list()
  # Most Expensive
  summary_list$most_expensive <- max(dataset$price, na.rm = TRUE)
  
  # Most Expensive Property Name
  summary_list$most_expensive_name <- dataset[which.max(dataset$price),] %>% 
    select(name)
  
  # Most Expensive Property booking number
  summary_list$most_expensive_booking <- dataset[which.max(dataset$price),] %>% 
    select(availability_90)
  
  summary_list$most_expensive_roomtype <- dataset[which.max(dataset$price),] %>% 
    select(property_type)
  
  summary_list$most_expensive_description <- dataset[which.max(dataset$price),] %>% 
    select(description)
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
  summary_list$avg_reviews_30 <- mean(dataset$number_of_reviews_l30d, na.rm = TRUE)
  
  # median of reviews in last 30 days
  summary_list$median_reviews_30 <- median(dataset$number_of_reviews_l30d, na.rm = TRUE)
  
  # total number of reviews in last 30 days
  summary_list$num_reviews_30 <- sum(dataset$number_of_reviews_l30d, na.rm = TRUE)
  
  # Average number of reviews in the past 12 months
  summary_list$avg_reviews_year <- mean(dataset$number_of_reviews_ltm, na.rm = TRUE)
  
  # Median of reviews in the past 12 months
  summary_list$median_reviews_year <- median(dataset$number_of_reviews_ltm, na.rm = TRUE)
  
  # Total number of reviews in the past 12 months
  summary_list$num_reviews_year <- sum(dataset$number_of_reviews_ltm, na.rm = TRUE)
  
  return(summary_list)
}


seattle_listings_overview <- get_summary_info(seattle_listings)
tokyo_listings_overview <- get_summary_info(tokyo_listings)
mexico_listings_overview <- get_summary_info(mexico_listings)
melbourne_listings_overview <- get_summary_info(melbourne_listings)
london_listings_overview <- get_summary_info(london_listings)
capetown_listings_overview <- get_summary_info(capetown_listings)
sanfrancisco_listings_overview <- get_summary_info(sanfrancisco_listings)
newyork_listings_overview <- get_summary_info(newyork_listings)




