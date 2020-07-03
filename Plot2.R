## Download the file and read it in a table 
file <- read.table("C:/Users/aaa270/Desktop/R_Project/Exams/Course3/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Check Data
head(file)
##Set proper Name !!
power<-file
subData <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

#Keep only 2007-02-01 and 2007-02-02 

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


globalActivePower <- as.numeric(subData$Global_active_power)
png("plot2.png")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##LOg off from device connection
dev.off()

