## Shiny app practioce
## library(shiny)
runExample("01_hello")
## Every shiny app need to has its own directory with ui.R and server.R
## What happen is there are more than a one xxx.R in the same directory ?
## Ans: notthing will happen to it. (But when I run showcase mode, the file appear at bottom 
## of the app with a new tab to show the content.)

## Use runApp() to run your shiny App. 
## What is the path I need to piont my shiny App? ui.R path or shiny App fold path?
## Ans: When app directory is in your working directory. In this case, 
## the filepath is just the name of the directory.
##--------------------------------------------------------------------------------------
## Note: (In case you are wondering, 
## the Hello Shiny app’s files are saved in a special system directory called "01_hello". 
## This directory is designed to work with the runExample ("01_hello") call.)
##---------------------------------------------------------------------------------------

runApp("LearnShiny")
runApp("LearnShiny", display.mode = "showcase")
## When I run this display.mode in the scrip with Run App buttom. It does not work to show the 
## display.mode. I need to run the runApp() with disply.mode in Console with the path 
## to the App directory.

system.file("examples", package="shiny")


## What different between shiny::runApp('Capstone_NLP/LearnShiny') and runApp('Capstone_NLP/LearnShiny')?
