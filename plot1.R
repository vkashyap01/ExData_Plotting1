##########################################################################################################

## Coursera Exploratory Data Analysis Project # 1
## Vaibhav Kashyap
## 2015-09-10

# File Name: plot1.R

##########################################################################################################


##Set working directory
setwd("~/DQI Training Plan and Evaluation/MOOC - Data Science Coursera/04_Exploratory Data Analysis/Project 1")

##Specify source file name
sourceDataFile <- "household_power_consumption.txt"

##Read in the source file into sourceData table
sourceData <- read.table(sourceDataFile, header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE, dec=".")

##Set date format
sourceData$Date <- as.Date(sourceData$Date, format="%d/%m/%Y")

##Subset the data based on date range
subsetData <- subset(sourceData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Convert the Date and Time variables to Date/Time classes
datetime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(subsetData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to plot1.png file with a width of 480 pixels and a height of 480 pixels 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()