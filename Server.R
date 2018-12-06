if (!require(shiny)) {install.packages('shiny')}
library("shiny")

shinyUI(
  fluidPage(
    
    titlePanel("UDPipe NLP workflow"),  # name the shiny app
    
    sidebarLayout(    # creates a sidebar layout to be filled in
      
      sidebarPanel(   # creates a panel struc in the sidebar layout
        
        # user reads input file into input box here:
        fileInput("file1", 
                  "Upload data (any text file)"),
        
     
      ),   # end of sidebar panel
      
      ## Main Panel area begins.
      mainPanel(
        
        tabsetPanel(type = "tabs",   # builds tab struc
                    
                    tabPanel("Overview",   # leftmost tab
                             
                             h4(p("Data input")),
                             
                             p("This app supports text files", align="justify"),
                             
                             p("Please refer to the link below for sample csv file."),
                             a(href="https://github.com/sudhir-voleti/sample-data-sets/blob/master/Segmentation%20Discriminant%20and%20targeting%20data/ConneCtorPDASegmentation.csv"
                               ,"Sample data input file"),   
                             
                             br(),
                             
                             h4('How to use this App'),
                             
                             p('To use this app, click on', 
                               span(strong("Upload data (.txt file)")),
                               'and upload any text file')),
                    
                    # second tab coming up:
                    tabPanel("table of xpos", 
                             
                             # plot1 object returned by server.R
                             tableOutput('table of xpos')),
                    
                    # third tab coming up:
                    tabPanel("Cooccurrences of words",
                             
                             # obj 'clust_summary' from server.R
                             plotOutput('cooccurrences plot')),
                    
                    # fourth tab coming up:
                    tabPanel("Coallocations",
                             
                             dataTableOutput('Coallocations'))
                    
        ) # end of tabsetPanel
      )# end of main panel
    ) # end of sidebarLayout
  )  # end if fluidPage
) # end 