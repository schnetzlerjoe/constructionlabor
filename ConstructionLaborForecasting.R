library(readxl)
library(xlsx)
library(plotly)
library(tidyr)

gross_job_gains <- as.data.frame(read_excel("ConstructionJobData.xlsx", 
                                  sheet = "Gross Gains", range = "A15:E44"))

gross_job_losses <- as.data.frame(read_excel("ConstructionJobData.xlsx", 
                              sheet = "Gross Loss", range = "A15:E44"))

rownames(gross_job_gains) <- gross_job_gains[,1]
rownames(gross_job_losses) <- gross_job_losses[,1]

colnames(gross_job_gains) <- gross_job_gains[1,]
colnames(gross_job_losses) <- gross_job_losses[1,]

gross_job_gains <- gross_job_gains[-1,-1]
gross_job_losses <- gross_job_losses[-1,-1]

gross_job_gains <- data.frame(sapply(gross_job_gains, as.numeric), row.names = rownames(gross_job_gains))
gross_job_losses <- data.frame(sapply(gross_job_losses, as.numeric), row.names = rownames(gross_job_losses))

total_net_gains <- data.frame(gross_job_gains - gross_job_losses)

plot_ly(x = rownames(total_net_gains), y = total_net_gains$Qtr2, type = 'scatter', mode = 'lines', name = "All Industries") %>%  
  layout(title = "Total Net Job Gains",
         xaxis = list(title = "Year"),
         yaxis = list (title = "Net Job Gains"))

