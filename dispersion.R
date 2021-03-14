library(readr)
library(gplots)
bow <- read_csv("/cloud/project/dispersion/bow.csv")
plot(bow)
plot(seq1 ~ seq2, bow)

tfidf <- read_csv("/cloud/project/dispersion/tfidf.csv")
plot(seq1 ~ seq2, tfidf)

ft <- read_csv("/cloud/project/dispersion/ft.csv")
plot(ft)
plot(seq1 ~ seq2, ft)

w2v <- read_csv("/cloud/project/dispersion/w2v.csv")
plot(seq1 ~ seq2, w2v)

sem <- read_csv("/cloud/project/dispersion/sem.csv")
plot(seq1 ~ seq2, sem)


