# server.R for word-app

source("~/word-app/wordHelper.R") # This will load percent_map function
## I find I need to put ~/ as home directory to have file load for shiny.
## I don't need ~/ for home directory when I run the commond in console
load("~/word-app/data/sortedOneTwoTri.RData") ## loading data
## percent_map(counties$white, "darkgreen", "% white") ## make map... but the ledgen are too big to covery the map in preview.


# b <- c("is some thing I need to show you")
##--------------------code above here will run only once in shiny-----------------------
shinyServer(
        function(input, output) {
                ## -----another place for code-----
                
                ## ----- another place for code-----
                output$map <- renderPlot({
                        
                        data <- switch(input$var, 
                                       "Percent White" = counties$white,
                                       "Percent Black" = counties$black,
                                       "Percent Hispanic" = counties$hispanic,
                                       "Percent Asian" = counties$asian)
                        
                        color <- switch(input$var, 
                                        "Percent White" = "darkgreen",
                                        "Percent Black" = "black",
                                        "Percent Hispanic" = "darkorange",
                                        "Percent Asian" = "darkviolet")
                        
                        legend <- switch(input$var, 
                                         "Percent White" = "% White",
                                         "Percent Black" = "% Black",
                                         "Percent Hispanic" = "% Hispanic",
                                         "Percent Asian" = "% Asian")
                        
                        percent_map(var = data, 
                                    color = color, 
                                    legend.title = legend, 
                                    max = input$range[2], 
                                    min = input$range[1])
                })
                ## -----third place for code-----
                
                ## -----third place for code-----
        }
)