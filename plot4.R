setwd("./Documents/School/Coursera/Exploratory Data Analysis")
power<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,skip=66636,nrows=2880)
header<-read.csv("household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
names(power)<-names(header)

times<-power$Time
dates<-power$Date
x<-paste(dates,times)
power$newDate<-strptime(x,"%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfcol=c(2,2))
with(power,plot(newDate,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=" "))
with(power,lines(newDate,Global_active_power))

with(power,plot(newDate,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(power,lines(newDate,Sub_metering_1))
with(power,lines(newDate,Sub_metering_2,col="red"))
with(power,lines(newDate,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:1,bty="n")

with(power,plot(newDate,Voltage,type="n",ylab="Voltage",xlab="datetime"))
with(power,lines(newDate,Voltage))

with(power,plot(newDate,Global_reactive_power,type="n",xlab="datetime"))
with(power,lines(newDate,Global_reactive_power))

#dev.copy(png,file="plot2.png")
dev.off()

