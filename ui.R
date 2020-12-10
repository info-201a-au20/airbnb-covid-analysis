library(shiny)
library(shinythemes)
library(shinyWidgets)
library(leaflet)
library(dplyr)
library(wordcloud2)
source("scripts/table_summary.R")
source("scripts/general_info.R")
source("scripts/table_summary.R")


country_picker <- selectInput(
  inputId = "current_country",
  label = "Choose Country/City",
  choices = c(
    "Seattle",
    "San Francisco",
    "New York",
    "Tokyo",
    "Mexico City",
    "Melbourne",
    "London",
    "Cape Town"
  ),
  selected = "Seattle"
)

country_picker_chart <- selectInput(
  inputId = "current_chart_country",
  label = "Choose Country/City",
  choices = c(
    "Seattle",
    "San Francisco",
    "New York",
    "Tokyo",
    "Mexico City",
    "Melbourne",
    "London",
    "Cape Town"
  ),
  selected = "Seattle"
)

country_picker_boxplot <- selectInput(
  inputId = "current_boxplot_country",
  label = "Choose Country/City",
  choices = c(
    "Seattle",
    "San Francisco",
    "New York",
    "Tokyo",
    "Mexico City",
    "Melbourne",
    "London",
    "Cape Town"
  ),
  selected = "Seattle"
)

filter_map_judge <- selectInput(
  inputId = "filter_yes_or_no",
  label = "Filter Map?",
  choices = c("Yes", "No"),
  selected = "No"
  
)

filter_chart_judge <- selectInput(
  inputId = "filter_chart_yes_or_no",
  label = "Filter Chart?",
  choices = c("Yes", "No"),
  selected = "No"
  
)

filter_boxplot_judge <- selectInput(
  inputId = "filter_boxplot_yes_or_no",
  label = "Filter Box Plot?",
  choices = c("Yes", "No"),
  selected = "No"
  
)

filter_cloud_judge <- selectInput(
  inputId = "filter_cloud_yes_or_no",
  label = "Filter Cloud (Listing)?",
  choices = c("Yes", "No"),
  selected = "No"
  
)

filter_cloud_reviews_judge <- selectInput(
  inputId = "filter_cloud_reviews_yes_or_no",
  label = "Filter Cloud (Review)?",
  choices = c("Yes", "No"),
  selected = "No"
  
)



get_summary_table <- selectInput(
  inputId = "group_by_type_summary_table",
  label = "Select",
  choices = c(
    "analyze last 30days usecases group by room_type",
    "analyze last 30days city name group by host_neighbourhood",
    "analyze last 12 months group by room_type",
    "analyze last 12 months city by host_neighbourhood"
  ),
  selected = "analyze last 12 months city by host_neighbourhood"
  
)

country_picker_wordcloud <- selectInput(
  inputId = "current_cloud_country",
  label = "Choose Country/City",
  choices = c(
    "Seattle",
    "San Francisco",
    "New York",
    "Tokyo",
    "Mexico City",
    "Melbourne",
    "London",
    "Cape Town"
  ),
  selected = "Seattle"
)

country_picker_wordcloud_reviews <- selectInput(
  inputId = "current_cloud_reviews_country",
  label = "Choose Country/City",
  choices = c(
    "Seattle",
    "San Francisco",
    "New York",
    "Tokyo",
    "Mexico City",
    "Melbourne",
    "London",
    "Cape Town"
  ),
  selected = "Seattle"
)



background_image <-
  setBackgroundImage(src = "https://news.airbnb.com/wp-content/uploads/sites/4/2020/04/Airbnb_Peru_Skylodge.jpg")

