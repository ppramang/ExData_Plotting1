#Reading the txt file with the data
data_power <- read.table("household_power_consumption.txt",skip=1,sep=";")

#Assigning the headers for each column
names(data_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Converting the Dates into an appropriate format
data_power$Date <- as.Date(data_power$Date, format = "%d/%m/%Y")

#Keeping only the necessary portion of data by subsetting the dataset
sub_data_power <- subset(data_power, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting the Times into an appropriate format and attaching it to the date
sub_data_power$Time <- strptime(paste(sub_data_power$Date, sub_data_power$Time), "%Y-%m-%d %H:%M:%S")

#Developing the Plot bz using the basic plotting function
plot(sub_data_power$Time,sub_data_power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_data_power,lines(sub_data_power$Time,as.numeric(as.character(sub_data_power$Sub_metering_1))))
with(sub_data_power,lines(sub_data_power$Time,as.numeric(as.character(sub_data_power$Sub_metering_2)),col="red"))
with(sub_data_power,lines(sub_data_power$Time,as.numeric(as.character(sub_data_power$Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Assigninging a Title to the graph
title(main="Energy sub-metering")

#Save the Grapg in a .PNG file
dev.copy(png, file = "plot3.png", height = 500, width = 500)
dev.off()