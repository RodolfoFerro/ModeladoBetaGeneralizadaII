# Modelado de datos con distribución Beta Generalizada de Tipo II

![Stochasticity](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/logo.png)


##  Descripción general

El objetivo del proyecto es la simulación de variables aleatorias con algunas distribuciones para modelado de los datos con la distribución Beta Generalizada de Tipo II, así como la el modelado (con la misma distribución) de ciertos datos reales obtenidos del INEGI.

El presente repositorio contiene scripts en `R` para: (i) simular variables aleatorias con distribuciones _Beta Generalizada de Tipo II_, _Lognormal_ y mezcla de _Lognormales_; (ii) modelar las simulaciones y datos reales del INEGI; y (iii) validar los ajustes de modelo.


##  Requerimientos


#### Además de tener R instalado, necesitarás instalar...


* [RStudio](https://www.rstudio.com) (recomendado)
* Librería [`GB2`](https://cran.r-project.org/web/packages/GB2/index.html)
* Librería [`distr`](https://cran.r-project.org/web/packages/distr/index.html)

Dichas librerías pueden fácilmente ser instaladas con el gestor de paquetes de


## Instrucciones

Para correr los scripts en el orden adecuado y obtener los resultados deseados, se anexa una descripción de cada script así como los pasos a seguir para correr el código.



* ####  [`simulations.R`]()

Este script crea las simulaciones con distribuciones _Beta Generalizada de Tipo II_ (![](https://latex.codecogs.com/svg.latex?a=3.25,&space;b=17000,&space;p=0.8,&space;q=0.35)), _Lognormal_ (![](https://latex.codecogs.com/svg.latex?\mu=11.04465,&space;\sigma=1.180168)) y mezcla de _Lognormales_ (![](https://latex.codecogs.com/svg.latex?\mu_1=11.04465,&space;\sigma_1=1.180168); ![](https://latex.codecogs.com/svg.latex?\mu_1=15,&space;\sigma_2=0.7)).



* ####  [`sampling.R`]()

Este script muestrea a partir de las simulaciones y de los datos reales, guardando las muestras en archivos _csv_ para posterior apertura por el script que
