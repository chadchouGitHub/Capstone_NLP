# server.R



shinyServer(function(input, output) {
        a<- renderText({ 
                paste("You have A",input$range)
        })
        output$text1 <- renderText({ 
                paste("You have selected", input$var)
        })
        output$text2 <- renderText({ 
                "You have selected"
        })
        output$text3 <- a 
}
)