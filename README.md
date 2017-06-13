
![Stochasticity](https://github.com/RodolfoFerro/ModeladoBetaGeneralizadaII/blob/master/logo.png)

# Modelado de datos con distribución Beta Generalizada de Tipo II

## Descripción general

El objetivo del proyecto es la simulación de variables aleatorias con algunas distribuciones para modelado de los datos con la distribución Beta Generalizada de Tipo II, así como la el modelado (con la misma distribución) de ciertos datos reales obtenidos del INEGI.

El presente repositorio contiene scripts en `R` para: (i) simular variables aleatorias con distribuciones _Beta Generalizada de Tipo II_, _Lognormal_ y mezcla de _Lognormales_; (ii) modelar las simulaciones y datos reales del INEGI; y (iii) validar los ajustes de modelo.

## Requerimientos


#### Además de tener R instalado, necesitarás instalar...


* [RStudio](https://www.rstudio.com) (recomendado)
* Librería [`GB2`](https://cran.r-project.org/web/packages/GB2/index.html)
* Librería [`distr`](https://cran.r-project.org/web/packages/distr/index.html)

Dichas librerías pueden fácilmente ser instaladas con el gestor de paquetes de


## Instrucciones

Para correr los scripts en el orden adecuado y obtener los resultados deseados, se anexa una descripción de cada script así como los pasos a seguir para correr el código.


### 1. [`simulations.R`]()

Este script crea las simulaciones con distribuciones _Beta Generalizada de Tipo II_ (![](https://latex.codecogs.com/svg.latex?a%3D3.25), \[b = 17000\], $p$ = 0.8, ![](https://latex.codecogs.com/gif.latex?q&space;=&space;0.35)), _Lognormal_ () y mezcla de _Lognormales_ ()

### 2. [`sampling.R`]()
