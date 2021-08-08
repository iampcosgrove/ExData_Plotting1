setwd("~/GitHub/ExData_Plotting1")

if(!file.exists("data")){
      dir.create("data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if(!file.exists("~/GitHub/ExData_Plotting1/data/household_power_consumption.txt")) {
      download.file(fileURL, dest= "./data/dataZIP.zip", mode= "wb")
      unzip("~/GitHub/ExData_Plotting1/data/dataZIP.zip", exdir = "~/GitHub/ExData_Plotting1/data")
      file.remove("~/GitHub/ExData_Plotting1/data/dataZIP.zip")}

##Estimate Memory required (mB)
2075259*9*8/(2^20)

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
