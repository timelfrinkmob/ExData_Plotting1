setwd("~/Documents/coursera/exploratory-data-analysis/Project 1/ExData_Plotting1/")

library(dplyr)

# Create dir, download files and unzip
if(!file.exists("./data")){dir.create("./data")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("data/data.zip")) { download.file(url, "data/data.zip", method = "curl") 
  unzip("data/data.zip", exdir = "data/") 
}

# Read data
data <- read.table("data/household_power_consumption.txt",sep = ";",header = TRUE , na.strings="?")

data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$newTime <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

jpeg('plot4.png', width = 480, height = 480)
par(mfrow=c(2,2))

plot(data$newTime,data$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="")

plot(data$newTime,data$Voltage,type = "l")

plot(data$newTime,data$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab="")
lines(data$newTime, data$Sub_metering_2, col="red")
lines(data$newTime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty="solid", bty = "n")

plot(data$newTime,data$Global_reactive_power,type = "l")
dev.off()