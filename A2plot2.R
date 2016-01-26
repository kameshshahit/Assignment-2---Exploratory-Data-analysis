#Loading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Generating totals for Emissions Year wise
subset_NEI<-subset(NEI,fips=="24510")
totalPMforyear <- tapply(subset_NEI$Emissions,subset_NEI$year,sum)



#Creating output on PNG Device
png("A2plot2.png", width=480, height=480)

#Plotting graph
plot(totalPMforyear , x = rownames(totalPMforyear ),type="l",xlab="Year",ylab="Emissions in Tons",main="Year wise Total Emissions in Baltimore")
dev.off()

