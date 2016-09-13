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

datetime <- strptime(paste(subSetDat$Date, subSetDat$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
glblActPower <- as.numeric(subSetDat$Global_active_power)
subMetering1 <- as.numeric(subSetDat$Sub_metering_1)
subMetering2 <- as.numeric(subSetDat$Sub_metering_2)
subMetering3 <- as.numeric(subSetDat$Sub_metering_3)


plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()