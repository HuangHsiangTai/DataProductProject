library(shiny)

shinyServer(function(input, output) {
  output$fit = renderPrint({
    n <- length(input$vars)         
    if (n == 0) {
      model <- 'Please choose at least one variable'
    }
    else {

      model <- paste(input$vars[1:n], collapse=" + ")
      model <- paste0("fit <- mpg ~ ", model)
    }
    return(model)
    
  })
  
  output$fit.summary = renderPrint({  
      fit <- paste(input$vars, collapse=" + ")
      fit <- paste0("mpg ~ ", fit)
      fit <- lm(fit, data = mtcars)     
    return(summary(fit))
  })
  
})