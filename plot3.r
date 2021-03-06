data <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE,
 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
 na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

sbdata <- subset(data, DateTime >= strptime("2007-02-01", format = "%F") 
 & DateTime < strptime("2007-02-03", format = "%F"))

png("plot3.png")

with(sbdata, plot(DateTime, Sub_metering_1, type = "n", xlab = "", ylab = ""))

with(sbdata, points(DateTime, Sub_metering_1, col = "black", type = "l"))
with(sbdata, points(DateTime, Sub_metering_2, col = "red", type = "l"))
with(sbdata, points(DateTime, Sub_metering_3, col = "blue", type = "l"))

title(ylab = "Energy sub metering")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
 lwd = c(1, 1, 1), col = c("black", "red", "blue"))

dev.off()