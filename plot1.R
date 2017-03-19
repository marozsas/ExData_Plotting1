#
# Plot1
# 
filePath="tmp/household_power_consumption.txt"
# read a sub set of data 
hpc <- read.csv2.sql(filePath, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", header = TRUE, stringsAsFactors=FALSE)

png("plot1.png")
hist(hpc$Global_active_power, col="red", xlab="Global active Power (kilowatts)", main ="Global Active Power")
dev.off()