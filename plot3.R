##########################################################################################################

## Coursera Exploratory Data Analysis Project # 1
## Vaibhav Kashyap
## 2015-09-10

# File Name: plot3.R

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

## Plot 3
with(subsetData, {
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, type="l", col='Red')
  lines(Sub_metering_3~Datetime, type="l", col='Blue')
})

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

## Save to plot3.png file with a width of 480 pixels and a height of 480 pixels 
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()