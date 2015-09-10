library(sqldf)#you'll need this library for this code
fn<-"household_power_consumption.txt"
dt<-read.csv.sql(fn,sep=";",header = TRUE,sql='select * from file where Date in ("1/2/2007","2/2/2007")' )
library(lubridate)
library(dplyr)
dt<-mutate(dt,DateTime = dmy_hms(paste(Date,Time)))
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
#First chart is like plot2
with(dt,plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power",xlab=""))
#2 chart
with(dt,plot(DateTime,Voltage,type="l",ylab = "Voltage",xlab="datetime"))
#3 chart
yrange<-range(dt[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")])
with(dt,plot(DateTime,Sub_metering_1,type="l",col="black",ylim = yrange,ylab = "Energy sub metering",xlab=""))
with(dt,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(dt,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="__",bty="n")
#4 chart
with(dt,plot(DateTime,Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab="datetime",lwd=0.1))
dev.off()