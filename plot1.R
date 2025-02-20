############################################################################
#
# This R script produces plot 1 of assignment 1 of the course
# Exploratory Data Analysis of the Coursera Data Science Specialization
#
# For more information visit:
# https://github.com/ChriguK/ExData_Plotting1
#
############################################################################

# Load data (We will only be reading data from the dates 2007-02-01 and 2007-02-02)

file.name <- "exdata_data_household_power_consumption.zip"
hpc.attributes <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                    "Voltage", "Global_intensity", "Sub_metering_1",
                    "Sub_metering_2", "Sub_metering_3")

if (!file.exists(file.name)) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "exdata_data_household_power_consumption.zip", mode="wb")
}

hpc.data <- read.csv(unz("exdata_data_household_power_consumption.zip", 
                         "household_power_consumption.txt"), sep = ";",
                     skip = 66636, nrows= 2880, col.names = hpc.attributes,
                     na.strings = "?", stringsAsFactors = F)

# Create plot 1 and save it in a png file

png("plot1.png")
    with(hpc.data, hist(Global_active_power, col="red", 
                        main="Global Active Power", 
                        xlab="Global Active Power (kilowatts)"))
dev.off()
