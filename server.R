
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/

 amt <- c("Automatic", "Manual")
data(mtcars)
fit <- lm(mpg ~ hp +factor(am), data=mtcars)
 
predictmpg1 <- function(hp1,am1){
#  as.numeric(am)
  am1 <- am1 - 1
  m <- data.frame(hp1,am1)
#  m[1,2] <- m[1,2]-1
  row.names(m) <- "mpg"
  colnames(m) <- c("hp","am")
  predict(fit,m)
}
#predictmpg1 <-  function(hp,am) hp+am 
# sum <- "This"

library(shiny)

shinyServer(function(input, output) {
  
   output$inputhp <- renderText({input$hp1})
   output$inputam <- renderText({amt[as.numeric(input$am1)]})
   output$predictmpg <- renderPrint({predictmpg1(input$hp1,as.numeric(input$am1))})
#   output$summary <- renderText({sum})
})
