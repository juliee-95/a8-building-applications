library(shiny)

shinyUI(fluidPage(
  # Title Panel
  titlePanel("Iris Dataset"),
  # Declare sidebar layout
  sidebarLayout(
    # Put sidebar widgets here
    sidebarPanel(
      helpText("These side bar widgets will be used for the Histograms"),
      br(),
      # Widget 1: Input to select variable to plot
      selectInput("species", "Choose Species", 
                  choices = c("Setosa", 
                              "Versicolor", 
                              "Virginica")
                  ),
      br(),
      # Widget 2: Insert radio buttons for selecting quality of species
      radioButtons("characteristics", "Click which data you would like to see:",
                   choices = c("Sepal Length",
                               "Sepal Width",
                               "Petal Length",
                               "Petal Width")
                   )
    ),
    
    # Show a tabset that includes a histogram, scatter plots, summary
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Histogram", plotOutput("histogram")),
                  tabPanel("Scatter plot - Sepal", plotOutput("plot1")), 
                  tabPanel("Scatter plot - Petal", plotOutput("plot2")),
                  tabPanel("Summary", verbatimTextOutput("summary")) 
                  )
    )
  )
))

