library(shiny)
library(ggplot2)
server <- function(input, output) {
    output$X1 <- renderText(mean(USArrests$Murder))
    output$X2 <- renderText(mean(USArrests$Assault))
    output$X3 <- renderText(mean(USArrests$Rape))
    Model1 <- lm(Murder~UrbanPop,data = USArrests) 
    Model2 <- lm(Assault~UrbanPop,data = USArrests)
    Model3 <- lm(Rape~UrbanPop,data = USArrests) 
    
    Pred1 <- reactive({
        Xinput <- input$A
        predict(Model1,newdata = data.frame(UrbanPop=Xinput))
    })
    Pred2 <- reactive({
        Xinput <- input$A
        predict(Model2,newdata = data.frame(UrbanPop=Xinput))
    })
    Pred3 <- reactive({
        Xinput <- input$A
        predict(Model3,newdata = data.frame(UrbanPop=Xinput))
    })
    
    output$plot1 <- renderPlot({
        Xinput <- input$A 
        if(input$showModel1){
            plot(USArrests$UrbanPop, USArrests$Murder, xlab = "Urban Population Percentage", 
                 ylab = "Murder Rate", bty = "n", pch = 16,
                 xlim = c(0, 100), ylim = c(0,20),col="green",cex=2)
            abline(Model1, col = "blue", lwd = 2)
            abline(h=mean(USArrests$Murder),col="red")
            points( Xinput, Pred1(), col = "red", pch = 16, cex = 2)
        }
    })
    
    output$plot2 <- renderPlot({
        Xinput <- input$A 
        if(input$showModel2){
            plot(USArrests$UrbanPop, USArrests$Assault, xlab = "Urban Population Percentage", 
                 ylab = "Assault Rate", bty = "n", pch = 16,
                 xlim = c(0, 100), ylim = c(30,450),col="green",cex=2)
            abline(Model2, col = "blue", lwd = 2)
            abline(h=mean(USArrests$Assault),col="red")
            points( Xinput, Pred2(), col = "red", pch = 16, cex = 2)
        }
    })
    
    output$plot3 <- renderPlot({
        Xinput <- input$A 
        if(input$showModel3){
            plot(USArrests$UrbanPop, USArrests$Rape, xlab = "Urban Population Percentage", 
                 ylab = "Rape Rate", bty = "n", pch = 16,
                 xlim = c(0, 100), ylim = c(0,60),col="green",cex=2)
            abline(Model3, col = "blue", lwd = 2)
            abline(h=mean(USArrests$Rape),col="red")
            points( Xinput, Pred3(), col = "red", pch = 16, cex = 2)
        }
    })
    
    output$xpred1 <- renderText({Pred1()})
    output$xpred2 <- renderText({Pred2()})
    output$xpred3 <- renderText({Pred3()})
}