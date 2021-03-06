library(markdown)

ess.ch  <- read.table("http://www.paulcbauer.eu/wp-content/uploads/2014/11/ess_ch.txt", header=TRUE, sep=",")
  
  shinyUI(fluidPage(
    

  titlePanel("Discrete joint distributions"),
  

  sidebarLayout(
    sidebarPanel(
      
      selectInput("var1", label = "Y-Variable:",
                  choices = c("trust.police", "trust.politicians", "political.interest", 
                              "voted.last.election", "party.voted.last", "swiss.citizen", 
                              "happy", "health", "age", "hh.income"), selected = "voted.last.election"),
      selectInput("var2", label = "X-Variable:",
                  choices = c("trust.police", "trust.politicians", "political.interest", 
                              "voted.last.election", "party.voted.last", "swiss.citizen", 
                              "happy", "health", "age", "hh.income"), selected = "political.interest"), 
      sliderInput("x.scale", label = "Tip plot:",
                  min = -100, max = 100, value = -67, step = 1),   
      sliderInput("z.scale", label = "Turn plot:",
                  min = -100, max = 100, value = -31, step = 1),

      br(), br(),
      
      div("Shiny app by", 
          a(href="http://paulcbauer.eu/",target="_blank", 
            "Paul C. Bauer"),align="right", style = "font-size: 8pt"),
    
      
      div("Shiny/R code:",
          a(href="https://github.com/paulbauer/discrete_joint_distributions",
            target="_blank","GitHub"),align="right", style = "font-size: 8pt")
      
  ),

 mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel("Plot", plotOutput("plot"), verbatimTextOutput("frequency"), verbatimTextOutput("relfrequency")),
        tabPanel("Instructions", includeMarkdown("instruction.md")),
        tabPanel("About", includeMarkdown("about.md"))
      
      )
    )
  )
))













      



