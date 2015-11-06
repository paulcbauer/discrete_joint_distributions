library(markdown)

ess.ch  <- read.table("http://www.paulcbauer.eu/wp-content/uploads/2014/11/ess_ch.txt", header=TRUE, sep=",")
  
  shinyUI(fluidPage(
    
  # Application title
  titlePanel("Discrete joint distributions"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
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
      sliderInput("x.scale", label = "Turn plot:",
                  min = -100, max = 100, value = -67, step = 1),   
      sliderInput("z.scale", label = "Tipp plot:",
                  min = -100, max = 100, value = -31, step = 1)

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













      



