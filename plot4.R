Househ_p_c <- read.csv("C:/Users/Radha/Desktop/household/household_power_consumption.txt", sep = ";")

#To Selecting the dates as per the assignment 
names(Househ_p_c)
dat <- subset(Househ_p_c,Househ_p_c$Date == "1/2/2007" | Househ_p_c$Date == "2/2/2007")

# converting data
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
#adding day of the week
dat$day <- weekdays(dat$Date)


#genereting histogram
dat <- transform(dat, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))

par(mar = c(4,4,2,2))

#PLOT 1
names(dat)

plot(dat$timestamp,dat[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot 2

plot(dat$timestamp,dat[,5], type="l",  xlab="datetime", ylab="Voltage")

#plot 3
plot(dat$timestamp,dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$timestamp,dat$Sub_metering_2,col="red")
lines(dat$timestamp,dat$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), bty="n", cex=.5)

#bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly


#plot4
plot(dat$timestamp,dat[,4], type="l", xlab="datetime", ylab="Global_reactive_power")

png("plot4.png")

par(mfrow=c(2,2))

par(mar = c(4,4,2,2))

#PLOT 1

plot(dat$timestamp,dat[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#plot 2

plot(dat$timestamp,dat[,5], type="l",  xlab="datetime", ylab="Voltage")

#plot 3
plot(dat$timestamp,dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dat$timestamp,dat$Sub_metering_2,col="red")
lines(dat$timestamp,dat$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), bty="n", cex=.5)

#plot4
plot(dat$timestamp,dat[,4], type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()

