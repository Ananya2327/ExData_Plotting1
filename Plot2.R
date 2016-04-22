## Data prep

data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

elec <- subset(data, Date >= "2007-02-01" & Date<= "2007-02-02")

# Plot graph and save to graphics device

dt <- paste(elec$Date, elec$Time, sep = " ")

dt1 <- as.POSIXlt(dt)

with(elec, plot(dt1, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)" ))

dev.copy(png, file = "Plot2.png")

dev.off()