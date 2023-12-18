library(ggplot2)
data = data.frame(
  years = c(1, 2, 2.5, 3, 4, 2, 6, 5),
  sal = c(5000, 7000, 8500, 7400, 10000, 6000, 15000, 8000)
)
model = lm(formula = sal~years, data)
ypred = predict(model, data)
coef(model)
plot(model)
ggplot()+geom_point(aes(x = data$years, y = data$sal)) + geom_line(aes(x=data$years,y=predict(model,data)), color = "red")

                                                                   