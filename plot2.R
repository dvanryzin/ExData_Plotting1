# Read in the data file into a table
dataFile <- ".\\data\\household_power_consumption.txt" 
dataTable <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get the subset of data that we care about
dataSubset <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,] 

# Convert the Date and Time columns to a single date/time value
dataDT <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")  

# Convert Global_active_power in the table from chr to numeric
gapNum <- as.numeric(dataSubset$Global_active_power) 
 
# Set output device to a png file
png("plot2.png", width=480, height=480) 

# Plot date/time vs. Global active power
plot(dataDT, gapNum, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# Close the png file
dev.off() 
