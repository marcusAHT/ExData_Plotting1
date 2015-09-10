library(sqldf)#you'll need this library for this code
fn<-"household_power_consumption.txt"
dt<-read.csv.sql(fn,sep=";",header = TRUE,sql='select * from file where Date in ("1/2/2007","2/2/2007")' )
library(lubridate)
library(dplyr)
dt<-mutate(dt,DateTime = dmy_hms(paste(Date,Time)))
png(filename = "plot2.png", width = 480, height = 480)
with(dt,plot(DateTime,Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab=""))
dev.off()