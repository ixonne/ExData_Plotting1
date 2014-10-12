Sys.setlocale("LC_TIME", "C")

dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                  ,header=FALSE
                  ,sep=';'
                  ,na.strings="?" )
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
#head(dat)

#datetime <- paste(dat$Date,dat$Time)

dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")


png("plot4.png", width=480, height=480)

par(mfrow = c(2,2), mar = c(4, 4, 2, 1))
with( dat$Time, plot(dat$Time, dat$Global_active_power
                     ,type = "l"
                     ,ylab = "Global Active Power"
                     ,xlab = "") )

with( dat$Time, plot(dat$Time, dat$Voltage
                     ,type = "l"
                     ,ylab = "Voltage"
                     ,xlab = "datetime") )

with( dat$Time, plot(dat$Time, dat$Sub_metering_1, 
                     ,type = "l"
                     ,ylab = "Energy sub metering"
                     ,xlab = "") )
with( dat$Time, lines(dat$Time, dat$Sub_metering_2, col = "blue", type="l"))
with( dat$Time, lines(dat$Time, dat$Sub_metering_3, col = "red", type="l"))
legend("topright", lty=1, col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with( dat$Time, plot(dat$Time, dat$Global_reactive_power
                     ,type = "l"
                     ,ylab = "Global_reactive_power"
                     ,xlab = "datetime") )

dev.off() ## Don't forget to close the PNG device!
