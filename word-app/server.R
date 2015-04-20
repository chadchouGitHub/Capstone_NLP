





##--------------------code above here will run only once in shiny-----------------------
shinyServer(
        function(input, output) {
                ## -----another place for code-----
                
                ## ----- another place for code-----
                output$text1 <- renderText({ 
                        paste("You have selected", input$inText)})
                ## -----third place for code-----
                
                ## -----third place for code-----
        }
)