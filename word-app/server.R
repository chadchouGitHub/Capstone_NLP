
source('wordHelper.R')



##--------------------code above here will run only once in shiny-----------------------
shinyServer(
        function(input, output) {
                ## -----another place for code-----
                triWx <-renderText({paste(
                        lastTwoWordF(input$inText))}) ## get inText to convert to lower case
               
                
               
                ## ----- another place for code-----
                output$text1 <- triWx
                ## -----third place for code-----
                
                ## -----third place for code-----
        }
)