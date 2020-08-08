#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that displays a slider
shinyUI(fluidPage(

    # Application title
    titlePanel("Hello Slider!"),

    # Sidebar with a slider input
    sidebarLayout(
        sidebarPanel(
            h1("Move the Slider!"),
            sliderInput("slider1", #Slider's name
                        "Slider Me!", #Slider's dialog
                        min = 0,
                        max = 100,
                        value = 0), #Starting value
            sliderInput("slider2", #Slider name isn't use elsewhere
                        "Subtract this slider",
                        min = 0,
                        max = 100,
                        value = 73)
        ),

        # Show the value of slider2
        mainPanel(
            h3("First Slider Value:"),
            textOutput("text1"), #Call output$text1 value
            h3("Value of Difference"),
            textOutput("dif") #Call output$dif value
        ) #The order of sidebarPanel & mainPanel doesn't matter
    )
))
