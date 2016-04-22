data <- read.table ("C:\\Users\\e571237\\Desktop\\household_power_consumption.txt", sep = ';', header = TRUE, stringsAsFactor=F,na.strings="?") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

elec <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02") 

temp <- paste(elec$Date, elec$Time, sep = " ") 
temp1 <- as.POSIXlt(temp) 

c1 <- elec$Sub_metering_1 
c2 <- elec$Sub_metering_2 
c3 <- elec$Sub_metering_3 

c <- append(x =c1, values = c(c2, c3)) 


t <- append (x = temp1, values = c(temp1, temp1)) 


with(elec, plot(x= t, y =c(c1,c2,c3), xlab = "", ylab = "Energy sub metering", type = "l"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue")) 

dev.copy(png, file = "Plot3.png")

dev.off()


