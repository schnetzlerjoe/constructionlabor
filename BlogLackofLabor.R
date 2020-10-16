library(plotly)

##Get Data##
All_Employees <- read_excel("LaborWageGrowth/SeriesReport-20200323151743_9836e2.xlsx", range = "A13:M28")
Goods_producing <- read_excel("LaborWageGrowth/SeriesReport-20200323151747_7a8318.xlsx", range = "A13:M28")
Mining_and_logging <- read_excel("LaborWageGrowth/SeriesReport-20200323151750_b3b4f9.xlsx", range = "A13:M28")
Construction <- read_excel("LaborWageGrowth/SeriesReport-20200323151753_83226d.xlsx", range = "A13:M28")
Manufacturing <- read_excel("LaborWageGrowth/SeriesReport-20200323151756_681ddb.xlsx", range = "A13:M28")
Durable_Goods <- read_excel("LaborWageGrowth/SeriesReport-20200323151758_f85f65.xlsx", range = "A13:M28")
Nondurable_Goods <- read_excel("LaborWageGrowth/SeriesReport-20200323151801_cbf51d.xlsx", range = "A13:M28")
Private_service_providing <- read_excel("LaborWageGrowth/SeriesReport-20200323151804_fd58f8.xlsx", range = "A13:M28")
Trade_transportation_and_utilities <- read_excel("LaborWageGrowth/SeriesReport-20200323151806_0dcb9f.xlsx", range = "A13:M28")
Wholesale_trade <- read_excel("LaborWageGrowth/SeriesReport-20200323151809_188afd.xlsx", range = "A13:M28")
Retail_trade <- read_excel("LaborWageGrowth/SeriesReport-20200323151811_326fad.xlsx", range = "A13:M28")
Transportation_and_warehousing <- read_excel("LaborWageGrowth/SeriesReport-20200323151814_6e0fb1.xlsx", range = "A13:M28")
Utilities <- read_excel("LaborWageGrowth/SeriesReport-20200323151816_a00be8.xlsx", range = "A13:M28")
Information <- read_excel("LaborWageGrowth/SeriesReport-20200323151821_ea3787.xlsx", range = "A13:M28")
Financial_activities <- read_excel("LaborWageGrowth/SeriesReport-20200323151823_92b797.xlsx", range = "A13:M28")
Professional_and_business_services <- read_excel("LaborWageGrowth/SeriesReport-20200323151825_0b0a90.xlsx", range = "A13:M28")
Education_and_health_services <- read_excel("LaborWageGrowth/SeriesReport-20200323151829_485db2.xlsx", range = "A13:M28")
Leisure_and_hospitality <- read_excel("LaborWageGrowth/SeriesReport-20200323151831_c9ad63.xlsx", range = "A13:M28")
Other_services <- read_excel("LaborWageGrowth/SeriesReport-20200323151836_435699.xlsx", range = "A13:M28")

##Chart##
All_Employees$Mean <- rowMeans(All_Employees[,2:13])
Goods_producing$Mean <- rowMeans(Goods_producing[,2:13])
Mining_and_logging$Mean <- rowMeans(Mining_and_logging[,2:13])
Construction$Mean <- rowMeans(Construction[,2:13])
Manufacturing$Mean <- rowMeans(Manufacturing[,2:13])
Durable_Goods$Mean <- rowMeans(Durable_Goods[,2:13])
Nondurable_Goods$Mean <- rowMeans(Nondurable_Goods[,2:13])
Private_service_providing$Mean <- rowMeans(Private_service_providing[,2:13])
Trade_transportation_and_utilities$Mean <- rowMeans(Trade_transportation_and_utilities[,2:13])
Wholesale_trade$Mean <- rowMeans(Wholesale_trade[,2:13])
Retail_trade$Mean <- rowMeans(Retail_trade[,2:13])
Transportation_and_warehousing$Mean <- rowMeans(Transportation_and_warehousing[,2:13])
Utilities$Mean <- rowMeans(Utilities[,2:13])
Information$Mean <- rowMeans(Information[,2:13])
Financial_activities$Mean <- rowMeans(Financial_activities[,2:13])
Professional_and_business_services$Mean <- rowMeans(Professional_and_business_services[,2:13])
Education_and_health_services$Mean <- rowMeans(Education_and_health_services[,2:13])
Leisure_and_hospitality$Mean <- rowMeans(Leisure_and_hospitality[,2:13])
Other_services$Mean <- rowMeans(Other_services[,2:13])
all <- data.frame(cbind(All_Employees[,14], Goods_producing[,14],Mining_and_logging[,14], Construction[,14], Manufacturing[,14], 
      Durable_Goods[,14], Nondurable_Goods[,14], Private_service_providing[,14], Trade_transportation_and_utilities[,14], 
      Wholesale_trade[,14], Retail_trade[,14], Transportation_and_warehousing[,14], Utilities[,14], Information[,14], 
      Financial_activities[,14], Professional_and_business_services[,14], Education_and_health_services[,14], Leisure_and_hospitality[,14], Other_services[,14]), row.names = 2006:2020)
colnames(all) <- c("All_Employees", "Goods_producing","Mining_and_logging", "Construction", "Manufacturing", 
                   "Durable_Goods", "Nondurable_Goods", "Private_service_providing", "Trade_transportation_and_utilities", 
                   "Wholesale_trade", "Retail_trade", "Transportation_and_warehousing", "Utilities", "Information", 
                   "Financial_activities", "Professional_and_business_services", "Education_and_health_services", "Leisure_and_hospitality", "Other_services")
all <- na.exclude(all)

plot_ly(x = 2007:2019, y = all$All_Employees, type = 'scatter', mode = 'lines', name = "All Industries") %>%  
  add_trace(y = all$Construction, type = 'scatter', mode = 'lines', name = "Construction") %>% 
  layout(title = "Constrution Wage vs All Industries",
           xaxis = list(title = "Year"),
           yaxis = list (title = "Average Hourly Wage (Annual)"))

