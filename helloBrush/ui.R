library(shiny)

shinyUI(fluidPage(
    titlePanel("Visualize Many Models"),
    sidebarLayout(
        sidebarPanel(
            #Output info of lm
            h3("Slope"),
            textOutput("slopeOut"),
            h3("Intercept"),
            textOutput("intOut")
        ),
        mainPanel(
            #Set brush param to allow user to drag over points to include
            plotOutput("plot1", brush = brushOpts(
                id = "brush1"
            ))
        )
    )
))
