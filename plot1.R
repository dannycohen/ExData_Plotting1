## Clear environment
## rm(list = ls())


hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?')

dateFormat <- "%d/%m/%Y"
hpc$Date <- strptime(hpc$Date, dateFormat)
dateRange <- c(strptime("01/02/2007",dateFormat),strptime("02/02/2007",dateFormat))
hpc = hpc[hpc$Date %in% dateRange ,]


hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )

dev.copy(png,file = "plot1.png", width=480, height=480)
dev.off()
