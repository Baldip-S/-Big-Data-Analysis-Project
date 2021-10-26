#Reading in File
hours.df <- read.csv(file.choose(), sep = ",")

#Replacing Season Values
hours.df$season <- gsub("1","Spring",hours.df$season)
hours.df$season <- gsub("2","Summer",hours.df$season)
hours.df$season <- gsub("3","Fall",hours.df$season)
hours.df$season <- gsub("4","Winter",hours.df$season)

#Replacing Year Values
hours.df$yr <- gsub("1","2012",hours.df$yr)
hours.df$yr <- gsub("0","2011",hours.df$yr)

#Replacing Month Values
hours.df$mnth <- gsub("10","October",hours.df$mnth)
hours.df$mnth <- gsub("11","November",hours.df$mnth)
hours.df$mnth <- gsub("12","December",hours.df$mnth)
hours.df$mnth <- gsub("1","January",hours.df$mnth)
hours.df$mnth <- gsub("2","February",hours.df$mnth)
hours.df$mnth <- gsub("3","March",hours.df$mnth)
hours.df$mnth <- gsub("4","April",hours.df$mnth)
hours.df$mnth <- gsub("5","May",hours.df$mnth)
hours.df$mnth <- gsub("6","June",hours.df$mnth)
hours.df$mnth <- gsub("7","July",hours.df$mnth)
hours.df$mnth <- gsub("8","August",hours.df$mnth)
hours.df$mnth <- gsub("9","September",hours.df$mnth)


#Replacing Weekday values
hours.df$weekday <- gsub("1","Monday",hours.df$weekday)
hours.df$weekday <- gsub("2","Tuesday",hours.df$weekday)
hours.df$weekday <- gsub("3","Wednesday",hours.df$weekday)
hours.df$weekday <- gsub("4","Thursday",hours.df$weekday)
hours.df$weekday <- gsub("5","Friday",hours.df$weekday)
hours.df$weekday <- gsub("6","Saturday",hours.df$weekday)
hours.df$weekday <- gsub("0","Sunday",hours.df$weekday)

#Replacing Weather Values
hours.df$weathersit <- gsub ("1","Cloudy",hours.df$weathersit)
hours.df$weathersit <- gsub ("2","Misty/Cloudy",hours.df$weathersit)
hours.df$weathersit <- gsub ("3","Light Rain/Cloudy/Thunder",hours.df$weathersit)
hours.df$weathersit <- gsub ("4","Heavy Rain/Hail/Thunder/Fog",hours.df$weathersit)

#Dropping Date and Instance Columns
hours.df <- hours.df[-c(1)]
hours.df <- hours.df[-c(1)]

#Rearranging Columns
test <- hours.df[,c(2,1,3,6,4,7,5,8,9,10,11,12,13,14,15)]

#Dropping Holiday and Working Day Columns
test <- test[-c(6,7)]

#Editing Column names for Consistency and Appeal
colnames(test)[which(names(test) == "cnt")] <- "TotalRiders"
colnames(test)[which(names(test) == "casual")] <- "CasualRiders"
colnames(test)[which(names(test) == "registered")] <- "RegisteredRiders"
colnames(test)[which(names(test) == "season")] <- "Season"
colnames(test)[which(names(test) == "yr")] <- "Year"
colnames(test)[which(names(test) == "mnth")] <- "Month"
colnames(test)[which(names(test) == "hr")] <- "Hour"
colnames(test)[which(names(test) == "weekday")] <- "Weekday"
colnames(test)[which(names(test) == "weathersit")] <- "Weather"
colnames(test)[which(names(test) == "temp")] <- "AmbientTemp"
colnames(test)[which(names(test) == "atemp")] <- "FeltTemp"
colnames(test)[which(names(test) == "hum")] <- "Humidity"
colnames(test)[which(names(test) == "windspeed")] <- "WindSpeed"

#Saving as Final Data frame
FinalHours.df <- test

summary(FinalHours.df)

setwd("C:/Users/baldi/Documents")

#Writing out the new csv file into my documents 
write.csv(FinalHours.df,file = "FinalHours", row.names = FALSE)

