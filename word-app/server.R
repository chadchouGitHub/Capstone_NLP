
lastTwoWordF <- function(x){
        splitWx <- unlist(strsplit(x, " "))
        y<- paste(splitWx[(length(splitWx)-1)],splitWx[length(splitWx)])
        return(y)
}




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