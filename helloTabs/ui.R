library(shiny)
shinyUI(fluidPage(
    titlePanel("Hello Tabs!"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        #Sidebar isn't required for tabs, other panels can work too
        sidebarPanel(
            textInput("box1", "Enter Tab 1 Text:", value = "Tab 1!"),
            textInput("box2", "Enter Tab 2 Text:", value = "Tab 2!"),
            textInput("box3", "Enter Tab 3 Text:", value = "Tab 3!")
        ),

        # Show the tabs in a tabsetPanel
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Tab 1", br(), textOutput("out1")),
                        tabPanel("Tab 2", br(), textOutput("out2")),
                        tabPanel("Tab 3", br(), textOutput("out3"))
            )
        )
    )
))
