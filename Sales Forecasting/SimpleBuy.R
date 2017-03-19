Train<-read.csv("C:/Users/admin/Desktop/Sales/Train.csv")
Test<-read.csv("C:/Users/admin/Desktop/Sales/Test.csv")
Train<-Train[Train$Number_SKU_Sold<15000000,]
Train$Date<-as.Date(Train$Date,format = "%d-%B-%y")
#Train$Diff[2:581]<-Train$Number_SKU_Sold[2:581]-Train$Number_SKU_Sold[1:580]
plot(Train$Date[1:365],Train$Number_SKU_Sold[1:365],type="l")
Train$Diff1[1]<-0
Train$Diff1[2:581]<-log(Train$Number_SKU_Sold[2:581])-log(Train$Number_SKU_Sold[1:580])
pacf(Train$Diff1)
acf(Train$Diff1)
fit<-arima(log(Train$Number_SKU_Sold),order=c(1,1,2))
pred <- predict(fit, n.ahead = 365)
pred=round((2.718^pred$pred/2)*2,0)
#Test<-cbind(Test$Date,pred)
#names(Test)[2]<-"Number_SKU_Sold"
write.csv(pred, file = "C:/Users/admin/Desktop/Sales/Prediction.csv")
