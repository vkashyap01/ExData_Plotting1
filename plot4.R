##########################################################################################################

## Coursera Exploratory Data Analysis Project # 1
## Vaibhav Kashyap
## 2015-09-10

# File Name: plot4.R

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

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    
with(subsetData, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_Reactive_Power (kilowatts)", xlab="datetime")
})

## Save to plot4.png file with a width of 480 pixels and a height of 480 pixels 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()