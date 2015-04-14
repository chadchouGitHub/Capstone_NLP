## Lesson 4
## Lesson 5
## install this package before you doing any things.
## install.packages(c("maps", "mapproj"))
## You also need to down load healper.R and counties.rds from shiny lesson 5 page.
## Take look of data in counties.rds 
## counties <- readRDS("census-app/data/counties.rds") ## make sure your work directory has the correct folder.
##  census-app is a sub-directory in your working directory. 
#library(maps)
#library(mapproj)
#source("census-app/helpers.R") # This will load percent_map function
#counties <- readRDS("census-app/data/counties.rds") ## loading data
#percent_map(counties$white, "darkgreen", "% white") ## make map... but the ledgen are too big to covery the map in preview.
 


shinyUI(fluidPage(
        titlePanel("censusVis"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Create demographic maps with 
                                 information from the 2010 US Census."),
                        
                        selectInput("var", 
                                    label = "Choose a variable to display",
                                    choices = c("Percent White", "Percent Black",
                                                "Percent Hispanic", "Percent Asian"),
                                    selected = "Percent White"),
                        
                        sliderInput("range", 
                                    label = "Range of interest:",
                                    min = 0, max = 100, value = c(0, 100))
                        ),
                
                mainPanel(plotOutput("map"))
        )

        ))