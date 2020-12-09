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
source("scripts/table_summary.R")
#source("scripts/general_info.R")
#source("scripts/table_summary.R")
source("visualizer/chart1.R")
source("visualizer/chart2.R")
source("visualizer/chart3.R")
source("ui.R")
source("scripts/word_cloud.R")



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
            listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id,]
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
          get_filtered_reviews(mexico_reviews, mexico_listings)
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
            listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id,]
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
    
    chart_plot <- first_chart(matched_dataframe)
    
    return(chart_plot)
    
  })
  
  
  output$priceRoomBoxPlot <- renderPlot({
    if (input$filter_boxplot_yes_or_no == "Yes") {
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
            listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id,]
          return(matched)
        }
    }
    
    # change to input depends on country
    if (input$current_boxplot_country == "Seattle") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(seattle_reviews, seattle_listings)
      } else {
        matched_dataframe = seattle_listings
      }
    }
    else if (input$current_boxplot_country == "San Francisco") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(sanfrancisco_reviews, sanfrancisco_listings)
      } else {
        matched_dataframe = sanfrancisco_listings
      }
    }
    else if (input$current_boxplot_country == "New York") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(newyork_reviews, newyork_listings)
      } else {
        matched_dataframe = newyork_listings
      }
    }
    else if (input$current_boxplot_country == "Tokyo") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(tokyo_reviews, tokyo_listings)
      } else {
        matched_dataframe = tokyo_listings
      }
    }
    else if (input$current_boxplot_country == "Mexico City") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(mexico_reviews, mexico_listings)
      } else {
        matched_dataframe = mexico_listings
      }
    }
    else if (input$current_boxplot_country == "Melbourne") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(melbourne_reviews, melbourne_listings)
      } else {
        matched_dataframe = melbourne_listings
      }
    }
    else if (input$current_boxplot_country == "London") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(london_reviews, london_listings)
      } else {
        matched_dataframe = london_listings
      }
    }
    else if (input$current_boxplot_country == "Cape Town") {
      if (input$filter_boxplot_yes_or_no == "Yes") {
        matched_dataframe <-
          get_filtered_reviews(capetown_reviews, capetown_listings)
      } else {
        matched_dataframe = capetown_listings
      }
    }
    
    
    chart_boxplot <- second_chart(matched_dataframe)
    
    return(chart_boxplot)
  })
  
  
  output$showCloud <- renderWordcloud2({
    
      if (input$filter_cloud_yes_or_no == "Yes") {
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
              listings_dataset[listings_dataset$id %in% filtered_dataset$listing_id,]
            return(matched)
          }
      }
      
      # change to input depends on country
      if (input$current_cloud_country == "Seattle") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(seattle_reviews, seattle_listings)
        } else {
          matched_dataframe = seattle_listings
        }
      }
      else if (input$current_cloud_country == "San Francisco") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(sanfrancisco_reviews, sanfrancisco_listings)
        } else {
          matched_dataframe = sanfrancisco_listings
        }
      }
      else if (input$current_cloud_country == "New York") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(newyork_reviews, newyork_listings)
        } else {
          matched_dataframe = newyork_listings
        }
      }
      else if (input$current_cloud_country == "Tokyo") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(tokyo_reviews, tokyo_listings)
        } else {
          matched_dataframe = tokyo_listings
        }
      }
      else if (input$current_cloud_country == "Mexico City") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(mexico_reviews, mexico_listings)
        } else {
          matched_dataframe = mexico_listings
        }
      }
      else if (input$current_cloud_country == "Melbourne") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(melbourne_reviews, melbourne_listings)
        } else {
          matched_dataframe = melbourne_listings
        }
      }
      else if (input$current_cloud_country == "London") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(london_reviews, london_listings)
        } else {
          matched_dataframe = london_listings
        }
      }
      else if (input$current_cloud_country == "Cape Town") {
        if (input$filter_cloud_yes_or_no == "Yes") {
          matched_dataframe <-
            get_filtered_reviews(capetown_reviews, capetown_listings)
        } else {
          matched_dataframe = capetown_listings
        }
      }
    
    cloud <- get_cloud_visual_listings(matched_dataframe)
    
    return(cloud)
  })
  
  
  output$showCloudReviews <- renderWordcloud2({
    
    if(input$current_cloud_reviews_country =="Seattle") {
      matched_dataframe <- seattle_reviews
    } else if(input$current_cloud_reviews_country == "San Francisco") {
      matched_dataframe <- sanfrancisco_reviews
    } else if(input$current_cloud_reviews_country == "New York") {
      matched_dataframe <- newyork_reviews
    } else if(input$current_cloud_reviews_country == "Tokyo") {
      matched_dataframe <- tokyo_reviews
    } else if(input$current_cloud_reviews_country == "Mexico City") {
      matched_dataframe <- mexico_reviews
    } else if(input$current_cloud_reviews_country == "Melbourne") {
      matched_dataframe <- melbourne_reviews
    } else if(input$current_cloud_reviews_country == "London") {
      matched_dataframe <- london_reviews
    } else if(input$current_cloud_reviews_country =="Cape Town") {
      matched_dataframe <- capetown_reviews
    }
    
    cloud <- get_cloud_visual_reviews(matched_dataframe)
    
    return(cloud)
    
    
    
  })
  
  
  
})
