## Shiny app practioce
library(shiny)
runExample("01_hello")
## Every shiny app need to has its own directory with ui.R and server.R
## What happen is there are more than a one xxx.R in the same directory ?

## Use runApp() to run your shiny App. 
## What is the path I need to piont my shiny App? ui.R path or shiny App fold path?
## Ans: When app directory is in your working directory. In this case, 
## the filepath is just the name of the directory.
##--------------------------------------------------------------------------------------
## Note: (In case you are wondering, 
## the Hello Shiny app’s files are saved in a special system directory called "01_hello". 
## This directory is designed to work with the runExample ("01_hello") call.)
##---------------------------------------------------------------------------------------

