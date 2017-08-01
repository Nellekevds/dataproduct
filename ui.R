library(shiny)

shinyUI(fluidPage(style = "background-color:lightsteelblue;",
    fluidRow(
        column(4,style = "background-color:lightsteelblue;","What is the temperature in Nottingham per month?",
               sliderInput("sliderMPG", "Choose month:", 1, 12, value = 1),
               checkboxInput("showModel1", "Show/Hide Linear model", value = TRUE),
               checkboxInput("showModel2", "Show/Hide Support Vector Machine", value = TRUE)
        ),
        column(8,style = "background-color:steelblue;",
               plotOutput("plot1"),
               h3("Predicted Temperature from linear model:"),
               textOutput("pred1"),
               h3("Predicted Temperature from support vector machine:"),
               textOutput("pred2")
        )
    )
))