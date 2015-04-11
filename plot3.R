#Set WD
setwd("~/Data")

#Read data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", check.name=FALSE, comment.char="", quote='\"')

#Only keep two days in question
epc2 <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

#Delete initial data
rm(epc)

#Open graphics device
png("plot3.png", height=480, width=480)

#convert data/time
d_t <- paste(epc2$Date, epc2$Time)
date_time <- strptime(d_t, "%e/%m/%Y %X")
rm(d_t)

#line diagram
plot(date_time, epc2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, epc2$Sub_metering_2, col="red")
lines(date_time, epc2$Sub_metering_2, col="blue")

#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, col=c("black","red","blue"))

#close graphics device
dev.off()
