library(shiny)
library(dplyr)
library(plotly)

source('get_data.R')
data(iris)
shinyServer(function(input, output) {
  # Return the requested dataset of species
  datasetInput <- reactive({
    switch(input$species,
           "Setosa" = df("setosa"),
           "Versicolor" = df("versicolor"),
           "Virginica" = df("virginica")
           )
  })
  
  # Return the requested dataset with specific quality of species
  qualitiesInput <- reactive({
    df <- datasetInput()
    switch(input$characteristics,
           "Sepal Length" = df$Sepal.Length,
           "Sepal Width" = df$Sepal.Width,
           "Petal Length" = df$Petal.Length,
           "Petal Width" = df$Petal.Width
           )
  })
  
  # Display the histogram in plot tab
  output$histogram <- renderPlot({
    x <- qualitiesInput()
    hist(x, main = "Histogram")
  })
  
  # Display scatter plot comparing the Sepal length vs. Sepal Width
  output$plot1 <- renderPlot({
    plot(iris$Sepal.Length, iris$Sepal.Width, 
         main = "Scatter Plot of Sepal Length vs. Sepal Width (All Species)",
         xlab = "Sepal Length", 
         ylab = "Sepal Width",
         col = "blue")
  })
  
  # Display scatter plot comparing the Petal length vs. Petal width
  output$plot2 <- renderPlot({
    plot(iris$Petal.Length, iris$Petal.Width, 
         main = "Scatter Plot of Petal Length vs. Petal Width (All Species)",
         xlab = "Petal Length", 
         ylab = "Petal Width",
         col = "red")
  })
  
  # Generate a summary of the iris data in the summary tab
  output$summary <- renderPrint({
    summary(iris)
  })
  
})

