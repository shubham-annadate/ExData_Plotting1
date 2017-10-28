library(tidyverse)

# Reading data from file
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                 stringsAsFactors = FALSE, dec = ".")

# Transforming Date to date type
df <- transform(df, Date = as.Date(Date, format = "%d/%m/%Y"))

# Filtering the required dates
df <- filter(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

#Preparing data
global_active_power <- as.numeric(df$Global_active_power)

# Opening png file
png(file = "plot1.png", height = 480, width = 480)

# Creating plot 
hist(global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Closing png file
dev.off()

