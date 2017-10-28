library(tidyverse)

# Reading data from file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 stringsAsFactors = FALSE, dec = ".")

# Transforming Date to date type
df <- transform(df, Date = as.Date(Date, format = "%d/%m/%Y"))

# Filtering the required dates
df <- filter(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Preparing data
datetime <- strptime(paste(df$Date, df$Time), format = "%Y-%m-%d %H:%M:%S")
global_active_power <- as.numeric(df$Global_active_power)
global_reactive_power <- as.numeric(df$Global_reactive_power)
voltage <- as.numeric(df$Voltage)
sub_metering_1 <- as.numeric(df$Sub_metering_1)
sub_metering_2 <- as.numeric(df$Sub_metering_2)
sub_metering_3 <- as.numeric(df$Sub_metering_3)

# Opening png file
png(file = "plot4.png", height = 480, width =480)

# Setting plot output layout
par(mfrow = c(2,2))

# Creating plot
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(datetime, voltage, type = "l",  xlab = "datetime", "Voltage")

plot(datetime, sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, sub_metering_2, type = "l", col = "red")
lines(datetime, sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col = c("black", "red", "blue"))

plot(datetime, global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_rective_power")

# Closing png file
dev.off()
