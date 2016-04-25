# Read in the data file into a table
dataFile <- ".\\data\\household_power_consumption.txt" 
dataTable <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get the subset of data that we care about
dataSubset <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,] 

# Convert the Date and Time columns to a single date/time value
dataDT <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  


# Convert Global_active_power in the table from chr to numeric
gapNum <- as.numeric(dataSubset$Global_active_power) 

# Convert Sub_metering_1, _2, and _3 in the table from chr to numeric
sm1 <- as.numeric(dataSubset$Sub_metering_1)
sm2 <- as.numeric(dataSubset$Sub_metering_2)
sm3 <- as.numeric(dataSubset$Sub_metering_3)

# Set output device to a png file
png("plot3.png", width=480, height=480)

# Plot with the first Sub_metering_1 line
plot(dataDT, sm1, type="l", ylab="Energy Submetering", xlab="")

# Add Sub_metering_2 and _3 lines
lines(dataDT, sm2, type="l", col="red")
lines(dataDT, sm3, type="l", col="blue")

# Annotate by adding the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# Close the png file
dev.off()
