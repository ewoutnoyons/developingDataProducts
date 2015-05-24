library(shiny)

shinyUI(fluidPage(
        titlePanel("Calculate a car's fuel consumption"),
        p("Enter car specifications in the left panel, click submit, and find out the expected fuel consumption!"),
        br(),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("wt",
                            label = "Weight of car (in pounds)",
                            min = 1000, max = 6000, value = 3000),
                        br(),
                        radioButtons("cyl", 
                             label = "Number of cylinders",
                             choices = c(4, 6, 8),
                             selected = 4),
                        br(),
                        sliderInput("disp",
                            label = "Engine displacement (in cubic inches)",
                            min = 50, max = 500, value = 200),
                        br(),
                        selectInput("am", 
                            label = "Gearbox",
                            choices = c("Manual", "Automatic")),
                        br(),
                        submitButton("Submit")
                        ),
        
                mainPanel(
                        h3("You entered:"),
                        br(),
                        ("Weight"),
                        verbatimTextOutput("inputWeight"),
                        ("Cylinders"),
                        verbatimTextOutput("inputCylinders"),
                        ("Displacement"),
                        verbatimTextOutput("inputDisplacement"),
                        ("Gearbox"),
                        verbatimTextOutput("inputGearbox"),
                        br(),
                        h3("The estimated fuel consumption in miles per gallon is:"),
                        verbatimTextOutput("prediction")
                        )
        )
))
