library(data.table)
data <- fread("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[grep(("2007-02-01|2007-02-02"), data$Date)]
data3 <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 


png("plot2.png", width=480, height=480)
plot(data3, data2$Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
