name="household_power_consumption.txt"
data <- read.csv2(name)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
m <- subset(data, Date >= date1 & Date <= date2)
m[,3] <- as.numeric(m[,3])
p <- paste(m[,1],m[,2])
t <- strptime(p, "%Y-%m-%d %H:%M:%S") #convert the date and time in the POSIXlt type
dev.set(3)
png(filename= "myplot2.png")
plot(t, type = "n",m$Global_active_power, ylab= "Global Active Power (kilowatts)", xlab="")
lines(t, m$Global_active_power)
dev.off()