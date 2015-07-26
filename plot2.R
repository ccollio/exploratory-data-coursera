###########################################################################                                       #
# Filename:     plot2.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     Have total emissions from PM2.5 decreased in the Baltimore 
#               City, Maryland (fips == "24510") from 1999 to 2008? Use the 
#               base plotting system to make a plot answering this question.
###########################################################################

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Baltimore emissions
baltimore_emissions <- NEI[NEI$fips == 24510,]

# Extract the total emissions per each of the years
balt_emissions_by_year <- aggregate(Emissions ~ year, data=baltimore_emissions, FUN=sum)

# Set the png device
png("plot2.png")

# Build the bar plot for Baltimore City
barplot(height=balt_emissions_by_year$Emissions, 
        names.arg=balt_emissions_by_year$year,
        main="Total PM2.5 Emissions in Baltimore, MD, 1999-2008", 
        xlab="Year",
        ylab="Total PM2.5 Emission ")

dev.off()