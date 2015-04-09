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
plot(myData$DateTime, myData$Sub_metering_1, xlab = "",
     ylab = "Energy sub metering", type = "l")
lines(myData$DateTime, myData$Sub_metering_2, col = "red")
lines(myData$DateTime, myData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), cex = 0.95, lty=1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bg = par("bg"))

# Copy the graph to the PNG graphics device
dev.copy(png, width = 480, height = 480, units = "px", file = "plot3.png")
dev.off()
