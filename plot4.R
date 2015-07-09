setwd("D:\\Certificering\\Coursera Data Science Specialization (R)\\4. Coursera Exploratory Data Analysis\\5. Course Project 1")
rm(list = ls())

power<-read.csv("household_power_consumption.txt", head= TRUE, sep =";", na.strings = c("?"))

# some data exploration
str(power)
dim(power) 
summary(power)
head(power)
names(power)

#Combine the date and time fields
power$datetime <- strptime(paste(power$Date,power$Time), format="%d/%m/%Y %H:%M:%S")

#Select the right values in the power dataset
sub_power = subset(power,as.Date(power$datetime) >= "2007-02-01" & as.Date(power$datetime) < "2007-02-03")

# Get the the device ready
png(filename="plot4.png", height=480, width=480, bg="transparent")


#Create the diagram
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(sub_power, {
  plot(sub_power$datetime, sub_power$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(sub_power$datetime, sub_power$Global_active_power)
  plot(sub_power$datetime, sub_power$Voltage, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(sub_power$datetime, sub_power$Voltage)
  plot(c(sub_power$datetime, sub_power$datetime, sub_power$datetime), c(sub_power$Sub_metering_1, sub_power$Sub_metering_2, sub_power$Sub_metering_3), type = "n", ylab = "Energy sub metering", xlab="")
  lines(sub_power$datetime, sub_power$Sub_metering_1, col="black")
  lines(sub_power$datetime, sub_power$Sub_metering_2, col="red")
  lines(sub_power$datetime, sub_power$Sub_metering_3, col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
  plot(sub_power$datetime, sub_power$Global_reactive_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(sub_power$datetime, sub_power$Global_reactive_power)
})

# close the the device
dev.off()
