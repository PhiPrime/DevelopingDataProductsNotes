library(shiny)

# Application that takes user input, fits two models & displays plot
shinyUI(fluidPage(
    titlePanel("Predict Horsepower from MPG"),
    sidebarLayout(
        sidebarPanel(
            # User entered MPG
            sliderInput("sliderMPG", "What is the MPG of the car?",
                        min = 10, max = 35, value = 20),
            # Logicals for displaying models
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
        ),
        # Show a plot with models overlayed & predicted point
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Horsepower from Model 1:"),
            textOutput("pred1"),
            h3("Predicted Horsepower from Model 2:"),
            textOutput("pred2")
        )
    )
))
