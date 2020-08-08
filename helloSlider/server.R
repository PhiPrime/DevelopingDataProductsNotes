#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to return value of slider2
shinyServer(function(input, output) {

   output$text1 <- renderText(input$slider1)
   output$dif <- renderText(input$slider1 - input$slider2)

})
