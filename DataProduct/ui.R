library(shiny)

shinyUI(fluidPage(
   titlePanel("How long does a PhD really take in the United States?"),
   
   sidebarLayout(
      sidebarPanel(
         helpText("See the average time to degree for PhD students
                  in different fields."),
      
      selectInput("discipline", 
        label = "Choose a discipline to display:",
        choices = list("All (average)", "Education",
          "Humanities", "Social Sciences", 
          "Physical Sciences", "Life Sciences", 
          "Health", "Engineering","Other"),
        selected = "All (average)"),

      selectInput("time", 
                  label = "Choose a measure of time to display:",
                  choices = list("Time to degree",
                                 "Registered time to degree",
                                 "Age at degree"),
                  selected = "Time to degree"),
      
      selectInput("color", 
                  label = "Choose a color to display:",
                  choices = list("blue",
                                 "green",
                                 "yellow",
                                 "orange",
                                 "red",
                                 "purple"),
                  selected = "blue")
      
    ),

    
    
    mainPanel(
      plotOutput("plot"),
      textOutput("text1")
    )
  )
))