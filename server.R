library(shiny)
library(shinythemes)
library(shinyWidgets)
library(leaflet)
library(dplyr)
library(stringr)
library(leaflet)
library(tidytext)
library(dplyr)
library(plotly)
library(ggplot2)


source("scripts/dataframe_review.R")
source("scripts/dataframe_listing.R")
#source("scripts/general_info.R")
#source("scripts/table_summary.R")
#source("visualizer/chart1.R")
#source("visualizer/chart2.R")
source("visualizer/chart3.R")
source("ui.R")



server <- shinyServer(function(input, output) {
  output$map = renderLeaflet({
    if (input$filter_yes_or_no == "Yes") {
      get_filtered_reviews <-
        function(reviews_dataset, listings_dataset) {
          filtered_dataset <- reviews_dataset %>%
            select(listing_id, date, comments) %>%
            filter(
              str_detect(
                comments,
                "COVID|COVID-19|coronavirus|covid|virus|pandemic|remote|remote work|workation
                    |staycation|コロナ|コロナウイルス|リモートワーク|ワーケーション|テレワーク"
              )
            ) %>%
            filter(date > "2020-01-01")
          
          matched <-
            listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id, ]
          return(matched)
        }
    }
    
    # change to input depends on country
    if (input$current_country == "Seattle") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(seattle_reviews, seattle_listings)
      } else {
        matched_dataframe = seattle_listings
      }
    }
    else if (input$current_country == "San Francisco") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(sanfrancisco_reviews, sanfrancisco_listings)
      } else {
        matched_dataframe = sanfrancisco_listings
      }
    }
    else if (input$current_country == "New York") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(newyork_reviews, newyork_listings)
      } else {
        matched_dataframe = newyork_listings
      }
    }
    else if (input$current_country == "Tokyo") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(tokyo_reviews, tokyo_listings)
      } else {
        matched_dataframe = tokyo_listings
      }
    }
    else if (input$current_country == "Mexico City") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(mexicocity_reviews, mexico_listings)
      } else {
        matched_dataframe = mexico_listings
      }
    }
    else if (input$current_country == "Melbourne") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(melbourne_reviews, melbourne_listings)
      } else {
        matched_dataframe = melbourne_listings
      }
    }
    else if (input$current_country == "London") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(london_reviews, london_listings)
      } else {
        matched_dataframe = london_listings
      }
    }
    else if (input$current_country == "Cape Town") {
      if (input$filter_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(capetown_reviews, capetown_listings)
      } else {
        matched_dataframe = capetown_listings
      }
    }
    
    # color setting for the circle maker, color changes depends on minimum night stay.
    color_setting <-
      colorNumeric("YlGnBu", domain = matched_dataframe$minimum_nights)
    # this function will create leaflet that shows geographic representation of Airbnb's location in Seattle.
    # the matched_dataframe is used as dataset and popup includes short description and link to the airbnb site.
    chart3 <- leaflet(data = matched_dataframe) %>%
      addProviderTiles(providers$CartoDB.DarkMatter, group = "Dark") %>%
      addProviderTiles(providers$CartoDB.Positron, group = "Light") %>%
      addCircleMarkers(
        ~ longitude,
        ~ latitude,
        color = ~ color_setting(minimum_nights),
        stroke = FALSE,
        # SF has too huge minimum stay integer so adjust it
        radius = if (input$current_country == "San Francisco" &&
                     input$filter_yes_or_no == "No") {
          ~ minimum_nights / 1000000
        } else {
          ~ minimum_nights / 5
        },
        fillOpacity = ~ minimum_nights / 10,
        popup = paste0(
          "<b> You have to stay here at least: </b>",
          matched_dataframe$minimum_nights,
          "days!",
          "<br><b> Overview: </b></br>",
          matched_dataframe$description,
          "<a href='",
          matched_dataframe$listing_url,
          "' target =' _blank'>",
          "<br>Click Here for more details</a></br>",
          sep = "<br/>"
        )
      ) %>%
      
      addLegend(
        "bottomright",
        pal = color_setting,
        values = ~ minimum_nights,
        title = "Minimum Nights",
        opacity = 1
      )
    return(chart3)
    
  })
  
  output$priceChart <- renderPlot({
    
    if (input$filter_chart_yes_or_no == "Yes") {
      get_filtered_reviews <-
        function(reviews_dataset, listings_dataset) {
          filtered_dataset <- reviews_dataset %>%
            select(listing_id, date, comments) %>%
            filter(
              str_detect(
                comments,
                "COVID|COVID-19|coronavirus|covid|virus|pandemic|remote|remote work|workation
                    |staycation|コロナ|コロナウイルス|リモートワーク|ワーケーション|テレワーク"
              )
            ) %>%
            filter(date > "2020-01-01")
          
          matched <-
            listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id, ]
          return(matched)
        }
    }
    
    # change to input depends on country
    if (input$current_chart_country == "Seattle") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(seattle_reviews, seattle_listings)
      } else {
        matched_dataframe = seattle_listings
      }
    }
    else if (input$current_chart_country == "San Francisco") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(sanfrancisco_reviews, sanfrancisco_listings)
      } else {
        matched_dataframe = sanfrancisco_listings
      }
    }
    else if (input$current_chart_country == "New York") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(newyork_reviews, newyork_listings)
      } else {
        matched_dataframe = newyork_listings
      }
    }
    else if (input$current_chart_country == "Tokyo") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(tokyo_reviews, tokyo_listings)
      } else {
        matched_dataframe = tokyo_listings
      }
    }
    else if (input$current_chart_country == "Mexico City") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(mexico_reviews, mexico_listings)
      } else {
        matched_dataframe = mexico_listings
      }
    }
    else if (input$current_chart_country == "Melbourne") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(melbourne_reviews, melbourne_listings)
      } else {
        matched_dataframe = melbourne_listings
      }
    }
    else if (input$current_chart_country == "London") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(london_reviews, london_listings)
      } else {
        matched_dataframe = london_listings
      }
    }
    else if (input$current_chart_country == "Cape Town") {
      if (input$filter_chart_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(capetown_reviews, capetown_listings)
      } else {
        matched_dataframe = capetown_listings
      }
    }
    
    first_chart <- function(dataset) {
      chart <- dataset %>%
        ggplot(aes(x = price, y = accommodates, fill = room_type)) +
        geom_point(
          size = 4,
          shape = 21,
          color = "white",
          stroke = 1.5,
          na.rm = TRUE
        ) +
        scale_fill_brewer(palette = "Paired") +
        theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
        labs(title = "Relationships between Property Capacity and Price", x =
               "Price", y = "Accommodates") +
        theme_bw() +
        theme(
          panel.border = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          axis.line = element_line(color = "black")
        )
      
      return(chart)
    }
    
    chart_plot <- first_chart(matched_dataframe)
    
    return(chart_plot)
    
  })
  
  
  
  
  
})
