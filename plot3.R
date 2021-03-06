library(data.table)
data <- fread("household_power_consumption.txt", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[grep(("2007-02-01|2007-02-02"), data$Date)]
data3 <- strptime(paste(data2$Date, data2$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(data3, data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data3, data2$Sub_metering_2, type = "l", col = "red")
points(data3, data2$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd=2.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
