###########################################################################                                       #
# Filename:     plot3.R                                                   
# Author:       Clifford Collio                                           
# Course:       Exploratory Data Analysis, Coursera                       
# Project:      Project 2, Analyzing PM2.5 Emissions Data
# Question:     Of the four types of sources indicated by the type (point, 
#               nonpoint, onroad, nonroad) variable, which of these four 
#               sources have seen decreases in emissions from 1999–2008 for 
#               Baltimore City? Which have seen increases in emissions from 
#               1999–2008? Use the ggplot2 plotting system to make a plot 
#               answer this question.
###########################################################################

library(ggplot2)

# Read in the data set
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get Baltimore emissions
baltimore_emissions <- NEI[NEI$fips == 24510,]

# Create a dataframe for the emissions of each year for each type
emissions_by_year_type <- aggregate(Emissions ~ year + type, 
                                    data=baltimore_emissions, 
                                    FUN=sum)

# Set the png device
png("plot3.png", width=640, height=480)

# Build the plot
g <- ggplot(emissions_by_year_type,
            aes(x = year,
                y = Emissions,
                color = type))

g <- g + geom_line() + labs(x = "Year",
                            y = "Total PM2.5 Emissions",
                            title = "Total PM2.5 Emissions in Baltimore City, MD, 1999-2008")

print(g)
dev.off()



