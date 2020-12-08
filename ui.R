library(shiny)
library(shinythemes)
library(shinyWidgets)
library(leaflet)
library(dplyr)


# Top page for project intro

country_picker <- selectInput(
  inputId = "current_country",
  label = "Choose Country/City",
  choices = c("Seattle", "San Francisco", "New York", "Tokyo",
              "Mexico City", "Melbourne", "London", "Cape Town"),
  selected = "Seattle"
)

filter_map_judge <- selectInput(
  inputId = "filter_yes_or_no",
  label = "Filter Map?",
  choices = c("Yes", "No"),
  selected = "No"
  
)


ui <- shinyUI(fluidPage(
  navbarPage(
    theme = shinytheme("cyborg"),
    title = "Airbnb World Situation during COVID-19",
    
    # TL;DL
    tabPanel(
      title = "HOME",
      # General Info
      tags$h3("TL;Dl"),
      p(
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
                              In other words, up until now, Airbnb has typically been a user behavior of *I'm going to use Airbnb because I'm going to visit a city called ~.
                              * But at this moment, it seems to be more of a reverse flow of
                              *I want to stay in this Airbnb house or environment,
                              so I'm going to visit a city called ~.*"
      ),
      p(
        "My question is whether they should continue with the concept of medium- to long-term stay
                              concept in 2021 and beyond, should the pandemic show a recovery trend.
                              At this stage, as mentioned above, retention rates are higher than in the immediate aftermath
                              of the pandemic.
                              This is because people's lifestyles are changing from urban dwellings and office work to
                              a work-from-home (work-from-anywhere) lifestyle.
                              This analysis will examine the dataset from the Inside Airbnb, which is an independent, non-commercial set of tools and data that allows to explore how Airbnb is being used in cities around the world. The analysis will try to find user's behavior during the pandemic (After January 2020 to October 2020) and what their demand has been changing.
                              For the Midpoint Deliverly, the report will focus on Seattle region so as to find key trends."
      ),
      
      tags$h3("Company Overview"),
      p(
        "Airbnb is a U.S.-based startup in the private accommodation business and one of the world's largest marketplaces, with over 7 million places to stay and tens of thousands of original experiences,
                            all provided by local hosts. Airbnb, which helps people achieve economic independence, has helped millions of hospitality entrepreneurs worldwide work on their spare rooms and
                            the things they love to do and have helped promote communities through tourism. Airbnb is a company that connects people around the world and fosters community and trust."
      ),
      
      tags$h3("Domain of Interest"),
      p(
        "The COVID-19 pandemic has hit our company, Airbnb, a private accommodation business that has been synonymous with the sharing economy, hard.
                          The company has laid off about 25% of its workforce in response to the volatile home-stay, travel, and hospitality markets.
                          Approximately 1,900 of the current 7,500 employees are affected to prepare the company for a significant shift in its business going forward.
                          Also, since COVID-19, Airbnb has been forced to deal with free housing for medical professionals and 100% refunds for those who cancel trips.
                          Despite raising $1 billion in dead financing, absolute profit declines in its core business have led to inevitable layoffs and the need to change its core business model to fit the new era."
      ),
      
      p(
        "Brian Chesky, Managing Director of the firm, sums up the travel market's reality at this stage in two ways."
      ),
      p("- We don't know exactly when travel will return."),
      p("- When travel does return, it will look different. "),
      p(
        "As stated by the CEO, the company has been searching for a new business model for the travel market's new era since the pandemic happens.
                          One of their efforts has been to change their platform concept from a short-term to a mid- long term accommodation model.
                          Prior to the pandemic, our company focused on the business traveler and general traveler as the primary users of private accommodation facilities.
                          However, they hypothesized that in the post-pandemic era, demand for vacation rental would be focused on workspaces for remote workers and facilities for spending time with small groups of friends,
                          such as family members. Therefore, they changed their central business concept based on medium to long-term use cases.
                          As a result, between May 17 and June 3, Airbnb's room bookings outperformed the YoY comparison. Besides, in mid-July, the company recorded more than 1 million overnight bookings
                          for the first time in four months, and such bookings were characterized by a high number of non-urban bookings.
                          A new form of Airbnb is beginning to emerge with social distance in mind. In other words, up until now, Airbnb has typically been a user behavior of I'm going to use Airbnb because I'm going to visit a city called ~.
                          But at this moment, it seems to be more of a reverse flow of I want to stay in this Airbnb house or environment, so I'm going to visit a city called ~.
                          My question is whether they should continue with the concept of medium- to long-term stay concept in 2021 and beyond, should the pandemic show a recovery trend.
                          At this stage, as mentioned above, retention rates are higher than in the immediate aftermath of the pandemic.This is because people's lifestyles are changing from urban dwellings and office work to a work-from-home (work-from-anywhere) lifestyle.
                          After identifying the data on Airbnb's availability and bookings at this stage, we examine the geographic and physical characteristics of properties that are growing in bookings despite the pandemic.
                          Based on these numerical facts, it is interesting to explore the future of travel, the potential of Airbnb and the potential in the hospitality business in the era of new travel new normal."
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
                   
                   h4("Airbnb Listings"),
                   p("Filter map as you with. Select 'yes' if you would like to see filtered Airbnb listings map,
                     otherwise select 'no'. "),
                   filter_map_judge,
                   country_picker
                   
                 )
               )
             ))
  )
))