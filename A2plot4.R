#Loading Data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Pulling coal combustion-related sources from SCC
subset_SCC <-subset(SCC,EI.Sector == "Fuel Comb - Comm/Institutional - Coal")

#Pulling Data only for the SCC "Fuel Comb - Comm/Institutional - Coal" from NEI Source
subset_NEI<-subset(NEI,NEI$SCC %in% subset_SCC$SCC)

#Calculating total Emissions year wise
NEI_Coal_yearwise<- tapply(subset_NEI$Emissions,subset_NEI$year,sum)

#Creating output on PNG Device
png("A2plot4.png", width=480, height=480)

#Plotting data to study results
plot(NEI_Coal_yearwise,x=rownames(NEI_Coal_yearwise),type="l",xlab="Year",ylab="Emissions",main="Coal combustion-related sources:1999–2008 in US")
dev.off()