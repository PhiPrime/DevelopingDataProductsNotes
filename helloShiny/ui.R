#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(

    # Application title
    titlePanel("Hello Shiny!"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Hello Sidebar"),
            p("The p() function is for writing paragraphs.
              Are new lines autofilled? No, they aren't,", br(),
              "HTML uses <br> to make a line break.", br(),
              "R can use the wrapper function, br(), as a parameter",
              "in a function call to make line breaks.", br(),
              "Most markdown emphasis is till present, such as displaying",
              code("code(\"text\")"), br(),
              "We can also use ", code("em(\"text\")"), em("to make italics,"),
              br(), code("strong(\"text\")"),
              strong(" to make bold,", em("and we can combine them."), br(),
              "Don't forget to add all the closing paratheses"),
              "to un-emphasize text.")
            ),
        # Show a plot of the generated distribution
        mainPanel(
            h3("Hello Main Panel")
        )
    )
))
