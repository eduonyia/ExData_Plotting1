dataFile <- "./household_power_consumption.txt"
hpc <- read.table(dataF,head=TRUE,sep=";", stringsAsFactors=FALSE)


hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

# subset data
req_days <- subset(hpc,Date>=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))

date_time <- strptime(paste(req_days$Date,req_days$Time,sep = " "),"%Y-%m-%d %H:%M:%S")
Global_active_power <- as.numeric(req_days$Global_active_power)

png("plot2.png",width = 480,height = 480)
plot(date_time,Global_active_power,type='l',xlab ="",ylab = "Global Active Power (kilowatts)")

dev.off()