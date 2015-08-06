data = read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";", na.strings="?", colClasses="character")
data[,1] = as.Date(data[,1],"%d/%m/%Y")
sub_data = subset(data, data[,1] >= as.Date("2007-02-01"))
sub_data = subset(sub_data,  sub_data[,1] < as.Date("2007-02-03"))

sub_data[,2] = as.POSIXct(strftime(paste(sub_data[,1], sub_data[,2]),"%Y-%m-%d %H:%M:%S"))
sub_data[,3:9] = lapply(sub_data[,3:9], as.numeric)


## English Time:
Sys.setlocale("LC_TIME", "English")
png(file="plot3.png",width=480,height=480)
plot(sub_data[,2],sub_data[,"Sub_metering_1"],type="n",xlab="",ylab="Energy sub metering")
lines(sub_data[,2],sub_data[,"Sub_metering_1"], col="black")
lines(sub_data[,2],sub_data[,"Sub_metering_2"], col="red")
lines(sub_data[,2],sub_data[,"Sub_metering_3"], col="blue")
legend("topright", col=c("black","red","blue"), lwd=1, names(sub_data[,7:9]))
#dev.copy(png,"plot3.png",width=480,height=480,units="px")
dev.off()
## End English Time
Sys.setlocale("LC_TIME", "German")
