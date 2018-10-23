plot1<- function(){
        
        ## readind the database
        data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        data$Global_active_power <- as.numeric(data$Global_active_power)
        data$Date <- as.Date(data$Date, format="%d/%m/%Y")

        
        ## subset data 
        subset_data <- subset(data, Date == "2007-02-02"|Date =="2007-02-01")
        
        ## plot histogram
        png("plot1.png", width=480, height=480)
        hist(subset_data$Global_active_power, main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", border="black")
        dev.off()
}