ui <- shinyUI(fluidPage(
  navbarPage(
    theme = shinytheme("superhero"),
    title = "Airbnb World Situation during COVID-19",
    
    # TL;DL
    tabPanel(
      background_image,
      title = "HOME",
      sidebarLayout(
        sidebarPanel(
          tags$h3("TL;Dl"),
          tags$p(
            "- The COVID-19 pandemic led to a sharp drop in Airbnb users,
                                and the company was on the verge of a cash shortage due to the cancellation process."
          ),
          p(
            "- Simultaneously with the layoffs, the company raised funds and changed its platform concept
                              from short term rental to mid-long term rental."
          ),
          p(
            "- As remote work becomes more common for keeping social distancing,
                              Airbnb users have seen a surge in its use as a workspace,
                              with mid-July marking the first time in four months that more than one million
                              room bookings were made. However, it is unsure that it will last and be sustainable."
          ),
          
          tags$h3("Introduction"),
          p(
            "In mid-July, the company recorded more than 1 million overnight bookings for the first time in four months,
                              and such bookings were characterized by a high number of non-urban bookings,
                              according to the Airbnb offiial fiscal year report.
                              A new form of Airbnb is beginning to emerge with social distance in mind.
                              In other words, up until now, Airbnb has typically been a user behavior of 'I'm going to use Airbnb because I'm going to visit a city called ~.'
                              But at this moment, it seems to be more of a reverse flow of
                              'I want to stay in this Airbnb house or environment,
                              so I'm going to visit a city called ~.' This is understandable and this could be a next strategy for Airbnb as they use term 'GO NEAR' on their platform
            Especially, it is interesting to explore their current user data since they are about to go public! (Congrats!) ."
          ),
          p(
            "Use filter as you with. Select 'Yes' if you would like to see filtered Airbnb listings/reviews dataset, frequent used words for
            listing/review page.
            The filter dataset only shows the properties that user commented in the review with words such as 'COVID',
                    which we can asuume the place was used during the pandemic for specific reason.
            The data is between January 1, 2020 to October 10."
          ),
          
          tags$h3("Word Cloud <Listings>"),
          filter_cloud_judge,
          country_picker_wordcloud,
          tags$h3("Word Cloud <Reviews>"),
          country_picker_wordcloud_reviews
        ),
        
        
        mainPanel(
          wordcloud2Output(outputId = "showCloud"),
          p(""),
          wordcloud2Output(outputId = "showCloudReviews"),
          p(""),
          tags$h2("Key Question"),
          tags$blockquote(
            "My question is whether they should continue with the concept of medium- to long-term stay
                              concept in 2021 and beyond, should the pandemic show a recovery trend.
                              At this stage, as mentioned above, retention rates are higher than in the immediate aftermath
                              of the pandemic.
                              This is because people's lifestyles are changing from urban dwellings and office work to
                              a work-from-home (work-from-anywhere) lifestyle.
                              This analysis will examine the dataset from the Inside Airbnb, which is an independent, non-commercial set of tools and data that allows to explore how Airbnb is being used in cities around the world.
                              The analysis will try to find user's behavior during the pandemic (After January 2020 to October 2020) and what their demand has been changing.
                              "
          ),
          
        )
        
      )
    ),
    
    tabPanel(title = "Map",
             div(
               class = "outer",
               tags$head(includeCSS("styles.css")),
               fillPage(
                 leafletOutput(
                   outputId = "map",
                   width = "100%",
                   height = "100%"
                 ),
                 absolutePanel(
                   id = "controls",
                   class = "panel panel-default",
                   fixed = TRUE,
                   draggable = FALSE,
                   top = 60,
                   left = "auto",
                   right = 20,
                   bottom = "auto",
                   width = "auto",
                   height = "auto",
                   
                   
                   tags$h3("Airbnb Listings"),
                   p(
                     "Filter map as you with. Select 'Yes' if you would like to see filtered Airbnb listings map,
                     otherwise select 'No'. The property dataset was filtered, and the filter conditions used the following words
                     in the review comments left by users after January 1, 2020."
                   ),
                   p(
                     "- 'COVID|COVID-19|coronavirus|covid|virus|pandemic|remote|remote work|workation|staycation'"
                   ),
                   p(
                     "This filtering allows us to hypothesize that the facilities were used to refresh the pandemic, remote work, etc.
                     The colors of the graphs are color-coded by the minimum number of nights set for each facility. "
                   ),
                   
                   filter_map_judge,
                   country_picker
                   
                 )
                 
               )
             )),
    
    tabPanel(title = "Cap vs Price vs Room",
             sidebarLayout(
               sidebarPanel(
                 tags$h3("Cap vs Price vs Room"),
                 p(
                   "Filter chart as you with. Select 'Yes' if you would like to use filtered Airbnb listings dataset,
                     otherwise select 'No'. These charts show the price per night on the x-axis and the maximum number of people that can stay at the facility on the y-axis.
                     One chart is sourced from a data frame for the past 12 months but utilizes a dataset of guest reviews filtered by relevant terms such as 'COVID, COVID-19, and Remote Work'.
                   This helps to find Airbnb properties that have been used for specific purposes during the pandemic."
                 ),
                 filter_chart_judge,
                 country_picker_chart
               ),
               mainPanel(plotOutput("priceChart"))
             )),
    
    tabPanel(title = "Price Precise Data",
             sidebarLayout(
               sidebarPanel(
                 tags$h3("Price and Room Type Relationships"),
                 p(
                   "Filter map as you with. Select 'Yes' if you would like to use filtered Airbnb listings dataset,
                     otherwise select 'No'.Chart 2 shows the average, minimum and maximum prices for each room type.
                   The overall price averages are also represented in purple."
                 ),
                 filter_boxplot_judge,
                 country_picker_boxplot
               ),
               mainPanel(plotOutput("priceRoomBoxPlot"))
               
             )),
    
    tabPanel(title = "Go Deeper",
             sidebarLayout(
               sidebarPanel(
                 tags$h3("Quick Takeaways"),
                 p(
                   "When you look at the map with filtered data, it is clear that most of property requires guest to stay at least 20-30 days. It is understandable since Airbnb
                   currently encourages host to open their house as long term use, monthly useage."
                 ),
                 p(
                   "Surprisingly, we don't see major shift in average price for entire country/list between filter data and raw data.
                   However, most of the filtered data shows only Entire Home and hotels and shared houses are not even appeard as box plot, i.e, no data.
                   For example in Cape Town, hotel room, private room, shared room were used a lot, but only entire home and private room are used in filtered data."
                 ),
                 p(
                   "- We can see that the demand is mainly concentrated in facilities that can accommodate up to four people, up to a maximum of $200 per night.
            Conversely, withouf filter, we can see that facilities ranging from $400 to $500 per night are quite common,
            and demand is concentrated in facilities that accommodate between 4 and 8 people at most. It should be at least transparent that
            there has been a shift in demand for Airbnb, in the wake of the pandemic,
            especially for family vacation use and as a remote working place.
            In that sense, facilities for 12 or more people are only used few times, and
            Airbnb owners are likely to suffer from a demand that is unlikely to return. (Check <Cap vs Price vs Room> section)"
                 ),
                 tags$h3("Company Overview"),
                 p(
                   "Airbnb is a U.S.-based startup in the private accommodation business and one of the world's largest marketplaces, with over 7 million places to stay and tens of thousands of original experiences,
                            all provided by local hosts. Airbnb, which helps people achieve economic independence, has helped millions of hospitality entrepreneurs worldwide work on their spare rooms and
                            the things they love to do and have helped promote communities through tourism. Airbnb is a company that connects people around the world and fosters community and trust."
                 ),
                 tags$h3("Contact"),
                 p("Contact me via Github or Twitter!"),
                 p(
                   "Me => Taishi Masubuchi | Blockchain Researcher @ Quantstamp inc., Flutter/Dart, Solidity Dev based in US and Japan"
                 ),
                 p(a("Github", href = "https://github.com/huskyjp")),
                 p(a("Twitter", href = "https://twitter.com/taiseaocean"))
               ),
               
               mainPanel(
                 HTML(
                   '<img src = "https://blog.adioma.com/wp-content/uploads/2016/07/how-airbnb-started-infographic.png">'
                 ),
                 tags$h2("Original Airbnb Concept - AirBed & Breakfast"),
                 
                 p(
                   a("Image Source: How Airbnb Stared - Infographic", href = "https://blog.adioma.com/how-airbnb-started-infographic/")
                 )
               )
             ))
  )
))
