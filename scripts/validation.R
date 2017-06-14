# Rodolfo Ferro Pérez
# ferro@cimat.mx
# Validar el modelo propuesto.

# Liberar memoria:
rm(list=ls())

# IMPORTANTE: Si utilizas RStudio, hay que definir el directorio de trabajo
# al de los archivos fuente, puedes ver el directorio actual con getwd()

# Breaks para histogramas:
breaks = 50

# Lista de archivos:
# "samp_GB2_200.csv"
# "samp_GB2_500.csv"
# "samp_LNorm_200.csv"
# "samp_LNorm_500.csv"
# "samp_LNormMix_200.csv"
# "samp_LNormMix_500.csv"
# "samp_RealData_200.csv"
# "samp_RealData_500.csv"

# Archivo en uso:
file_name = "samp_RealData_500.csv"
file_name = paste("../csv/", file_name, sep="")


# OBSERVACIÓN:
# Definición manual de parámetros para fits (checar correspondiente archivo fit):
a = 0.35
b = 2656.93
p = 6.03
q = 6.45


#================== Validar modelo: ==================#
library(GB2) # loading package GB2

# Leer datos simulados desde csv:
simulations = read.csv(file=file_name, header = TRUE, sep = ",")
#print(simulations[,1])


# I. Función de Distribución Empírica (FDE):
png('../plots/FDE.png', width=4, height=8, units="in", res=300) # Para iniciar el guardado de imagen
plotsML.gb2(simulations[,1], a, b, p, q, w=rep(1,length(simulations[,1])))[0]
dev.off() # Fin de guardado de imagen



# II. Gráfica cuantil-cuantil:
N = length(simulations[,1])
int = seq((1/(N+1)),(N/(N+1)),by=(1/(N+1)))
vec = qgb2(int, a, b, p, q)
png('../plots/QQ.png', width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
plot(sort(simulations[,1]),sort(vec),main="Cuantil-Cuantil (QQ)", col="navy", lwd=3)
abline(0,1,col="red",lwd="2")
dev.off() # Fin de guardado de imagen



# III. Densidad sobre histograma
png('../plots/histogram_density.png', width=4, height=4, units="in", res=300) # Para iniciar el guardado de imagen
hist(simulations[,1], freq=F,main="Histograma VS \n Densidad estimada",
     #xlab="Simulación",ylab="Frecuencia de tiempos",
     border="white", col="steelblue", breaks=breaks)
#lines(density(simulations[,1], adjust=0.8), col="red", lwd=1)
curve(dgb2(x, a, b, p, q), col="olivedrab3", add = T, lwd=2)
dev.off() # Fin de guardado de imagen


