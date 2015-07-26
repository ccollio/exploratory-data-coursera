###########################################################################                                       #
# Filename:     plot4.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     Across the United States, how have emissions from coal 
#               combustion-related sources changed from 1999–2008?
###########################################################################

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get coal-related SCC codes based on Short.Name
SCC_coal <- SCC[grep("Coal", SCC$Short.Name),]

# Subset the NEI data for only coal-related emissions
NEI_coal <- NEI[NEI$SCC %in% SCC_coal$SCC,]

# Extract the total emissions per each of the years
total_emissions_by_year <- aggregate(Emissions ~ year, data=NEI_coal, FUN=sum)

# Set the png device
png("plot4.png", width=640, height=480)

# Build the bar plot
# Make sure to set the ylim so that the y-axis is long enough to display all values
barplot(height=total_emissions_by_year$Emissions, 
        names.arg=total_emissions_by_year$year,
        main="Total PM2.5 Emission from Coal Combustion in the U.S., 1999-2008", 
        xlab="Year",
        ylab="Total PM2.5 Emission from Coal Combustion",
        ylim=c(0,1.1*max(unlist(total_emissions_by_year$Emissions))))

dev.off()