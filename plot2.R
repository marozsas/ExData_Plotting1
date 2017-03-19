#
# Plot 2
# 
filePath="tmp/household_power_consumption.txt"
# read a sub set of data 
hpc <- read.csv2.sql(filePath, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", header = TRUE, stringsAsFactors=FALSE)
# create a DateTime column from Date and Time original columns
hpc$DateTime <- as.POSIXct (strptime (paste (hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S"))

png("plot2.png")

plot (hpc$DateTime, hpc$Global_active_power, type="n", main="", xlab="", ylab="Global active Power (kilowatts)")
lines(hpc$DateTime, hpc$Global_active_power, type="l")
dev.off()