
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings='?')

dateFormat <- "%d/%m/%Y"
hpc$Date <- strptime(hpc$Date, dateFormat)
dateRange <- c(strptime("01/02/2007",dateFormat),strptime("02/02/2007",dateFormat))
hpc = hpc[hpc$Date %in% dateRange ,]

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%Y-%m-%d %H:%M:%S")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

par(mar =c(3,5,1,1))
plot(hpc$DateTime, hpc$Sub_metering_1 , col="black", type = "l", xlab="", ylab="Global Active Power (kilowatts)")
lines(hpc$DateTime, hpc$Sub_metering_2, col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1) , col=c("black", "red", "blue")  )


dev.copy(png,file = "plot3.png", width=480, height=480)
dev.off()

