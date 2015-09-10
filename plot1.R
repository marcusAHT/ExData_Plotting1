library(sqldf)#you'll need this library for this code
fn<-"household_power_consumption.txt"
dt<-read.csv.sql(fn,sep=";",header = TRUE,sql='select * from file where Date in ("1/2/2007","2/2/2007")' )
#No need to touche the dates for this graph
png(filename = "plot1.png", width = 480, height = 480)
hist(dt$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()