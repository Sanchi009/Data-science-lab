library(caTools)
library(randomForest)
##iris dataset
# split = sample.split(iris)
# train = subset(iris, split=="TRUE")
# test = subset(iris, split=="FALSE")
# model = randomForest(x=train[1:4], y=train$Species,ntree=500)
# ypred = predict(model, test[1:4])
# cm = table(test$Species, ypred)
# cm
# summary(model)
# plot(model)
# importance(model)
# varImpPlot(model)


#healtcare dataset
data = data.frame(
  id = 1:100,
  age = sample(20:70, 100, replace=TRUE),
  bp = sample(90:150, 100, replace=TRUE),
  cholestrol = sample(150:250, 100, replace=TRUE),
  disease = sample(c(1,0), 100, replace = TRUE)
)
head(data)
model = randomForest(disease ~ age + bp + cholestrol, data = data ,ntree=500)
ypred = predict(model, newdata = data)
cm = table(data$disease, ypred)
cm
summary(model)
plot(model)
importance(model)
varImpPlot(model)
