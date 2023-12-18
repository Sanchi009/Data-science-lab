library(ggplot2)
data = data.frame(
  x = c(2, 2, 8, 5, 7, 6, 1, 4, 3),
  y = c(10, 5, 4, 8, 5, 4, 2, 9, 9)
)
head(data)
dmat = dist(data, method = "euclidean")
dmat
model = hclust(dmat, method = "average")
summary(model)
plot(model)
rect.hclust(model,k=3)
fit = cutree(model, k=3)
print(fit)
