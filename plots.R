filePath="tmp/household_power_consumption_2007-02.txt"
hpc <- read.table(filePath, header=TRUE, sep=';', stringsAsFactors = FALSE)
hpc$DateTime <- as.POSIXct (strptime (paste (d, t), "%d/%m/%Y %H:%M:%S"))
hpc$Date <- NULL
hpc$Time <- NULL
setcolorder(hpc, c(8, 1:7))
hist(hpc$Global_active_power, col="red", xlab="Global active Power (kilowatts)", main ="Global Active Power")

plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Global active Power (kilowatts)")
lines(hpc$DateTime, hpc$Global_active_power, type="l")

ymax <- max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)
plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Energy sub metering", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Sub_metering_1, type="l")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", col= c("black", "red", "blue"), pch="_", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(mfrow= c(2,2))

plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Global active Power (kilowatts)")
lines(hpc$DateTime, hpc$Global_active_power, type="l")

plot (hpc$DateTime, hpc$Voltage, type="n", main="", ylab="Voltage", xlab="datetime")
lines(hpc$DateTime, hpc$Voltage, type="l")

ymax <- max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)
plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Energy sub metering", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Sub_metering_1, type="l")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", col= c("black", "red", "blue"), bty="n", pch="_", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)

ymax <- max (hpc$Global_reactive_power)
plot (hpc$DateTime, hpc$Global_reactive_power, type="n", main="", ylab="Global_reactive_power", xlab="datetime", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Global_reactive_power, type="l")







