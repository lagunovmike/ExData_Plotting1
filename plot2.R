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
png(filename = "Plot2.png")
with(powcon,
     plot(Time, Global_active_power,
          type = "l", ylab = "Global Active Power (kilowatts)"),)
dev.off()