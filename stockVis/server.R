# server.R

library(quantmod)
#source("helpers.R")

shinyServer(function(input, output) {

  output$plot <- renderPlot({
    data <- getSymbols(input$symb, src = "yahoo", 
      from = input$dates[1],
      to = input$dates[2],
      auto.assign = FALSE)
                 
    chartSeries(data, theme = chartTheme("white"), 
      type = "line", log.scale = input$log, TA = NULL)
  })
  
})


##---------Example of use getSymbols() from quantmod package--------------------
#
# data <- getSymbols(
#        "GE", src = "yahoo", ## src is a mthod to cll url or a script. Here is call "yahoo" script(method) from somewhere???
#        from = "2014-01-01", 
#        to = as.character(Sys.Date()), ## use system data as end date
#        auto.assign = FALSE )
#
# the data type is xts (I think is is time series DF, matrix, or table)
##---------Example of use getSymbols() from quantmod package--------------------







