# Coursera Coruse project Week 1

table<-read.table("./household_power_consumption.txt",sep=";", skip = 66637, nrows = 2880)
# since we are interested in only the dates of febuary 1st and 2nd 
# using notepad++ I was able to find where the first line that corresponds to date(feb 1, 2007) was (row 66638) but we want to skip to one row before
# since the each new row is generated after a minute, i want to read 48*60 rows from that point or nrow=2880

# now that we have a table that starts on feb 1, 2007 we want to give the names used for the header
namel<-read.table("./household_power_consumption.txt",sep=";",header = T, nrows = 1)

# we can now apply the names to the original table

names(table)<- names(namel)
# now that the names are correct we can begin to come up with a column that in a combination of both the date and time values

# first the we will merge the date and time columns

DTval<-paste(table$Date,table$Time)

# now we can use the Strptime funtction

table$DTVALS<- strptime(DTval, format = "%d/%m/%Y %H:%M:%S")

# all step to this point are to initalize the data so that the plots are consistant


win.graph(480,480)
par(mfcol = c(2,2))

#plot1
plot(table$DTVALS, table$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kW)", main = "")

#plot2
plot(table$DTVALS, table$Sub_metering_1, type = "l",xlab = "Daytime", ylab = "Energy sub metering")
points(table$DTVALS, table$Sub_metering_2, type = "l", col="RED")
points(table$DTVALS, table$Sub_metering_3, type = "l", col= "BLUE")

legend("topright", pch = "_", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot3
plot(table$DTVALS, table$Voltage, type = "l", xlab = "daytime", ylab = "Voltage")

#plot4
plot(table$DTVALS, table$Global_reactive_power, type = "l", xlab = "Daytime", ylab = "Global Reactive Power (kW)")


