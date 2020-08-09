library(shiny)

# Server just needs to create out1-3 for text from box1-3
shinyServer(function(input, output) {
    output$out1 <- renderText(input$box1)
    output$out2 <- renderText(input$box2)
    output$out3 <- renderText(input$box3)
})
