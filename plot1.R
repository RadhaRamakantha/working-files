
Househ_p_c <- read.csv("C:/Users/Radha/Desktop/household/household_power_consumption.txt", sep = ";")

#To Selecting the dates as per the assignment 
names(Househ_p_c)
dat <- subset(Househ_p_c,Househ_p_c$Date == "1/2/2007" | Househ_p_c$Date == "2/2/2007")

View(dat)

dat$Date<-as.Date(as.character(dat$Date),"%d/%m/%Y")
dat$Global_active_power<-as.numeric(as.character(dat$Global_active_power))
png("plot1.png",width = 480,height = 480,units = "px")
hist(dat$Global_active_power,col = 'red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
dev.off()
