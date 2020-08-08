#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that plots random numbers
shinyUI(fluidPage(

    # Application title
    titlePanel("Plot Random Numbers"),
    sidebarLayout(
        sidebarPanel(
            numericInput("numeric", #Name
                         "How Many Random Numbers Should be Plotted?", #Title
                         min = 1, max = 1000, value = 1000,
                         step = 1 #How much to increment up/down by
                         ),
            sliderInput("sliderX", "Pick Minimum and Maximum X Values",
                        -100, 100,
                        value = c(-50, 50) #list makes it 2 inputs
                        ),
            sliderInput("sliderY", "Pick Minimum and Maximum Y Values",
                        -100, 100,
                        value = c(-50, 50)),
            checkboxInput("show_xlab", "Show/Hide X Axis Label",
                          value = TRUE #Default value
                          ),
            checkboxInput("show_ylab", "Show/Hide Y Axis Label",
                          value = TRUE),
            checkboxInput("show_title", "Show/Hide Title"), #No default given
        ),

        # Show a plot of the generated scatter plot
        mainPanel(
            h3("Graph of Random Points"),
            plotOutput("plot1")
        )
    )
))
