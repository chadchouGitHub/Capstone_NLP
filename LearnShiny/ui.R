

# Define UI for application that draws a histogram
## Lesson 2 by make new ui.R and server.R 
## position="right" in sidebarLayout, and html <h1> <h2>.... to h1(), h2()... in R
## also many html text format. See after p().at line 38..
## Lesson 3 Adding widgets
shinyUI(fluidPage(
        titlePanel("censusVis"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Create demographic maps with 
        information from the 2010 US Census."),
                        
                        selectInput("var", 
                                    label = "Choose a variable to display",
                                    choices = list("Percent White", "Percent Black",
                                                   "Percent Hispanic", "Percent Asian"),
                                    selected = "Percent White"),
                        
                        sliderInput("range", 
                                    label = "Range of interest:",
                                    min = 0, max = 100, value = c(0, 100))
                ),
                
                mainPanel()
        )
        
))