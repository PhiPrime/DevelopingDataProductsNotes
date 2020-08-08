#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a scatterplot w/ or w/o labels
shinyServer(function(input, output) {

    output$plot1 <- renderPlot({#assign to plot1

        set.seed(1618033)
        number_of_points <- input$numeric #Value of "numeric"
        minX <- input$sliderX[1] #first value of sliderX
        maxX <- input$sliderX[2]
        minY <- input$sliderY[1]
        maxY <- input$sliderY[2]
        dataX <- runif(number_of_points, minX, maxX) #uniform dist
        dataY <- runif(number_of_points, minY, maxY) #with min & max of input
        xlab <- ifelse(input$show_xlab, #value of logical
                       "X Axis", #Show if TRUE
                       "") #Empty if FALSE
        ylab <- ifelse(input$show_ylab, "Y Axis", "")
        main <- ifelse(input$show_title, "Random Uniform Distribution", "")

        #Generate plot with given parameters
        plot(dataX, dataY, xlab = xlab, ylab = ylab, main = main,
             xlim = c(-100, 100), ylim = c(-100, 100))
    }) #close renderPlot({ call
}) #close shinyServer(function...{
