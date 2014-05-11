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

# Set the png file format parameters
png(filename = "plot4.png", width = 480, height = 480)

# Set par for multiple graphs, 2 rows / 2 columns by row
par(mfrow = c(2, 2))

# Plot graph 1
plot(myData$DateTime, myData$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

# Plot graph 2
plot(myData$DateTime, myData$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

# Plot graph 3
plot(myData$DateTime, myData$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(myData$DateTime, myData$Sub_metering_2, col = "red")
lines(myData$DateTime, myData$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), cex = 0.95, lty=1, bty = "o", box.col = par("bg"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot graph 4
plot(myData$DateTime, myData$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

# Close Devices
dev.off()