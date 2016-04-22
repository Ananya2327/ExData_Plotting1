## Data prep

data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

elec <- subset(data, Date >= "2007-02-01" & Date<= "2007-02-02")

# Plot graph and save to graphics device

hist(elec$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "Red")

dev.copy(png, file = "Plot1.png")

dev.off()