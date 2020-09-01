name="household_power_consumption.txt"
data <- read.csv2(name)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
m <- subset(data, Date >= date1 & Date <= date2)
m[,3] <- as.numeric(m[,3])
m[,4] <- as.numeric(m[,4])
m[,5] <- as.numeric(m[,5])
m[,7] <- as.numeric(m[,7])
m[,8] <- as.numeric(m[,8])
m[,9] <- as.numeric(m[,9])
p <- paste(m[,1],m[,2])
t <- strptime(p, "%Y-%m-%d %H:%M:%S") #convert the date and time in the POSIXlt type
dev.set(3)
png(filename= "myplot4.png")
par(mfcol=c(2,2))
# GRAPH 1
plot(t, type = "n",m$Global_active_power, ylab= "Global Active Power", xlab="")
lines(t, m$Global_active_power)
# GRAPH 2
plot(t,type= "n", m$Sub_metering_1, ylab= "Energy sub metering", xlab="")
lines(t, m$Sub_metering_1)
lines(t, m$Sub_metering_2, col="red")
lines(t, m$Sub_metering_3, col="blue")
legend("topright", legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n", col= c("black", "red", "blue"), lty=c(1,1,1))
#GRAPH 3
plot(t, type = "n",m$Voltage, ylab= "Voltage", xlab="datetime")
lines(t, m$Voltage)
#GRAPH 4
plot(t, type = "n",m$Global_reactive_power, ylab= "Global_reactive_power", xlab="datetime")
lines(t, m$Global_reactive_power)
dev.off()