install.packages("lubridate")
library(lubridate)

hh <- read.csv2("C:/Users/-6/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt")

hh1 <- hh
hh1$Date <- as.Date(hh1$Date, format="%d/%m/%Y")
hh2A <- subset(hh1,Date == "2007-02-01") 
hh2B <- subset(hh1,Date == "2007-02-02") 
hh2 <- rbind(hh2A,hh2B)
hh2[, 3] <- as.numeric(as.character(hh2[, 3]))

hh2 <- transform(hh2, datetime = paste(hh2$Date,hh2$Time,sep = " "))

plot(hh2$datetime, hh2$Global_active_power,
     ylab = "Global Active Power (kilowatts)",
     xaxt="n")

lines(hh2$datetime, hh2$Global_active_power, type="l") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
dev.copy(png,file = "ex2.png", width=480, height=480)
dev.off()
