library(shiny)
library(reshape2)
library(zoo)
library(e1071) 
shinyServer(function(input, output) {
    data <- data.frame(temp=nottem,date=as.yearmon(time(nottem)))
    data$month <- as.numeric(format(as.Date(data$date), "%m"))
    model1 <- lm(temp ~ month, data = data)
    model2 <- svm(temp ~ month, data = data)
 
    model1pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model1, newdata = data.frame(month = mpgInput))
    })
    model2pred <- reactive({
        mpgInput <- input$sliderMPG
        predict(model2, newdata = data.frame(month = mpgInput))
    })
  
    
    output$plot1 <- renderPlot({
        mpgInput <- input$sliderMPG
        
        plot(data$month, data$temp, xlab = "Month", 
             ylab = "Temperature (Fahrenheit)", bty = "n", pch = 16,
             xlim = c(0, 12), ylim = c(20, 70))
        if(input$showModel1){
            new_data<-predict(model1, newdata = data.frame(month = seq(1,12,0.01)))
            points(seq(1,12,0.01),new_data,type="l", col = "skyblue", lwd = 0.2)
        }
        if(input$showModel2){
            new_data<-predict(model2, newdata = data.frame(month = seq(1,12,0.01)))
            points(seq(1,12,0.01),new_data,type="l", col = "blue", lwd = 0.2)
        }
     
        legend(25, 250, c("Model 1 Prediction"), pch = 16, 
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(mpgInput, model1pred(), col = "red", pch = 16, cex = 2)
        points(mpgInput, model2pred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    output$pred2 <- renderText({
        model2pred()
    })

})
        
        