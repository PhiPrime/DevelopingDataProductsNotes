library(shiny)

# Define server logic required to generate plot with toggle-able model fits
shinyServer(function(input, output) {
    #Create a spline term (at 20) in the data
    mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)

    #Fit a model that ignores the break point
    model1 <- lm(hp ~ mpg, data = mtcars)

    #Fit a model with the break point
    model2 <- lm(hp ~ mpgsp + mpg, data = mtcars)

    #Create reactive functions that return the predicted values of each model
    # `reactive` is needed since we are defining values based on user input
    model1pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model1, newdata = data.frame(mpg = mpgInput))
    })
    model2pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model2, newdata = data.frame(
            mpg = mpgInput,
            mpgsp = ifelse(mpgInput - 20 > 0, mpgInput - 20, 0)))
    })

    # Assign a plot to plot1 variable
    output$plot1 <- renderPlot({
        mpgInput <- input$sliderMPG

        #Static plot
        plot(mtcars$mpg, mtcars$hp,
             xlab = "Miles Per Gallon", ylab = "Horsepower",
             xlim = c(10, 35), ylim = c(50,350),
             bty = "n", pch = 16)

        # Show model if respective logical is TRUE
        if(input$showModel1){
            abline(model1, col = "#FF0000", lwd = 2)

            #Show predicted point on plot, accessing the value from
            # model1pred, a reactive function
            points(mpgInput, model1pred(), col = "#FF0000", pch = 16, cex = 2)
        }
        if(input$showModel2){
            model2lines <- predict(model2, newdata = data.frame(
                mpg = 10:35,
                mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0)
            ))
            # Model 2 is non-linear so `abline` won't work for this case
            lines(10:35, model2lines, col = "#00FF00", lwd = 2)
            points(mpgInput, model2pred(), col = "#00FF00", pch = 16, cex = 2)
        }

        # Add a static legend
        legend(25, 250,
               legend = c("Model 1 Prediction", "Model 2 Prediction"),
               col = c("#FF0000", "#00FF00"),
               pch = 16,  cex = 1.2, bty = "n") # box type = "n"one
    })

    # Assign prediction of each model as text to appropriate variables
    output$pred1 <- renderText({
        model1pred()
    })
    output$pred2 <- renderText({
        model2pred()
    })
})
