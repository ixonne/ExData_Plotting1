Sys.setlocale("LC_TIME", "C")

dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                  ,header=FALSE
                  ,sep=';'
                  ,na.strings="?" )
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
head(dat)

datetime <- paste(dat$Date,dat$Time)

#datetime_fixed  <- strptime(datetime,format ="%d/%m/20%y %H:%M:%S")

dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")


head(dat)


with( dat$Time, plot(dat$Time, dat$Global_active_power
                              ,type = "l"
                              ,ylab = "Global Active Power (killowats)"
                              ,xlab = "") )



dev.copy(png, file = "plot2.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

