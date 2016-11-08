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

jpeg('plot1.png', width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
