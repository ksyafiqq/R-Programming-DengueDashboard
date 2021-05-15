library(fpp2)
library(lubridate)
library(dplyr)
library(tseries)
library(forecast)




testARIMA <- read.csv("C:/Users/muham/Documents/UMP/Sem7/FYP2/Dataset/GeneralData.csv")


testARIMA$Date <- as.Date(testARIMA$Date)
str(testARIMA)

rcntData <- ts(testARIMA$Total.Cases, start = c(2020,6,22), frequency = 29)


autoplot(rcntData) + 
  ggtitle("Time Plot: Dengue Cases in 2020") +
  ylab("Number of Cases")

checkresiduals(rcntData)
acf(rcntData)
pacf(rcntData)

adf.test(rcntData)

DY <- diff(rcntData)

autoplot(DY) + 
  ggtitle("Time Plot: Change of Dengue Cases in 2020") +
  ylab("Number of Cases")

print(summary(DY))

ar1 <- Arima(rcntData, c(5, 1, 0), include.drift = TRUE )
#AIC(ar1)
fcst <- forecast(ar1, h=58)
autoplot(fcst)
acf(fcst)
print(summary(fcst))
checkresiduals(fcst)
#ARIMA
fit_arima <- auto.arima(rcntData, d=1, stepwise = FALSE, approximation = FALSE
                        , trace = TRUE)
print(summary(fit_arima))
checkresiduals(fit_arima)
#residue 12.4

fcst <- forecast(fit_arima, h=58)
autoplot(fcst)
print(summary(fcst))
checkresiduals(fcst)

