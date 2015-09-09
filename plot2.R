
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?')

dateFormat <- "%d/%m/%Y"
hpc$Date <- strptime(hpc$Date, dateFormat)
dateRange <- c(strptime("01/02/2007",dateFormat),strptime("02/02/2007",dateFormat))
hpc = hpc[hpc$Date %in% dateRange ,]

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)


plot(hpc$DateTime, hpc$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,file = "plot2.png", width=480, height=480)
dev.off()
