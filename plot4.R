#
# Plot 4
# 

filePath="tmp/household_power_consumption.txt"
# read a sub set of data 
hpc <- read.csv2.sql(filePath, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", header = TRUE, stringsAsFactors=FALSE)
# create a DateTime column from Date and Time original columns
hpc$DateTime <- as.POSIXct (strptime (paste (hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"))

png("plot4.png")

# set 2 rows by 2 columns
par(mfrow= c(2,2))

# top left
plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Global active Power (kilowatts)")
lines(hpc$DateTime, hpc$Global_active_power, type="l")
# top right
plot (hpc$DateTime, hpc$Voltage, type="n", main="", ylab="Voltage", xlab="datetime")
lines(hpc$DateTime, hpc$Voltage, type="l")
# bottom left
ymax <- max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)
plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Energy sub metering", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Sub_metering_1, type="l")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", col= c("black", "red", "blue"), bty="n", lwd=1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# bottom right
ymax <- max (hpc$Global_reactive_power)
plot (hpc$DateTime, hpc$Global_reactive_power, type="n", main="", ylab="Global_reactive_power", xlab="datetime", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Global_reactive_power, type="l")

dev.off()