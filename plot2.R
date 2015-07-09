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
png(filename="plot2.png", height=480, width=480, bg="transparent")

#Create the graph

plot(sub_power$datetime, sub_power$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab="")
lines(sub_power$datetime, sub_power$Global_active_power)

# close the the device
dev.off()
