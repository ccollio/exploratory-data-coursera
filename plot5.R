###########################################################################                                       #
# Filename:     plot5.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     How have emissions from motor vehicle sources changed from 
#               1999–2008 in Baltimore City?
###########################################################################

library(ggplot2)

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Baltimore emissions for motor vehicles
baltimore_emissions <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",]

# Create a dataframe for the emissions of each year 
emissions_by_year <- aggregate(Emissions ~ year, 
                               data=baltimore_emissions, 
                               FUN=sum)

# Set the png device
png("plot5.png", width=640, height=480)

# Build the plot
g <- ggplot(emissions_by_year_type, aes(factor(year), y = Emissions))
   
g <- g + geom_bar(stat="identity") + 
         labs(x = "Year",
              y = "Total PM2.5 Emissions from Motor Vehicles",
              title = "Total PM2.5 Emission from Motor Vehicles in Baltimore City, 1999-2008")

print(g)
dev.off()