#open the data
db = read.table(paste(getwd(),"/exdata-data-household_power_consumption/household_power_consumption.txt",sep=''),header=T,sep=';',stringsAsFactor=F)
#subset the required data
subdb = db[db$Date %in% c("1/2/2007","2/2/2007") ,]

#transform the time related data
datetime = strptime(paste(subdb$Date, subdb$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#transform required variable from character to numeric
subMetering1 = as.numeric(subdb$Sub_metering_1)
subMetering2 = as.numeric(subdb$Sub_metering_2)
subMetering3 = as.numeric(subdb$Sub_metering_3)

#plot using png file
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
