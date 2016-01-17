
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("AUTOMOBILE PERFORMANCE PREDICTION"),
  
  # Sidebar with a slider input for number of observations
  sidebarPanel(
     numericInput("hp1", h3("Horsepower of your car:"), 350, min=50, max=400, step=5), 
    radioButtons("am1", label = h3("Transmission type of your car: "),choices = list("Automatic" = 1, "Manual" = 2), selected = 1),

    submitButton("Submit")
),
  
  # Show a plot of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel(h4("About me"), 
               h5("This application will help you to predict your automobile performce in the sense of miles per galon based on its horse power and transmission type. This information you need to provide is:"),
               p("* horse power: between 50 and 400"),
               p("* transmission type: automatic or manual"),
               br(),
               h5("After you input these two information on the left panel, you could hit the 'Try it out' to see your car's performance!"),
               br(),
               h5("This app is shared on github:"), 
               a("https://github.com/pestoo0221/shinyproduct",href="https://github.com/pestoo0221/shinyproduct"),
                h5("You can download and run this app on your computer by typing in R"),
              code("shiny::runGitHub('shinyproduct', 'pestoo0221')"),
               h5("Or you can run this app just by going to the website: "),
                a("https://pestoo0221.shinyapps.io/shinyproduct/",href="https://pestoo0221.shinyapps.io/shinyproduct/")
               ),
      
      
      tabPanel(h4("Try it out"),
      h4("Horsepower of your car is :"),
      verbatimTextOutput("inputhp"),
      h4("Transmission type of your car is :"),
      verbatimTextOutput("inputam"),
     h4("The predicted performance of your car is:"),
     verbatimTextOutput("predictmpg")
      )
    )
  )
)
)
