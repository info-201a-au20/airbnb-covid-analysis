library("shiny")
library("rsconnect")
library("plotly")

source("ui.R")
source("server.R")

shinyApp(ui = ui, server = server)

