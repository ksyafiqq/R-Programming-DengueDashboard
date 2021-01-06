library(fpp2)
library(lubridate)
library(dplyr)




mydata5 <- read.csv("C:/Users/muham/Documents/UMP/Sem7/FYP2/Dataset/GeneralData.csv")


mydata5$Date <- as.Date(mydata5$Date)
str(mydata5)

rcntData <- ts(mydata5[,2], start = c(2020, 6), frequency = 29)


autoplot(rcntData) + 
  ggtitle("Time Plot: Dengue Cases in 2020") +
  ylab("Number of Cases")

DY <- diff(rcntData)

autoplot(DY) + 
  ggtitle("Time Plot: Change of Dengue Cases in 2020") +
  ylab("Number of Cases")

#ARIMA
fit_arima <- auto.arima(rcntData, d=1, stepwise = FALSE, approximation = FALSE
                        , trace = TRUE)
print(summary(fit_arima))
checkresiduals(fit_arima)
#residue 12.4

fcst <- forecast(fit_arima, h=52)
autoplot(fcst)
print(summary(fcst))
