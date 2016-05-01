read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE,
 colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
 na.strings = "?")

data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %T")

sbdata <- subset(data, DateTime >= strptime("2007-02-01", format = "%F") 
 & DateTime < strptime("2007-02-03", format = "%F"))

png("plot2.png")

plot(sbdata$DateTime, sbdata$Global_active_power, type = "l",
 xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()