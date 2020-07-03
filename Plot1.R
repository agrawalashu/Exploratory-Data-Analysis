## Download the file and read it in a table 
file <- read.table("C:/Users/aaa270/Desktop/R_Project/Exams/Course3/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE, sep=";")
##Check Data
head(file)
##Set proper Name !!
power<-file
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

#Keep only 2007-02-01 and 2007-02-02 
powerSubset<-power[which(power$Date=="2007-02-01" | power$Date=="2007-02-02"),]
powerSubset$Global_active_power<-as.numeric(as.character(powerSubset$Global_active_power))

#Plot 1
png(filename="plot1.png")
hist(powerSubset$Global_active_power,main="Global Active Power",ylab="Frequency",xlab="Global Active Power (kilowatts)",col="red")
##Turn off Device 
dev.off()
