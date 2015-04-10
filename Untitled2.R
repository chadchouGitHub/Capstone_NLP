## Shiny app practioce
## This Untitled2.R script is copied from the Untitled.R under the LearnShiny directory.
## When a R script under a shiny App directory (folder), it will show a Run App when you open 
## at it in R-studio. Every time you Click it, it Run ui.R and server.R not the commond you select in the script.

library(shiny)
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

runApp("Capstone_NLP/LearnShiny")
runApp("Capstone_NLP/LearnShiny", display.mode = "showcase")
## When I run this display.mode in the scrip with Run App buttom. It does not work to show the 
## display.mode. I need to run the runApp() with disply.mode in Console with the path 
## to the App directory.

system.file("examples", package="shiny")


## What different between shiny::runApp('Capstone_NLP/LearnShiny') and runApp('Capstone_NLP/LearnShiny')?



runExample("01_hello") # a histogram
runExample("02_text") # tables and data frames
runExample("03_reactivity") # a reactive expression
runExample("04_mpg") # global variables
runExample("05_sliders") # slider bars
runExample("06_tabsets") # tabbed panels
runExample("07_widgets") # help text and submit buttons
runExample("08_html") # Shiny app built from HTML
runExample("09_upload") # file upload wizard
runExample("10_download") # file download wizard
runExample("11_timer") # an automated timer


