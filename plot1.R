
hh <- read.csv2("C:/Users/-6/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt")

hh1 <- hh
hh1$Date <- as.Date(hh1$Date, format="%d/%m/%Y")
hh2A <- subset(hh1,Date == "2007-02-01") 
hh2B <- subset(hh1,Date == "2007-02-02") 
hh2 <- rbind(hh2A,hh2B)
hh2[, 3] <- as.numeric(as.character(hh2[, 3]))


hist(hh2$Global_active_power,
     
     col = "RED" , 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200)
     breaks = 12
     cex.lab=0.8, 
     cex.axis=0.8,
     freq=TRUE
     axes = TRUE
     xlim = c(0, 6)
     
    )

#PNG file with a width of 480 pixels and a height of 480 pixels.

dev.copy(png,file = "ex1.png", width=480, height=480)
dev.off()



