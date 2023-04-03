#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI
ui <- fluidPage(
    sliderInput(inputId = "numBins",
                label = "Select number of bins",
                min = 1, max = 50, value = 30),
    selectInput(inputId = "datachoice",
                label = "Choose dataset to view:",
                choices = c("eruptions", "waiting"),
                selected = "eruptions"),
    plotOutput("myShinyPlot")
)

# Define server interactions
server <- function(input, output) {
    output$myShinyPlot <- renderPlot({
        ggplot(faithful) + geom_histogram(aes_string(x = input$datachoice),
                                          bins = input$numBins)
    })
}

# Run the application
shinyApp(ui = ui, server = server)
