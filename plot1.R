#Set working directory#
getwd()
if(!file.exists("./data")){dir.create("./data")}
setwd("./data")
#
#Download and unzip data#
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
downloadFile <- "./household_power_consumption.zip"
unzipFile<-"./household_power_consumption.txt"
download.file(fileUrl, downloadFile)
unzip(downloadFile, overwrite = T)
#
#Read raw file into table and create correctly formatted time#
plotData <- read.table(text = grep("^[1,2]/2/2007", readLines(unzipFile), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE, na.strings="?")
formatTime <-strptime(paste(plotData$Date, plotData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
#

#plot1#
png(filename = "plot1.png")
par(mfrow=c(1,1))
hist(plotData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
#