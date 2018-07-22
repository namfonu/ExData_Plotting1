data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
selectedData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetimeData <- strptime(paste(selectedData$Date, selectedData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(selectedData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetimeData, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

