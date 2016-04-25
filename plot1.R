# Read in the data file into a table
dataFile <- ".\\data\\household_power_consumption.txt" 
dataTable <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get the subset of data that we care about
dataSubset <- dataTable[dataTable$Date %in% c("1/2/2007","2/2/2007") ,] 

# Convert Global_active_power in the table from chr to numeric
gapNum <- as.numeric(dataSubset$Global_active_power)

# Set output device to a png file
png("plot1.png", height=480, width=480)

# Create the histogram
hist(gapNum, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Close the png file
dev.off() 
