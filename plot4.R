# Read in the data file into a table
dataFile <- ".\\data\\household_power_consumption.txt" 
dataTable <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get the subset of data that we care about
dataSubset <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,] 

# Convert the Date and Time columns to a single date/time value
dataDT <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  


# Convert Global_active_power in the table from chr to numeric
gapNum <- as.numeric(dataSubset$Global_active_power) 

# Convert Global_reactive_power in the table from chr to numeric
grpNum <- as.numeric(dataSubset$Global_reactive_power)

# Convert Voltage in the table from chr to numeric
voltage <- as.numeric(dataSubset$Voltage)

# Convert Sub_metering_1, _2, and _3 in the table from chr to numeric
sm1 <- as.numeric(dataSubset$Sub_metering_1)
sm2 <- as.numeric(dataSubset$Sub_metering_2)
sm3 <- as.numeric(dataSubset$Sub_metering_3)

# Set output device to a png file
png("plot4.png", width=480, height=480)

# Set the graphical parameters to a 2x2 array
par(mfrow = c(2, 2))

# Plot graph #1
plot(dataDT, gapNum, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot graph #2
plot(dataDT, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot graph #3
plot(dataDT, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dataDT, sm2, type="l", col="red")
lines(dataDT, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot graph #4
plot(dataDT, grpNum, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the png file
dev.off()

