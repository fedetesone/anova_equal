library(readr)
library(gplots)
resultados <- read_csv("resultados.csv")

anova_by_method <- function(metodo) {
  sample_data <- resultados[resultados$metodo == metodo,]
  # View(sample_data)
  
  AnovaModel.sample_data <- aov(error ~ as.factor(sample_size), data=sample_data)
  print(summary(AnovaModel.sample_data))
  print(TukeyHSD(AnovaModel.sample_data))
  
  par(mfrow=c(3,2))
  # Can be changed by plotmeans
  boxplot(error ~ sample_size, 
          data = sample_data,
          xlab="Muestra",
          ylab="Error promedio",
          main=paste("Metodo",metodo, sep=" "),
          connect=FALSE, 
          col = c("#00AFBB", "#E7B800", "#FC4E07"))
}
anova_by_method("bow")
anova_by_method("ft")
anova_by_method("gtfidf")
anova_by_method("w2v")
anova_by_method("sem")
anova_by_method("ensemble")

################################################################################
anova_by_sample_size <- function(p_sample_size) {
  sample_data <- resultados[resultados$sample_size == p_sample_size,]
  # sample_data <- sample_data1[sample_data1$metodo != "bow",]
  # View(sample_data)
  
  AnovaModel.sample_data <- aov(error ~ as.factor(metodo), data=sample_data)
  print(summary(AnovaModel.sample_data))
  print(TukeyHSD(AnovaModel.sample_data, conf.level=0.95))
  
  par(mfrow=c(3,2))
  # Can be changed by plotmeans
  boxplot(error ~ metodo, 
          data = sample_data,
          xlab="Metodo",
          ylab="Error promedio",
          # main=paste("Tamaño de muestra ",p_sample_size, sep=" "),
          connect=FALSE, 
          col = c("#00AFBB", "#E7B800", "#FC4E07"))
}
#anova_by_sample_size("100")
#anova_by_sample_size("500")
#anova_by_sample_size("1000")
#anova_by_sample_size("1500")
anova_by_sample_size("2000")