library(raster)
library(sp)
library(rgdal)

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/artigo_filtros")

arquivos<-dir(,pattern="EVI.tif")
lista<-list()
for (arquivo in arquivos) {
lista<-append(lista,raster(arquivo))
}

s<-stack(lista)
################################################FILTRAGEM
library(sleekts)
library(zoo)

f2 <- function(x) {
v<-as.vector(x)
if (all(is.na(v))==FALSE) {
z<-na.approx(v)
x<-sleek(z)
}
return(x)
}

beginCluster(8)
system.time(
teste<-clusterR(s,calc,args=list(fun=f2))
)
########################################SALVANDO OS ARQUIVOS
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend2")

for(i in 1:nlayers(teste)) {
arquivo<-names(s[[i]])
writeRaster(teste[[i]],paste("filt_",arquivo,".tif",sep=""))
}

#
#
