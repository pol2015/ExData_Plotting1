par(mfrow=c(2,2))
install.packages("lubridate")
library(lubridate)

hh <- read.csv2("C:/Users/-6/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt")

hh1 <- hh
hh1$Date <- as.Date(hh1$Date, format="%d/%m/%Y")
hh2A <- subset(hh1,Date == "2007-02-01") 
hh2B <- subset(hh1,Date == "2007-02-02") 
hh2 <- rbind(hh2A,hh2B)
hh2[, 3] <- as.numeric(as.character(hh2[, 3]))
hh2[, 5] <- as.numeric(as.character(hh2[, 5]))
hh2[, 7] <- as.numeric(as.character(hh2[, 7]))
hh2[, 8] <- as.numeric(as.character(hh2[, 8]))
hh2[, 9] <- as.numeric(as.character(hh2[, 9]))
hh2[, 4] <- as.numeric(as.character(hh2[, 4]))

par(mfrow=c(2,2))
hh2 <- transform(hh2, datetime = paste(hh2$Date,hh2$Time,sep = " "))

plot(hh2$datetime, hh2$Global_active_power,
     ylab = "Global Active Power",
     xaxt="n")

lines(hh2$datetime, hh2$Global_active_power, type="l") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 

plot(hh2$datetime, hh2$Voltage,
     ylab = "Voltage",
     xlab = "datetime",
     xaxt="n")

lines(hh2$datetime, hh2$Voltage, type="l") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 

plot(hh2$datetime, hh2$Sub_metering_1,
     ylab = "Energy sub metering",
     col = "black",
     xaxt="n")

lines(hh2$datetime, hh2$Sub_metering_1, type="l",col="black") 
lines(hh2$datetime, hh2$Sub_metering_2, type="l",col="red") 
lines(hh2$datetime, hh2$Sub_metering_3, type="l",col="blue") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
legend(1700,39.5,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",lty="solid",col=c("black","red","blue"),pt.cex=1, cex=0.5)

plot(hh2$datetime, hh2$Global_reactive_power,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt="n")

lines(hh2$datetime, hh2$Global_reactive_power, type="l") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 



dev.copy(png,file = "plot4.png", width=480, height=480)
dev.off()
