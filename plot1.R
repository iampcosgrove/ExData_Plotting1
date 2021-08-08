# Plot Overview: Histogram of Global Active Power vs. Frequency

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
png("plot1.png", width = 480, height = 480)

## Generate Histogram of Global Active Power Frequency
hist(housepwr$Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", main ="Global Active Power")

## Close PNG
dev.off()
