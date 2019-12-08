server <- function(input, output) {
  
  output$m<- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(-96.7026, 40.8136, zoom = 4) %>%
      addCircleMarkers(data=natshapes, label = natshapes$NAME, stroke=TRUE, color="green", radius=natshapes$radius, group="Indigenous Lands")%>%
      addCircleMarkers(data=all, label=all$NAME, color="orange", radius=6, group="All Universities") %>%
      addCircleMarkers(data=landgrant, label = landgrant$NAME, color="maroon", radius=6, group="Land-grant Universities") %>%
      addCircleMarkers(data=old, label=old$Institution, color="red", radius=6, group="Oldest Universities") %>%
      addLegend(
        position = 'bottomright',
        values=total$markerID,
        labels = list("Indigenous Lands", 
                      "Land-grant Universities", "Oldest Universities", 
                      "All Universities"),
        colors = list("green","maroon","red", "orange"),
        title='Spaces'
      ) %>%
      addLayersControl(
        overlayGroups = c("Indigenous Lands","Land-grant Universities", "Oldest Universities", "All Universities"),
        options = layersControlOptions(collapsed = FALSE)
      )
  })
  y <- reactive({
    if (input$var == "Indigenous Lands") {
      paste("This map layer represents data from the 2017 Cartographic Boundary File, Current American Indian/Alaska Native/Native Hawaiian Areas for United States from the U.S. Census Bureau's Master Address File / Topologically Integrated Geographic Encoding and Referencing (MAF/TIGER) Database (MTDB). Each data point represents an officially recognized tribal land, meaning that there are indigenous lands not included in this map that have yet to receive governmental recognition. We urge users to contemplate the factors that may contribute to this continued erasure and oppression of indigenous populations via withholding federal recognition in addition to the bureaucratic obstacles tribes face in order to achieve this status. The radius of each data point corresponds to the amount of land in square meters that the tribe is allotted by government regulation.")
    } 
    else if (input$var=="Oldest Universities"){
      paste("This map layer represents the 25 oldest colleges and universities in the United States (source: niche.com), the first of which being Harvard University, founded in 1636. While all education institutions in America are complicit in the interlocking systems of the carceral state and racial capitalism, these original institutions have more explicit ties to chattel slavery. Craig Steven Wilder’s book “Ebony and Ivy: Race, Slavery, and the Troubled History of America's Universities” (2014) details the relationship between American university formation and the institution of chattel slavery through the university’s physical construction via slave labor, the continuation of using slaves to perform labor for university staff and students, the sales transactions between slave owners and university directors to pay off institutional debt, etc. 
            ")
    }
    else if (input$var=="Land-grant Universities"){
      paste("This map layer represents the universities in the United States that emerged under the Homestead Act and Morrill Act of 1862, which Boggs et. al. argues “literally invests eastern states in the settlement, speculation, and securitization of federally claimed lands in the West as a means of generating capital for state colleges; enables Western states to use colleges as a means of accumulating state capacity by mandating military training for college students” (“Abolitionist University Studies: An Invitation”, Abigail Boggs, Eli Meyerhoff, Nick Mitchell, and Zach Schwartz-Weinstein, 2019, page 13). The formation of land-grant universities is just one of many historical examples of the university investing in and benefitting from settler colonialism by positing educational institutions as arbiters of progress.")
    }
    else {
      paste("Using data from the Colleges and Universities dataset (source: data.world), this layer illustrates the pervasive presence of secondary education institutions in the United States. Each data point represents any Post Secondary Education facilities as defined by the Integrated Post Secondary Education System (IPEDS), National Center for Education Statistics, and US Department of Education. This includes  Doctoral/Research Universities, Masters Colleges and Universities, Baccalaureate Colleges, Associates Colleges, Theological seminaries, Medical Schools and other health care professions, Schools of engineering and technology, business and management, art, music, design, Law schools, Teachers colleges, Tribal colleges, and other specialized institutions.")
    }
    })
  
  
  output$selected_var <- renderText({ 
    {y()}
  })
  }

shinyApp(ui, server)

library(rsconnect)
deployApp()
