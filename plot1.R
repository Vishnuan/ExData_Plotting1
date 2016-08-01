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



win.graph(200,200)

hist(table$Global_active_power, xlab = "Global Active Power (kW)", main = "Global Active Power", ylim = c(0,1200), col= "RED")

