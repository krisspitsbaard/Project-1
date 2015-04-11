#Set WD
setwd("~/Data")

#Read data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", check.name=FALSE, comment.char="", quote='\"')

#Only keep two days in question
epc2 <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007")

#Delete initial data
rm(epc)

#convert data/time
d_t <- paste(epc2$Date, epc2$Time)
date_time <- strptime(d_t, "%e/%m/%Y %X")
rm(d_t)

#line diagram
plot(date_time, epc2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#copy to PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()