setwd("./Documents/School/Coursera/Exploratory Data Analysis")
power<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,skip=66636,nrows=2880)
header<-read.csv("household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
names(power)<-names(header)

times<-power$Time
dates<-power$Date
x<-paste(dates,times)
power$newDate<-strptime(x,"%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
with(power,plot(newDate,Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(power,lines(newDate,Sub_metering_1))
with(power,lines(newDate,Sub_metering_2,col="red"))
with(power,lines(newDate,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:1)
dev.off()
