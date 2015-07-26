###########################################################################                                       #
# Filename:     plot1.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     Have total emissions from PM2.5 decreased in the United 
#               States from 1999 to 2008? Using the base plotting system, 
#               make a plot showing the total PM2.5 emission from all 
#               sources for each of the years 1999, 2002, 2005, and 2008.
###########################################################################

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extract the total emissions per each of the years
total_emissions_by_year <- aggregate(Emissions ~ year, data=NEI, FUN=sum)

# Set the png device
png("plot1.png")

# Build the bar plot
barplot(height=total_emissions_by_year$Emissions, 
        names.arg=total_emissions_by_year$year,
        main="Total PM2.5 Emission in the U.S., 1999-2008", 
        xlab="Year",
        ylab="Total PM2.5 Emission ")

dev.off()