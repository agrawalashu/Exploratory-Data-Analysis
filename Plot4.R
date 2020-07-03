## Download the file and read it in a table 
file <- read.table("C:/Users/aaa270/Desktop/R_Project/Exams/Course3/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Check Data
head(file)
##Set proper Name !!
power<-file


#Keep only 2007-02-01 and 2007-02-02 
subData <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]


##Merge time and Date 
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)

subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)

## Plot4.png as the name of the graph
png("plot4.png")

par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.0, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Close connection on the png driver
dev.off()
