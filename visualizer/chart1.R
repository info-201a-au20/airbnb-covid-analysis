library(ggplot2)

source("scripts/general_info.R")
source("visualizer/chart3.R")


## This function will produce ggplot chart that describes
## the relationships between Airbnb property capactiy (accommodates) and 
## price with respect to the room type. 

first_chart <- function(dataset) {

chart <- dataset %>% 
  ggplot(aes(x = price, y = accommodates, fill = room_type)) +
  geom_point(size = 4, shape = 21, color = "white", stroke = 1.5, na.rm = TRUE) +
  scale_fill_brewer(palette = "Paired") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Relationships between Property Capacity and Price", x="Price", y="Accommodates")+
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(color = "black"))

return(chart)
}


first_chart(matched_dataframe)
