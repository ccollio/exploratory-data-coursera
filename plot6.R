###########################################################################                                       #
# Filename:     plot6.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     Compare emissions from motor vehicle sources in Baltimore 
#               City with emissions from motor vehicle sources in Los Angeles 
#               County, California (fips == "06037"). Which city has seen 
#               greater changes over time in motor vehicle emissions?
###########################################################################

library(ggplot2)

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Baltimore and LA emissions for motor vehicles
baltimore_and_la_emissions <- NEI[(NEI$fips == "24510" | NEI$fips == "06037") 
                                  & NEI$type == "ON-ROAD",]

# Create a dataframe for the emissions of each year 
emissions_by_year_fips <- aggregate(Emissions ~ year + fips, 
                                          data=baltimore_and_la_emissions, 
                                          FUN=sum)

# Replace the fips data with the actual city names for the graph titles
emissions_by_year_fips$fips[emissions_by_year_fips$fips == "24510"] <- "Baltimore"
emissions_by_year_fips$fips[emissions_by_year_fips$fips == "06037"] <- "Los Angeles"

# Set the png device, wide enough to compare graphs for two cities
png("plot6.png", width=1040, height=480)

# Build the plot
g <- ggplot(emissions_by_year_fips, aes(factor(year), Emissions))

g <- g + facet_grid(. ~ fips)

g <- g + geom_bar(stat="identity") + 
         labs(x = "Year",
              y = "Total PM2.5 Emissions from Motor Vehicles",
              title = "Total PM2.5 Emission from Motor Vehicles in Baltimore vs. LA, 1999-2008")

print(g)
dev.off()


