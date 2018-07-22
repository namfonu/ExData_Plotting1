

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selectedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetimeData <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)
globalReactivePower <- as.numeric(selectedData$Global_reactive_power)
voltage <- as.numeric(selectedData$Voltage)
subMetering1 <- as.numeric(selectedData$Sub_metering_1)
subMetering2 <- as.numeric(selectedData$Sub_metering_2)
subMetering3 <- as.numeric(selectedData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetimeData, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetimeData, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetimeData, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimeData, subMetering2, type="l", col="red")
lines(datetimeData, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetimeData, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()