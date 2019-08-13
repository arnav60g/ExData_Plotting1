# Read the table into the memory with specified rows

name <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880)
names(df) <- names(name)
x <- dmy_hms(paste(df$Date, df$Time))
df <- data.frame(x, df[,3:9])
names(df)[1] <- "Date & Time"


# 2nd Plot

png("plot2.png", width = 480, height = 480)
        plot(df$`Date & Time`, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()