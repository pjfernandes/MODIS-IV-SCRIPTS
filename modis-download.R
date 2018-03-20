setwd("DIRECTORY")

library(raster)
library(rts)

#DEFINIR LOGIN E SENHA
setNASAauth(username='LOGIN',password='PASSWORD')

#DOWNLOAD DAS IMAGENS
ModisDownload(x="MOD13Q1",h=c(14,13),v=c(11,10),dates=c("2014.02.02","2016.12.18"))
