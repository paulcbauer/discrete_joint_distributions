
# Counter
# A server parameters
SP <- list()
# Record the number of poeple who have used the app
#    since initiation on the server
SP$npers <- 0


shinyServer(  function(input, output){

  # Counter
  # shinyServer is Started up every time the domain is called.
  # Use <<- to assign to the global server environment.
  SP$npers <<- SP$npers + 1
  output$hits <- renderText({
    paste0("Pageviews: " , SP$npers)
  })
  
  
  ess.ch <-
    read.csv(
      "http://paulcbauer.eu/wp-content/uploads/2015/11/ess_ch.csv", header = TRUE, sep =
        ","
    )
  
 
output$plot <- renderPlot({
    forgraph <- as.matrix(prop.table(table(ess.ch[,input$var1], ess.ch[,input$var2])))
    class(forgraph)
    library(lattice)
    library(latticeExtra)
    cloud(forgraph, panel.3d.cloud = panel.3dbars,
          xbase = 0.4, ybase = 0.4, zlim = c(0, max(forgraph)),
          scales = list(arrows = FALSE, just = "right"), zlab=NULL, xlab = input$var1, ylab =   input$var2,
          col.facet = level.colors(forgraph, at = do.breaks(range(forgraph), 20),
                                   col.regions = gray.colors,
                                   colors = TRUE),
          colorkey = list(col = gray.colors, at = do.breaks(range(forgraph), 20)),
          screen = list(z = input$z.scale, x = input$x.scale))
  })


output$frequency <- renderPrint({
  abs.freq.table <- table(ess.ch[,input$var1], ess.ch[,input$var2])
  abs.freq.table  
})


output$relfrequency <- renderPrint({
  abs.freq.table <- table(ess.ch[,input$var1], ess.ch[,input$var2])
  abs.freq.table  
  rel.freq.table <- round(prop.table(table(ess.ch[,input$var1], ess.ch[,input$var2])),2)
  rel.freq.table
})



})
