library(shiny)

# Define UI for application that draws a histogram
## Lesson 2 by make new ui.R and server.R 
## position="right" in sidebarLayout, and html <h1> <h2>.... to h1(), h2()... in R
## also many html text format. See after p().at line 38..
shinyUI(fluidPage(
        
        # Application title
        titlePanel("Hello world!"),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(position = "right",
                sidebarPanel(
                        h1("What is going to happen"),
                        img(src = "fig1.png", height = 38, width = 71),
                        sliderInput("bins",
                                    "Number of bins:",
                                    min = 5,
                                    max = 50,
                                    value = 30)
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        plotOutput("distPlot"),
                        h1("First level title"),
                        h2("Second level title"),
                        h3("Third level title"),
                        h4("Fourth level title"),
                        h5("Fifth level title"),
                        h6("Sixth level title"),
                        h6("use align= center in h6()", align = "center"), ## use align="center" in h6()
                        h6("A NEW HOPE", align = "center"),
                        h5("It is a period of civil war.", align = "center"),
                        h4("Rebel spaceships, striking", align = "center"),
                        h3("from a hidden base, have won", align = "center"),
                        h2("their first victory against the", align = "center"),
                        p("p creates a paragraph of text."),
                        p("A new p() command starts a new paragraph. Supply a style attribute to change the format of the entire paragraph.", style = "font-family: 'times'; font-si16pt"),
                        strong("strong() makes bold text."),
                        em("em() creates italicized (i.e, emphasized) text."),
                        br(),
                        code("code displays your text similar to computer code"),
                        div("div creates segments of text with a similar style. This division of text is all blue because I passed the argument 'style = color:blue' to div", style = "color:blue"),
                        br(),
                        p("span does the same thing as div, but it works with",
                          span("groups of words", style = "color:blue"),
                          "that appear inside a paragraph."),
                        img(src = "fig1.png", height = 381, width = 712) ## fig must in www folder
                )
        )
))