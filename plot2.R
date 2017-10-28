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
global_active_power <- as.numeric(as.character(df$Global_active_power))

# Opening png file
png(file = "plot2.png", height = 480, width = 480)

# Creating plot
plot(datetime, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Close png file
dev.off()
  

