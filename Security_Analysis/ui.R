library(shiny)
library(ggplot2)
# Define UI for application that draws a histogram
ui <- fluidPage(
    
    headerPanel("Security Analysis"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("A", "What is the Urban Population percentage?", min=0, max=100, value = 20),
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE),
            checkboxInput("showModel3", "Show/Hide Model 3", value = TRUE),
            h5("Avergae Murder Rate Across USA:"),
            textOutput("X1"),
            h5("Avergae Assault Rate Across USA:"),
            textOutput("X2"),
            h5("Avergae Rape Rate Across USA:"),
            textOutput("X3"),
            h5("How to Use:"),
            h5("Use Slider to input the Urban population percentage. Main Panel will show predicted value of various crime rate and respective interactive plot can be access going through various tabs.")
        ),
        
        mainPanel(
            h4("Data is used from USArrest dataset. In the plot, the red horizontal line refers to average of crime rates across USA. if a population percentage shows value in the upper part of red line, that location is less secure compared to other locations in USA."),
            h4("Predicted Murder rate from Model 1:"),
            textOutput("xpred1"),
            h4("Predicted Assault rate from Model 2:"),
            textOutput("xpred2"),
            h4("Predicted Rape rate from Model 2:"),
            textOutput("xpred3"),
            h4("Note: all the Arrest rate are calculated per 100,000 population."),
            tabsetPanel(
                tabPanel(title = "Model1",plotOutput("plot1")),
                tabPanel(title = "Model2",plotOutput("plot2")),
                tabPanel(title = "Model3",plotOutput("plot3"))
            )
        )))
