#
# Plot 3
# 
filePath="tmp/household_power_consumption.txt"
# read a sub set of data 
hpc <- read.csv2.sql(filePath, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", header = TRUE, stringsAsFactors=FALSE)
# create a DateTime column from Date and Time original columns
hpc$DateTime <- as.POSIXct (strptime (paste (hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"))

png("plot3.png")

# find the max value for y
ymax <- max(hpc$Sub_metering_1, hpc$Sub_metering_2, hpc$Sub_metering_3)

plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Energy sub metering", ylim=c(0, ymax))
lines(hpc$DateTime, hpc$Sub_metering_1, type="l")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")

# add a legend
legend("topright", col= c("black", "red", "blue"), lwd=1, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()