library(raster)
library(rts)
library(rkt)

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

datas<-as.Date(sub("[.]","-",sub("[.]","-",substr(dir(,pattern="EVI"),21,30))))

ls<-list()
for(i in dir(,pattern="EVI")) {
  r<-raster(i)
  ls<-append(ls,r)
}

s<-stack(ls)

my<-rts(s,datas)
my2<-apply.yearly(my,mean)

y00<-subset(my2,1)
y01<-subset(my2,2)
y02<-subset(my2,3)
y03<-subset(my2,4)
y04<-subset(my2,5)
y05<-subset(my2,6)
y06<-subset(my2,7)
y07<-subset(my2,8)
y08<-subset(my2,9)
y09<-subset(my2,10)
y10<-subset(my2,11)
y11<-subset(my2,12)
y12<-subset(my2,13)
y13<-subset(my2,14)
y14<-subset(my2,15)
y15<-subset(my2,16)

s_all<-stack(y00,y01,y02,y03,y04,y05,y06,y07,y08,y09,y10,y11,y12,y13,y14,y15)

fun1<- function(x) { 
  dat<-1:365
  if (is.na(x[1])) { 
    NA 
  } else { 
    m=rkt(dat,x)
    m$B
  } 
} 

fun2 <- function(x) { 
  dat<-1:365
  if (is.na(x[1])) { 
    NA 
  } else { 
    m=rkt(dat,x)
    m$sl
  } 
} 

beginCluster(8)


l_m<-clusterR(s,calc,args=list(fun=fun1))
p<-clusterR(s,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_total.tif")
writeRaster(final,"tend_EVI_total.tif")

###################################### DEZEMBRO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"12"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  r1<-raster(arquivos[1])
  r2<-raster(arquivos[2])
  lista_media<-append(lista_media,(r1+r2)/2)
}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_dezembro.tif")
writeRaster(final,"tend_EVI_media_dezembro.tif")

#################################NOVEMBRO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"11"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_novembro.tif")
writeRaster(final,"tend_EVI_media_novembro.tif")

######################################################OUTUBRO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"10"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_outubro.tif")
writeRaster(final,"tend_EVI_media_outubro.tif")
#############################################################SETEMBRO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"09"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_setembro.tif")
writeRaster(final,"tend_EVI_media_setembro.tif")

#############################################################AGOSTO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"08"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_agosto.tif")
writeRaster(final,"tend_EVI_media_agosto.tif")
#############################################################JULHO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"07"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_julho.tif")
writeRaster(final,"tend_EVI_media_julho.tif")
#############################################################JUNHO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"06"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_junho.tif")
writeRaster(final,"tend_EVI_media_junho.tif")
#############################################################MAIO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"05"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_maio.tif")
writeRaster(final,"tend_EVI_media_maio.tif")
#############################################################ABRIL
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

#rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"04"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_abril.tif")
writeRaster(final,"tend_EVI_media_abril.tif")
#############################################################MARÇO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"03"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_marco.tif")
writeRaster(final,"tend_EVI_media_marco.tif")
#############################################################FEVEREIRO
setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2000:2015) {
  rodada<-i
  mes<-"02"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_fevereiro.tif")
writeRaster(final,"tend_EVI_media_fevereiro.tif")
#############################################################JANEIRO

fun1<- function(x) { 
  dat<-1:15
  if (is.na(x[1])) { 
    NA 
  } else { 
    m=rkt(dat,x)
    m$B
  } 
} 

fun2 <- function(x) { 
  dat<-1:15
  if (is.na(x[1])) { 
    NA 
  } else { 
    m=rkt(dat,x)
    m$sl
  } 
} 

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/art_tend_EVI")

rm(rodada,mes,arquivos,r1,r2,lista_media)

lista_media<-list()

for (i in 2001:2015) {
  rodada<-i
  mes<-"01"
  arquivos<-dir(,pattern=paste(rodada,"[.]",mes,"[.]",sep=""))
  if(length(arquivos)==1) {
    r1<-raster(arquivos) 
    lista_media<-append(lista_media,r1)
  } else {
    r1<-raster(arquivos[1])
    r2<-raster(arquivos[2])
    lista_media<-append(lista_media,(r1+r2)/2)
  }}

s_mes<-stack(lista_media)

l_m<-clusterR(s_mes,calc,args=list(fun=fun1))
p<-clusterR(s_mes,calc,args=list(fun=fun2))
p_mask<-p<0.05
p_mask[p_mask==0][]<-NA

final<-l_m*p_mask

setwd("C:/Users/pjf_f/Desktop/arquivos/dados/NDVI/res_artigo_2/TENDENCIAS_EVI/TS")

writeRaster(p,"valor_p_EVI_media_janeiro.tif")
writeRaster(final,"tend_EVI_media_janeiro.tif")
