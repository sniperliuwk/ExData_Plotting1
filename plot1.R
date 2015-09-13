#open the data
db = read.table(paste(getwd(),"/exdata-data-household_power_consumption/household_power_consumption.txt",sep=''),header=T,sep=';',stringsAsFactor=F)
#subset the required data
subdb = db[db$Date %in% c("1/2/2007","2/2/2007") ,]

#transform required variable from character to numeric
Global_active_power = as.numeric(subdb$Global_active_power)

#plot using png file
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

