setwd("./Documents/School/Coursera/Exploratory Data Analysis")
power<-read.csv("household_power_consumption.txt",sep=";",header=TRUE,skip=66636,nrows=2880)
header<-read.csv("household_power_consumption.txt",sep=";",nrows=1,header=TRUE)
names(power)<-names(header)

times<-power$Time
dates<-power$Date
x<-paste(dates,times)
power$newDate<-strptime(x,"%d/%m/%Y %H:%M:%S")

with(power,plot(newDate,Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab=" "))
with(power,lines(newDate,Global_active_power))
dev.copy(png,file="plot2.png")
dev.off()
