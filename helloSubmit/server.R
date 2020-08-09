library(shiny)

# Define server logic required to generate output, no additional code is
# needed for the submit button.
shinyServer(function(input, output) {
    mtcars$mpgsp <- ifelse(mtcars$mpg - 20 > 0, mtcars$mpg - 20, 0)
    model1 <- lm(hp ~ mpg, data = mtcars)
    model2 <- lm(hp ~ mpgsp + mpg, data = mtcars)
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
    output$plot1 <- renderPlot({
        mpgInput <- input$sliderMPG
        plot(mtcars$mpg, mtcars$hp,
             xlab = "Miles Per Gallon", ylab = "Horsepower",
             xlim = c(10, 35), ylim = c(50,350),
             bty = "n", pch = 16)
        if(input$showModel1){
            abline(model1, col = "#FF0000", lwd = 2)
            points(mpgInput, model1pred(), col = "#FF0000", pch = 16, cex = 2)
        }
        if(input$showModel2){
            model2lines <- predict(model2, newdata = data.frame(
                mpg = 10:35,
                mpgsp = ifelse(10:35 - 20 > 0, 10:35 - 20, 0)
            ))
            lines(10:35, model2lines, col = "#00FF00", lwd = 2)
            points(mpgInput, model2pred(), col = "#00FF00", pch = 16, cex = 2)
        }
        legend(25, 250,
               legend = c("Model 1 Prediction", "Model 2 Prediction"),
               col = c("#FF0000", "#00FF00"),
               pch = 16,  cex = 1.2, bty = "n")
    })
    output$pred1 <- renderText({
        model1pred()
    })
    output$pred2 <- renderText({
        model2pred()
    })
})
