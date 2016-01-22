dataFile <- "./household_power_consumption.txt"
hpc <- read.table(dataFile,header=TRUE,sep=";", stringsAsFactors=FALSE)

hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

# subset data
req_days <- subset(hpc,Date>=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))

# convert to numeric
sub_metering1 <- as.numeric(req_days$Sub_metering_1)
sub_metering2 <- as.numeric(req_days$Sub_metering_2)

sub_metering3 <- req_days$Sub_metering_3

date_time <- strptime(paste(req_days$Date,req_days$Time,sep = " "),"%Y-%m-%d %H:%M:%S")

png("plot3.png",width = 480,height = 480)

# ploting each sub_metering and coloring

with(req_days,plot(date_time,sub_metering1,type = 'n',xlab = "",ylab ="Energy sub metering"))
with(req_days,points(x=date_time,y=sub_metering1,type = 'l'))
with(req_days,points(x=date_time,y=sub_metering2,type = 'l',col="red"))
with(req_days,points(x=date_time,y=sub_metering3,type = 'l',col="blue"))
legend("topright",legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col = c("black","red","blue"))

dev.off()

