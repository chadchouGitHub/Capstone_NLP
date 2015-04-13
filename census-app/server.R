# server.R

b <- c("is some thing I need to show you")

shinyServer(function(input, output) {
        d <- c("  !!! d() it is in the shinyServer")       
        a<- renderText({ 
                paste("You have chosen a range that goes from",
                      input$range[1], "to", input$range[2], b,d) ## When I need use "input" from ui.R I need to put this line in the 
                                                ## shinyServer(). If I am not useing anything form ui.R I can have this line 
                                                ## outside the shinyServer()
                })
        ## each output need to have a textOutput in the ui.R
        output$text1 <- renderText({ 
                paste("You have selected", input$var)
        })
        output$text2 <- renderText({ 
                "You have selected"
        })
        output$text3 <- a
}
)