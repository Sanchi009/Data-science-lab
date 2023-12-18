## logistic regression and linear regression on weather dataset
library(ggplot2)
data = data.frame(
  temp = c(20, 18, 25, 30, 40, 36),
  humidity = c(60, 56, 70, 87, 90, 98),
  rainday = c(0, 1, 1, 0, 0, 1)
)
model_lm = lm(formula = humidity ~ temp, data)
coef(model_lm)
plot(x=data$temp, y=data$humidity)
ggplot() + geom_point(aes(x=data$temp, y=data$humidity)) + geom_line(aes(x=data$temp, y=predict(model_lm, data)), color="red")


model_glm = glm(formula = rainday ~ temp + humidity, data, family = binomial())
summary(model_glm)
ypred = predict(model_glm, data)
ypred = ifelse(ypred > 0.5, 1, 0)
table(data$rainday, ypred)
library(ROCR)
roc = performance(prediction( data$rainday, ypred), measure = 'tpr', x.measure = 'fpr')
plot(roc)

