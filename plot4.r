setwd("~/R/ExploratoryDataAnalysis/Week1")

### Loading and subsetting the data
#load file into data variable
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset to correct data period
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Add proper data/time formats 
data$datetime = paste(data$Date, data$Time)
data$datetime = strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

### Make plots
# Open PNG file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# Make plot 1
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Make plot 2
with(data, plot(datetime, Voltage, type = "l"))

# Make plot 3
plot(data$datetime, data$Sub_metering_1, type = "l",  xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Submetering_1", "Submetering_2", "Submetering_3"), lwd = 1, bty = "n")

# Make plot 4
with(data, plot(datetime, Global_reactive_power, type = "l"))

#Close plot
dev.off()





