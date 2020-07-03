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

subMet1 <- as.numeric(subData$Sub_metering_1)
subMet2 <- as.numeric(subData$Sub_metering_2)
subMet3 <- as.numeric(subData$Sub_metering_3)

## Plot3.png as the name of the graph
png("plot3.png")

plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
## Close connection on the png driver
dev.off()
