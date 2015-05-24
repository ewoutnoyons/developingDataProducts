library(shiny)
library(datasets)

data(mtcars)
fit <- lm(mpg ~ wt + factor(cyl) + disp + factor(am), data = mtcars)
fuelConsumption <- function(wt, cyl, disp, am) predict(fit, data.frame(wt, cyl, disp, am))

shinyServer(
        function(input, output) { 
                output$inputWeight <- renderPrint({input$wt})
                output$inputCylinders <- renderPrint({input$cyl})
                output$inputDisplacement <- renderPrint({input$disp})
                output$inputGearbox <- renderPrint({input$am})
                output$prediction <- renderPrint({fuelConsumption(input$wt / 1000,
                                                                  input$cyl,
                                                                  input$disp,
                                                                  ifelse(input$am == "Automatic", 1, 0))})
        }
)