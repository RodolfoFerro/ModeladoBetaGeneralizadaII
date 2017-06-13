# Rodolfo Ferro Pérez
# ferro@cimat.mx
# Simulación de datos Beta Generalizada de Tipo II, LogNormal, 
# y mezcla de LogNormales.

# Liberar memoria:
rm(list=ls())

# IMPORTANTE: Si utilizas RStudio, hay que definir el directorio de trabajo
# al de los archivos fuente, puedes ver el directorio actual con getwd()

# Número de datos:
num_datos  = 10000

# Breaks para histogramas:
breaks = 50


#=============== Simulación de datos: ===============#

#====== I. Beta generalizada de tipo II:
library(GB2) # loading package GB2

# Parámetros:
a = 3.25
b = 17000
p = 0.8
q = 0.35

# Generamos una muestra gb2 de N datos:
simulados1 = rgb2(num_datos, a, b, p, q)
#print(simulados1)

# Graficamos histograma:
png('../plots/hist_GB2.png', width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
hist(simulados1,freq=F,main="Histograma de datos simulados \n Beta Generalizada de Tipo II",
     xlab="Datos",ylab="Frecuencia de datos",
     border="white", col="steelblue", breaks=breaks) 
#lines(density(simulados1, adjust=1.0), col="red", lwd=2)
dev.off() # Fin de guardado de imagen

# Guardamos como csv:
write.table(simulados1, file = "../csv/sim_GB2.csv", sep = ",")


#====== II. Lognormal:

# Parámetros:
mu = 11.04465
s  = 1.180168

# Generamos una muestra lnorm de N datos:
simulados2 = rlnorm(num_datos, mu, s)
#print(simulados2)

# Graficamos histograma:
png('../plots/hist_LNorm.png', width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
hist(simulados2,freq=F,main="Histograma de datos simulados \n LogNormal",
     xlab="Datos",ylab="Frecuencia de datos",
     border="white", col="steelblue", breaks=breaks) 
#lines(density(simulados2, adjust=1.0), col="red", lwd=2)
dev.off() # Fin de guardado de imagen

# Guardamos como csv:
write.table(simulados2, file = "../csv/sim_LNorm.csv", sep = ",")


#====== III. Mix-Lognormal 1:

# Parámetros:
mu1 = 11.04465
s1  = 1.180168
mu2 = 15.0
s2  = 0.7

# Generamos una muestra mezcla lnorm de N datos:
library(distr)
myMix = UnivarMixingDistribution(Lnorm(mean=mu1, sd=s1), 
                                 Lnorm(mean=mu2, sd=s2),
                                 mixCoeff=c(0.9, 0.1))
rmyMix = r(myMix)
simulados3 = rmyMix(num_datos)
#print(simulados3)

# Graficamos histograma:
png('../plots/hist_LNormMix.png', width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
hist(simulados3,freq=F,main="Histograma de datos simulados \n LogNormal",
     xlab="Datos",ylab="Frecuencia de datos",
     border="white", col="steelblue", breaks=breaks) 
#lines(density(simulados3, adjust=1.0), col="red", lwd=2)
dev.off() # Fin de guardado de imagen

# Guardamos como csv:
write.table(simulados3, file = "../csv/sim_LNormMix.csv", sep = ",")




