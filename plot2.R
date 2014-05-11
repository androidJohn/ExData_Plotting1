# Install necessary package
require("sqldf")
require("tcltk")

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
plot(myData$DateTime, myData$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")










