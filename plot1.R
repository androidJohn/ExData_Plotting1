# Install necessary package
require("sqldf")

# Create the SQL query
mySql <- "select * from file where Date IN ('1/2/2007', '2/2/2007')"

# Create variable with file name
myFile <- ("household_power_consumption.txt")

# Read the file into R table
myData <- read.csv2.sql(myFile, mySql)

# Convert Time and Date columns from character to Time and Date
myData <- within(myData, DateTime <- paste(Date, Time, sep = ' '))
myData$DateTime <- strptime(myData$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Plot the graph
hist(myData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")










