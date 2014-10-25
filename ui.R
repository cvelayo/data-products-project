
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Blood Alcohol Calculator"),

  # Sidebar with a inputs for needed variables
  sidebarLayout(
    sidebarPanel(
      h3("Documentation/Instructions"),
      p("This app calculates an estimated peak Blood Alcohol Concentration (BAC) 
        based on user submitted values. To run this app, select your gender, enter
        your weight in pounds, choose the number of standard drinks consumed, and
        select the number of hours these drinks were consumed over."),
      p("The ui.R and server.R files are located at the following GitHub repository:"),
      a("https://github.com/cvelayo/data-products-project"),
      br(),
      p("================="),
      radioButtons("gender",
                   "Select your gender:",
                   choices = list("Male" = 1, "Female" = 2)),
      numericInput("weight",
                  "Your weight:",
                  140,
                  min = 80,
                  max = 500,
                  step = 5),
      helpText("In pounds."),
      numericInput("drinks",
                   "Number of standard alcohol drinks:",
                   0,
                   min = 0,
                   max = 40),
      helpText("A standard drink is 12 ounces of beer, 5 ounces of wine, or 1.5 ounces of liquor."),
      numericInput("hours",
                   "Length of time of drinking:",
                   0,
                   min = 0,
                   max = 24),
      helpText("In hours"),
      actionButton("submit",'Submit')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      h2("Estimated peak Blood Alcohol Concentration"),
      textOutput("text1"),
      br(),
      h2("How long until I am sober?"),
      textOutput("text2")
    )
  )
))
