library(shiny)
phdtime <- read.csv("timetodegree.csv",header=T)

shinyServer(   
  function(input, output) {
   output$text1 <- renderText({
                  "'Time to degree' is measured in years from date of
                  undergraduate graduation to the date of doctoral graduation. 
                  'Registered time to degree' is measured in years and 
                  excludes gap years, summers, and time taken off for fieldwork, 
                  family leave, or medical leave. 'Age at degree' is how old 
                  the average PhD recipient is at doctoral graduation. 
                  For more information or to download the original data, visit: 
                  http://www.nsf.gov/statistics/infbrief/nsf06312/"
                  })
      
   output$plot <- renderPlot({
             data <- switch(input$time,
                           "Time to degree"=
                               switch(input$discipline, 
                               "All (average)" = phdtime$All_TTD, 
                               "Education" = phdtime$Ed_TTD,
                               "Humanities" = phdtime$Hum_TTD, 
                               "Social Sciences" = phdtime$Soc_TTD, 
                               "Physical Sciences" = phdtime$Phys_TTD, 
                               "Life Sciences" = phdtime$Life_TTD, 
                               "Health" = phdtime$Health_TTD, 
                               "Engineering" = phdtime$Eng_TTD,
                               "Other" = phdtime$Other_TTD
                               ),
                           
                           "Registered time to degree"=
                              switch(input$discipline, 
                                     "All (average)" = phdtime$All_RTD, 
                                     "Education" = phdtime$Ed_RTD,
                                     "Humanities" = phdtime$Hum_RTD, 
                                     "Social Sciences" = phdtime$Soc_RTD, 
                                     "Physical Sciences" = phdtime$Phys_RTD, 
                                     "Life Sciences" = phdtime$Life_RTD, 
                                     "Health" = phdtime$Health_RTD, 
                                     "Engineering" = phdtime$Eng_RTD,
                                     "Other" = phdtime$Other_RTD
                              ),
                           
                           "Age at degree"=
                              switch(input$discipline, 
                                     "All (average)" = phdtime$All_Age, 
                                     "Education" = phdtime$Ed_Age,
                                     "Humanities" = phdtime$Hum_Age, 
                                     "Social Sciences" = phdtime$Soc_Age, 
                                     "Physical Sciences" = phdtime$Phys_Age, 
                                     "Life Sciences" = phdtime$Life_Age, 
                                     "Health" = phdtime$Health_Age, 
                                     "Engineering" = phdtime$Eng_Age,
                                     "Other" = phdtime$Other_Age
                              )
             )
      
            plot(data~phdtime$Year, type="l",xlim=c(1977,2004),
                 main=paste("Average", tolower(input$time), 
                            "for the discipline of", 
                            tolower(input$discipline)),
                 ylab=paste(tolower(input$time), "in years"),
                 xlab="year of PhD completion", 
                 col=input$color,lwd=2)                  

            })
   
  }
)                                     