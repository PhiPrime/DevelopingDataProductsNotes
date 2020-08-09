#
# This is a simple Shiny Gadget.
#
library(shiny)
library(miniUI)

myFirstGadget <- function() {
    ui <- miniPage(
        gadgetTitleBar("My First Gadget")
    )
    server <- function(input, output, session) {
        # Put in a Done button to close the app
        observeEvent(input$done, {
            stopApp()
        })
    }
    runGadget(ui,server)
}

myFirstGadget()
