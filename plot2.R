#downloading the data in working folder if it doesn't exist
filename <- "household_power_consumption.zip"
## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}
datFile <- "./household_power_consumption.txt"
powdata <- read.table(datFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- powdata[powdata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(datFile)

#str(subSetData)
datetime <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
glblActPower <- as.numeric(subSetDat$Global_active_power)

plot(datetime, glblActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

#downloading the data in working folder if it doesn't exist
filename <- "household_power_consumption.zip"
## Download and unzip the dataset:
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("household_power_consumption.txt")) { 
  unzip(filename) 
}
datFile <- "./household_power_consumption.txt"
powdata <- read.table(datFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetDat <- powdata[powdata$Date %in% c("1/2/2007","2/2/2007") ,]
rm(datFile)
#str(subSetData)
datetime <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
glblActPower <- as.numeric(subSetDat$Global_active_power)

plot(datetime, glblActPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

