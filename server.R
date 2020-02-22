## shiny server file for Diamond Price Prediction

library(shiny)

shinyServer(function(input, output) {
    ## -------------------------------
    ## Execute 1x at beginning
    
    library(UsingR)
    data(diamond)
        
    # Linar model
    fit <- lm(price ~ carat, data = diamond)
    
    
    
    ## -------------------------------
    ## Repetitive Part
    
    # reactive assigned variable:
    diamondPrediction <- reactive({
        my_carat = data.frame(carat = input$DiamondMassSlider)
        predict(fit, my_carat)
    })
    
    # Give prediction from linear model
    output$diamondPrediction <- renderText({
        round(diamondPrediction(), 0)
    })
    
    # Give Plot
    output$diamondPlot <- renderPlot({
    
        if(input$showFit) {
            ## Plot with linear model
            plot(diamond$carat, diamond$price,
                 xlab = "Mass (carats)",
                 ylab = "Price (SIN $)",
                 bg = "lightblue",
                 col = "black", cex = 1.1, pch = 21,frame = FALSE,
                 abline(fit), lwd = 2)
        }
        else {
            ## Plot without linear model
            plot(diamond$carat, diamond$price,
                 xlab = "Mass (carats)",
                 ylab = "Price (SIN $)",
                 bg = "lightblue",
                 col = "black", cex = 1.1, pch = 21,frame = FALSE)
        }
        
        # Add point for 
        points(input$DiamondMassSlider,
               diamondPrediction(), 
               col = "blue", pch = 16, cex = 2)
      })
  
})
