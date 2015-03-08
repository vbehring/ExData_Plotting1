library(sqldf)
DF4 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',header = TRUE, sep = ';')
DF4$Date_Time <- paste(DF4$Date, DF4$Time)
DF4$Date_Time <- strptime(DF4$Date_Time, format="%d/%m/%Y %H:%M:%S")

# Plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(DF4[,10],DF4[,3], type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
