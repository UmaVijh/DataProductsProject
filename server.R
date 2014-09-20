# server.R

library(shiny)
library("datasets")
library("choroplethr")

data(USArrests)
USArrests <- data.frame(row.names(USArrests),USArrests)
df <- USArrests[,c(1,2)]
names(df)= c("region","value")
lod = "state"

shinyServer(
        function(input, output) {
                output$map <- renderPlot({
                        args <- switch(input$var,
                                       "Arrests for Murder" = list(2, "Murder"),
                                       "Arrests for Assault" = list(3, "Assault"),
                                       "Arrests for Rape" = list(5, "Rape"))
                        df = USArrests[,c(1,args[[1]])]
                        names(df) =c("region","value")
                        scaleName = args[[2]]
                        lod = "state"
                        num_buckets = 9
                        choroplethr(df,lod,scaleName,num_buckets = 9)
                })
        }
)