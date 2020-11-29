library(ggplot2)
source("scripts/general_info.R")
source("visualizer/chart3.R")

## Interaction between price and room type overlay with average price.

second_chart <- function(dataset) {
  chart <- dataset %>%
    ggplot(aes(x = room_type, y = price)) +
    geom_boxplot(aes(fill = room_type), na.rm = TRUE) +
    scale_y_log10() +
    labs(title = "Price by Room Type", x= "Room Type", y= "Price", fill = "Room Type",
         subtitle = "* Yellow line indicate average price") +
    theme(plot.title = element_text(hjust = 0.5)) +
    geom_hline(yintercept = mean(dataset$price, na.rm = TRUE), color = "yellow", linetype = 5)
  
}

