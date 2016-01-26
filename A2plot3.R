#Loading Data
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Generating totals for Emissions Year wise
subset_NEI<-subset(NEI,fips=="24510")

#Plotting a graph and holding it in gplot
gplot<-qplot(year,Emissions,data=subset_NEI,facets=type~.,geom="smooth",method="lm")

#Geenrating a PNG output
png(file = paste("A2plot3.png", sep=""), width = 480, height = 480)
print(gplot)

#terminating Device
dev.off()