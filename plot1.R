dataFile <- "./household_power_consumption.txt"
hpc <- read.table(dataFile,header=TRUE,sep=";", stringsAsFactors=FALSE)


hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")

# subset data
req_days <- subset(hpc,Date>=as.Date("2007-02-01") & Date <=as.Date("2007-02-02"))


png("plot1.png",width = 480,height = 480)
hist(as.numeric( req_days$Global_active_power),xlab ="Global Active Power (kilowatts)",
     col="red", main ="Global Active Power")

dev.off()