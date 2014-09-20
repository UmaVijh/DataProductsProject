# ui.R
library(shiny)

shinyUI(fluidPage(
        titlePanel("Violent Crime Arrest Rates by US State (data from 1973)"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Create Demographic Maps With 
                                 Information From the US Arrest data per 100,000 Residents."),
                        
                        selectInput("var", 
                                    label = "Choose a variable to display",
                                    choices = c("Arrests for Murder", "Arrests for Assault",
                                                "Arrests for Rape"),
                                    selected = "Arrests for Murder")
                        ),
                
                mainPanel(plotOutput("map"))
        )
))