
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"')
                  ,header=FALSE
                  ,sep=';'
                  ,na.strings="?" )
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
head(dat)



hist(dat$Global_active_power
     ,col = "red"
     ,xlab = "Global Active Power (killowats)"
     ,main = "Global Active Power"
     ,ylim = c(0, 1200))


dev.copy(png, file = "Plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!

