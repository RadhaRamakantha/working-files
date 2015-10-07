Househ_p_c <- read.csv("C:/Users/Radha/Desktop/household/household_power_consumption.txt", sep = ";")

#To Selecting the dates as per the assignment 
names(Househ_p_c)
dat <- subset(Househ_p_c,Househ_p_c$Date == "1/2/2007" | Househ_p_c$Date == "2/2/2007")


# converting data
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")
#adding day of the week

dat$day <-weekdays(dat$Date)

head(dat$day)

#genereting histogram
dat <- transform(dat,timestamp=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")
head(dat)

plot(dat$timestamp,dat$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")

lines(dat$timestamp,dat$Sub_metering_2,col="red")
lines(dat$timestamp,dat$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col= c("black","red","blue"),lty=c(1,1)) 


png("plot3.png")
plot(dat$timestamp,dat$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering")

lines(dat$timestamp,dat$Sub_metering_2,col="red")
lines(dat$timestamp,dat$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),col= c("black","red","blue"),lty=c(1,1)) 
dev.off()
