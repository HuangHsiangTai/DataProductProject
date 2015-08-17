library(shiny)
library(stats) 
library(graphics)
library(datasets)

shinyUI(fluidPage(
  
  headerPanel('Mtcars Analysis'),
  
  sidebarPanel(
    checkboxGroupInput('vars', 'Select variable from mtcars to predict mpg:', names(mtcars)[-1],
                       selected = names(mtcars)[-1])
  ),
  
  mainPanel(
    tabsetPanel(
      tabPanel('Documentation',
               h3('Documetation of the application'),
               p('We will use variables  in the  mtcars library to build up linear model for mpg'),
               br(), 
               strong('Data Desciption'),
               p('The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles.'),
               br(),
               strong("Format"),
               p('A data frame with 32 observations on 11 variables.'),
               p(' '),
               p('[, 1]   mpg	 Miles/(US) gallon'),
               p('[, 2]	 cyl	 Number of cylinders'),
               p('[, 3]	 disp	 Displacement (cu.in.)'),
               p('[, 4]	 hp	 Gross horsepower'),
               p('[, 5]	 drat	 Rear axle ratio'),
               p('[, 6]	 wt	 Weight (lb/1000)'),
               p('[, 7]	 qsec	 1/4 mile time'),
               p('[, 8]	 vs	 V/S'),
               p('[, 9]	 am	 Transmission (0 = automatic, 1 = manual)'),
               p('[,10]	 gear	 Number of forward gears'),
               p('[,11]	 carb	 Number of carburetors'),
               br(), 
               strong('Select the variable'),
               p('Please choose the combination of any variable in the sidebar to predict mpg'),
               br(),
               strong('Linear model tab'),
               p('In the "Linear model tab", I will build up the linear model for "mpg" based on the variable choosed in the sidebar.')
      ),
               
      
      tabPanel('Linear Model',
               br(),
               strong('Linear model for "mpg".'),
               br(),
               strong(verbatimTextOutput("fit")),
               br(),
               strong('summary(lm(fit))'),
               br(),
               verbatimTextOutput("fit.summary"),
               br()
      )
               )
    )
  ))