install.packages("lubridate")
library(lubridate)

hh <- read.csv2("C:/Users/-6/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt")

hh1 <- hh
hh1$Date <- as.Date(hh1$Date, format="%d/%m/%Y")
hh3A <- subset(hh1,Date == "2007-02-01") 
hh3B <- subset(hh1,Date == "2007-02-02") 
hh3 <- rbind(hh3A,hh3B)

hh3[, 7] <- as.numeric(as.character(hh3[, 7]))
hh3[, 8] <- as.numeric(as.character(hh3[, 8]))
hh3[, 9] <- as.numeric(as.character(hh3[, 9]))

hh3 <- transform(hh3, datetime = paste(hh3$Date,hh3$Time,sep = " "))

plot(hh3$datetime, hh3$Sub_metering_1,
     ylab = "Energy sub metering",
     col = "black",
     xaxt="n")

lines(hh3$datetime, hh3$Sub_metering_1, type="l",col="black") 
lines(hh3$datetime, hh3$Sub_metering_2, type="l",col="red") 
lines(hh3$datetime, hh3$Sub_metering_3, type="l",col="blue") 

axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat")) 
legend(2000,39.5,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",col=c("black","red","blue"),pt.cex=1, cex=0.75)
dev.copy(png,file = "ex3c.png", width=480, height=480)
dev.off()




