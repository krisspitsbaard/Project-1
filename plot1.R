#Set WD
setwd("~/Data")

#Read data
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

#Only keep two days in question
epc2 <- subset(epc, Date=="1/2/2007" | Date=="2/2/2007" | Date=="3/2/2007" & Time == "00:00:00")

#Delete initial data
rm(epc)

#Create histogram
hist(epc2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#copy to PNG
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
