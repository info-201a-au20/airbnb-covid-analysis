library("dplyr")
source("scripts/dataframe_listing.R")

### Summary Table

# get dataset
# function to get summary table for seattle listing dataset

summary_table <- function(dataset) {
  get_summary_table <- list()
  
  # analyze last 30days usecases group by room_type
  get_summary_table$"Last 30 Days" <- dataset %>%
    group_by(room_type) %>%
    summarize(
      mean = mean(number_of_reviews_l30d),
      median = median(number_of_reviews_l30d),
      Total = sum(number_of_reviews_l30d)
    ) %>%
    arrange(-Total)
  
  # analyze last 30days city name group by host_neighbourhood
  get_summary_table$"Last 30 Days Neighbourhood" <- dataset %>%
    group_by(host_neighbourhood) %>%
    summarize(
      mean = mean(number_of_reviews_l30d),
      median = median(number_of_reviews_l30d),
      Total = sum(number_of_reviews_l30d),
  
    ) %>%
    arrange(-median)
  
  # analyze last 12 months group by room_type
  get_summary_table$"Last 12 Months" <- dataset %>%
    group_by(room_type) %>%
    summarize(
      mean = mean(number_of_reviews_ltm),
      median = median(number_of_reviews_ltm),
      Total = sum(number_of_reviews_ltm)
    ) %>%
    arrange(-Total)
  
  # analyze last 12 months city by host_neighbourhood
  get_summary_table$"Last 12 Months Neighbourhood" <- dataset %>%
    group_by(host_neighbourhood) %>%
    summarize(
      mean = mean(number_of_reviews_ltm),
      median = median(number_of_reviews_ltm),
      Total = sum(number_of_reviews_ltm)
    ) %>%
    arrange(-median)
  
  return(get_summary_table)
}
