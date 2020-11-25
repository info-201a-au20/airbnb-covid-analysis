library("dplyr")


### Summary Table

# get dataset
seattle_listing <- read.csv("./data/Seattle_2020_October/listings.csv", stringsAsFactors = FALSE)


# function to get summary table for seattle listing dataset since it has overview info
# - Well formated column name
# - only conains relevant info
# - Be interntionally sorted in a meaningful way


summary_table <- function(dataset) {
  get_summary_table <- dataset %>%
    group_by(room_type) %>%
    filter(last_review == max(last_review))
  
  return(get_summary_table)
}


summary_table(seattle_listing)
