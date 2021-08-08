## Plot 4: 4 Plots (Global Active Power, Voltage, Energy sub metering, Global Reactive Power)

setwd("~/GitHub/ExData_Plotting1")

library(data.table)
library(dplyr)
library(ggplot2)
library(lubridate)


##Read file
house_all <- fread("~/GitHub/ExData_Plotting1/data/household_power_consumption.txt")

##Strip Time from Date
house_all$Date <- as.Date(house_all$Date, format = "%d/%m/%Y")

##Subset timeframe to 2007-02-01 and 2007-02-02 

housepwr <- subset(house_all, Date >= "2007-02-01" & Date <= "2007-02-02")
housepwr$Global_active_power <- as.numeric(housepwr$Global_active_power)


#Combine Date and Time
housepwr$date_time = ymd_hms(paste(housepwr$Date, housepwr$Time))

## Open Connection as png
png("plot4.png", width = 480, height = 480)


## Establish 2 x 2 graph pane

par(mfrow = c(2,2))

## Plot #1: Global Active Power
plot(housepwr$date_time, housepwr$Global_active_power, type = "s", ylab= "Global Active Power (kilowatts)",
     xlab= "")

## Plot #2: Voltage
plot(housepwr$date_time, housepwr$Voltage, type= "s", ylab= "Voltage", xlab = "datetime")

## Plot 3:  Sub metering
plot(housepwr$date_time, housepwr$Sub_metering_1, type = "s", ylab= "Energy sub metering", xlab= "")
lines(housepwr$date_time, housepwr$Sub_metering_2, type = "s", ylab= "Energy sub metering", xlab= "", 
      col = "red")
lines(housepwr$date_time, housepwr$Sub_metering_3, type = "s", ylab= "Energy sub metering", xlab= "",
      col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("sub metering 1", 
      "sub metering 2", "sub metering 3"), bty = "n")

## Plot 4: Global Reactive Power
plot(housepwr$date_time, housepwr$Global_reactive_power, type= "s", ylab= "Global Reactive Power", 
     xlab = "datetime")

## Close PNG
dev.off()
