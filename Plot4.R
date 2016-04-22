data <- read.table ("C:\\Users\\e571237\\Desktop\\household_power_consumption.txt", sep = ';', header = TRUE, stringsAsFactor=F,na.strings="?") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

elec <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

par(mfrow = c(2,2))
dt <- paste(elec$Date, elec$Time, sep = " ")
dt1 <- as.POSIXlt(dt)

#first plot

with(elec, plot(dt1, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power" )) 

#second plot

with(elec, plot(dt1, Voltage , type = "l", xlab = "datetime", ylab = "Voltage" )) 

#Third Plot

c1 <- elec$Sub_metering_1 
c2 <- elec$Sub_metering_2 
c3 <- elec$Sub_metering_3 

c <- append(x =c1, values = c(c2, c3)) 


t <- append (x = dt1, values = c(dt1, dt1)) 


with(elec, plot(x= t, y =c(c1,c2,c3), xlab = "", ylab = "Energy sub metering", type = "l"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), text.font = 1, cex = 0.50) 


#Fourth Plot

with(elec, plot(dt1, Global_reactive_power , type = "l", xlab = "datetime", ylab = "Global_reactive_power" )) 


dev.copy(png, file = "Plot4.png")

dev.off()




