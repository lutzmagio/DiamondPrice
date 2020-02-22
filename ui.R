## shiny UI file for Diamond Price Prediction

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Price Prediction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("DiamondMassSlider",
                   "Diamond Mass (carats):",
                   min = 0.12,
                   max = 0.35,
                   value = 0.2),
       checkboxInput("showFit", "Show/Hide Linear Model", value = TRUE)
    ),
    
    # Show a plot of the diamond dataset and optional 
    mainPanel(
        h3("Dataset and prediction visualization:"),
        plotOutput("diamondPlot"),
        
        h3("Predicted diamond price from linear model [SIN $]:"),
        textOutput("diamondPrediction")
    )
  )
))
