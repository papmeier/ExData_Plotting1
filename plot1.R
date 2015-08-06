data = read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings="?", colClasses="character")
data[,1] = as.Date(data[,1],"%d/%m/%Y")
sub_data = subset(data, data[,1] >= as.Date("2007-02-01"))
sub_data = subset(sub_data,  sub_data[,1] < as.Date("2007-02-03"))
sub_data[,3:9] = lapply(sub_data[,3:9], as.numeric)

hist(sub_data[,"Global_active_power"], breaks=16, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png",width=480,height=480,units="px")
dev.off()
