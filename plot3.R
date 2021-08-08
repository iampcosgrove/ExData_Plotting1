## Plot 3: Submetering Energy by TIme

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
png("plot3.png", width = 480, height = 480)


# Generate Global Active Power by Time
plot(housepwr$date_time, housepwr$Sub_metering_1, type = "solid", ylab= "Energy sub metering", xlab= "")
lines(housepwr$date_time, housepwr$Sub_metering_2, type = "solid", ylab= "Energy sub metering", xlab= "",
      col = "red")
lines(housepwr$date_time, housepwr$Sub_metering_3, type = "solid", ylab= "Energy sub metering", xlab= "",
      col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub metering 1", 
      "Sub metering 2", "Sub metering 3"))

## Close PNG
dev.off()
