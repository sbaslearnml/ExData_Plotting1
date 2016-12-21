## download the unzip the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="sourcedata.zip", method="curl")
unzip ("sourcedata.zip", exdir = "./")

## read the file from the home directory 
dat <- read.delim("household_power_consumption.txt", sep = ";",header = TRUE, stringsAsFactors = FALSE )

## filter the data
fildat <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]

# ploting can be done only on numric, so convert that into numeric
fildat$Global_active_power <- as.numeric(fildat$Global_active_power)

#draw the hist file
hist(fildat$Global_active_power, xlab = "Global Activer Power (kilowatts)", ylab = "Frequency", col = "red", main = "Global Active Power")

# export as PNG file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()