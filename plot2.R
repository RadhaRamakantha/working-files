
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

plot(dat$timestamp,dat[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")

#seving as png
png("plot2.png")
plot(dat$timestamp,dat[,3], type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()



