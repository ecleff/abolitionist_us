ui <- fluidPage(
  titlePanel("Visualizing the American University"),
  leafletOutput("m"),
  p(),
  fluidRow(
    sidebarLayout(
      sidebarPanel(
        helpText("Let's learn about the histories of universities in America. Users are encouraged to explore the different map layers and consider the implications of overlap."),
        
        selectInput("var", 
                    label = "Select the map layer you want to learn more about:",
                    choices = c("Indigenous Lands", 
                                "Land-grant Universities",
                                "Oldest Universities", 
                                "All Universities"),
                    selected = "Indigenous Lands")
      ),
      
      mainPanel(
        textOutput("selected_var")
      )
    )
  )
)

