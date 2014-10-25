
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
    
  bac <- reactive({
      if (input$gender == 1) {
          gender <- "male"
          bac <- ((.806 * input$drinks * 1.2)/(input$weight * .453592 * .58)) - (.017 * input$hours)
      }
      else {
          gender <- "female"
          bac <- ((.806 * input$drinks * 1.2)/(input$weight * .453592 * .49)) - (.017 * input$hours)
      }
  }) 
  
  gender <- reactive({
      if (input$gender == 1) {
          gender <- "male"
      }
      else {
          gender <- "female"
      }
  })

  output$text1 <- renderText({

    if (bac() == 0 | bac() < 0) {bac <- "0.0"}
    else {bac <- round(bac(),2)}
    
    if (input$submit == 0) {"Please use the widgets on the left to enter the appropriate values if
                            you wish to estimate your Blood Alcohol Concentration."}
    else {
        paste("An average ", gender(), " who weighs ", input$weight, "pounds, and has ", input$drinks,
              "drinks over ", input$hours, "hours would have a Blood Alcohol Concentration of ", bac,".")
    }

  })
  
  output$text2 <- renderText({
      
      
      if (input$submit == 0) {"Since you have not updated the default values we don't know your Blood Alcohol Concentration yet."}
      else {
          if (bac() > 0) {
              sober <-  round(bac() / .017,1)
              paste("This person's Blood Alcohol Concentration would be expected to return to 0.0 in ", sober, "hours.")
          }
          else {
              "A Blood Alcohol Concentration of 0.0 means you are already sober!"
          }
      }
      
  })
})
