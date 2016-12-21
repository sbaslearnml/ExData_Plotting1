## download the unzip the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="sourcedata.zip", method="curl")
unzip ("sourcedata.zip", exdir = "./")

## read the file from the home directory 
dat <- read.delim("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE )

## filter the data and massage the data as required
filtereddata <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
filtereddata$Date <- as.Date(filtereddata$Date, format = "%d/%m/%Y")
filtereddata$DateTime <- as.POSIXct (paste(filtereddata$Date, filtereddata$Time))


# ploting can be done only on numric, so convert that into numeric
filtereddata$Global_active_power <- as.numeric(filtereddata$Global_active_power)

#draw the plot graph
plot(filtereddata$Global_active_power~filtereddata$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# export as PNG file

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()