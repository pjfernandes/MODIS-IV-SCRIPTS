require("raster")
require(parallel)
require(doParallel)
require(foreach)

setwd("C:/Users/UFF/Desktop/arquivos/luyx")

s<-shapefile(dir(,pattern=".shp")[1])
bps_utm<-s

#dir.create("C:/Users/UFF/Desktop/arquivos/luyx/PROCESSADAS")

lista3<-list()

#cl<-makeCluster(3)
#registerDoParallel(cl)


for (i in 1:length(dir(,pattern=".tif$"))){
  #c<-foreach(i=1:length(dir(,pattern=".tif$")), .packages = "raster",.combine = "c") %dopar% {
    setwd("C:/Users/UFF/Desktop/arquivos/luyx")
    r<-raster(dir(,pattern=".tif$")[i])
    arquivo<-names(r)
    r2<-mask(r,bps_utm)
    r2<-crop(r2,bps_utm)
    append(lista3,r2)
    setwd("C:/Users/UFF/Desktop/arquivos/luyx/PROCESSADAS")
    writeRaster(r2,paste("rec_",arquivo,".tif",sep=""))
  }
