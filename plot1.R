library(data.table)
data <- fread("household_power_consumption.txt", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")

data2 <- data[grep(("2007-02-01|2007-02-02"), data$Date)]
png("plot1.png", width=480, height=480)
hist(data2$Global_active_power, col = "orangered", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
