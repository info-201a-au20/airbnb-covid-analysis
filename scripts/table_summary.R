library("dplyr")


### Summary Table

# get dataset
seattle_listing <- read.csv("./data/Seattle_2020_October/listings.csv", stringsAsFactors = FALSE)


# function to get summary table for seattle listing dataset since it has overview info
# - Well formated column name
# - only conains relevant info
# - Be interntionally sorted in a meaningful way


summary_table <- get_summary_table