#Loading Data
library(data.table)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Pulling Motor Vehicle-related sources from SCC
SCC_Table<-data.table(SCC)
subset_SCC <-subset(SCC,EI.Sector  %like% "Vehicle")

#Pulling Data only for the SCC "Motor Vehicle Sources" and "Baltimore and LA" from NEI Source
subset_NEI<-subset(NEI,NEI$SCC %in% subset_SCC$SCC & (fips=="24510" | fips=="06037"))

#added new column name countyname
subset_NEI$countyname<- ifelse(subset_NEI$fips == "06037","Los Angeles","Baltimore")

#Generating a qplot graph with all parameters
gplot<-qplot(year,Emissions,data=subset_NEI,facets=countyname~.,color=countyname,geom="smooth",method="lm")+ggtitle("Emissions:1999-2008:Baltimore vs L.A")

#Generating a PNG output
png(file = paste("A2plot6.png", sep=""), width = 480, height = 480)
print(gplot)

#terminating Device
dev.off()
