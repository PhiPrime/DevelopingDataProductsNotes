library(shiny)

shinyServer(function(input, output) {
    #Generate a lm based on highlighted points
    model <- reactive({
        brushed_data <- brushedPoints(trees,#Data we're using
                                      input$brush1, #name of input
                                      #Give column names x&y refer to in the df
                                      xvar = "Girth", yvar = "Volume")

        #Return NULL if a model can't be created
        if(nrow(brushed_data) < 2 ||
           all(brushed_data$Girth[1] == brushed_data$Girth)){
            return(NULL)
        }

        #Otherwise create the lm with the selected points by the user
        lm(Volume ~ Girth, data = brushed_data)
    })

    #Output slope if applicable
    output$slopeOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][2]
        }
    })

    #Output intercept if applicable
    output$intOut <- renderText({
        if(is.null(model())){
            "No Model Found"
        } else {
            model()[[1]][1]
        }
    })

    # Generate the plot that displays all the points from the trees data set
    output$plot1 <- renderPlot({
        plot(trees$Girth, trees$Volume,
             xlab = "Girth", ylab = "Volume", main = "Tree Measurements",
             cex = 1.5, pch = 16, bty = "n")
        if(!is.null(model())){
            abline(model(), col = "#00FF00", lwd = 2)
        }
    })
})
