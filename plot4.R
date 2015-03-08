library(sqldf)
DF4 <- read.csv.sql('household_power_consumption.txt', sql = 'select * from file where Date = "1/2/2007" or Date = "2/2/2007"',header = TRUE, sep = ';')
DF4$Date_Time <- paste(DF4$Date, DF4$Time)
DF4$Date_Time <- strptime(DF4$Date_Time, format="%d/%m/%Y %H:%M:%S")

#plot4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(DF4[,10],DF4[,3], type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
plot(DF4[,10],DF4[,5], type = "l", xlab="datetime", ylab = "Voltage")
plot(DF4[,10],DF4[,7], type = "l", xlab="", ylab="Energy sub metering", col="black")
lines(DF4[,10],DF4[,8], col = "red")
lines(DF4[,10],DF4[,9], col = "blue")
legend('topright', names(DF4)[7:9] , 
       lty=1, col=c('black', 'red', 'blue'), bty="n")
plot(DF4[,10],DF4[,4], type = "l", xlab="datetime", ylab = "Global_reactive_power")
par(mfrow=c(2,2))
dev.off()
