# server.R

shinyServer(function(input, output) {
        
        output$text1 <- renderText({ 
                paste("You have selected", input$var)
        })
        output$text2 <- renderText({ 
                "You have selected"
        })
}
)