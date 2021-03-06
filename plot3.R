# Getting the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileDest <- "household_pow_consumption.zip"
download.file(fileUrl, fileDest)
unzip(fileDest)
powcon_all <- read.table("household_power_consumption.txt", sep = ";", 
                         na.strings = "?", header = T)

# Filtering the date
powcon <- subset(powcon_all, Date %in% c("1/2/2007","2/2/2007"))
powcon$Date <- as.Date(powcon$Date, format = "%d/%m/%Y")
powcon$Time <- as.POSIXct(paste(powcon$Date, powcon$Time))

# making the plot
png(filename = "Plot3.png")
plot(powcon$Time, powcon$Sub_metering_1, type = "l", col = "purple", 
     xlab = "", ylab = "Energy sub metering")
lines(powcon$Time, powcon$Sub_metering_2, col = "Red")
lines(powcon$Time, powcon$Sub_metering_3, col = "blue")
legend("topright", col = c("purple", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()