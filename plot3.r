setwd("~/R/ExploratoryDataAnalysis/Week1")

### Loading and subsetting the data
#load file into data variable
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Subset to correct data period
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#Add proper data/time formats 
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

### Make plot
png(filename = "plot3.png", width = 480, height = 480)
plot(data$DateTime, data$Sub_metering_1, type = "l",  xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Submetering_1", "Submetering_2", "Submetering_3"), lwd = 1)
dev.off()


