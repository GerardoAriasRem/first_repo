# Fecha: 29/01/2020
# Elaborado por: Eduard Fernando Martinez Gonzalez
# Nota: En este script no se incluyen acentos ni caracteres especiales para evitar conflictos con otros sistemas operativos.

#++++++++++++++++++++++++++++++++++++++++++++++++++#
# 1. Manejo de la biblioteca y gestion de paquetes #
#++++++++++++++++++++++++++++++++++++++++++++++++++#

### Paquetes instalados 
installed.packages()[,c(1,3,4)]

### Esta instalado un paquete? 
is.element("ggplot2",installed.packages()[,1])

### Instalar un paquete
install.packages("dplyr")

### Llamar el paquete
require('dplyr')
library('dplyr')

####  Que pasa cuando el paquete no esta instalado
library('rgdala')

### Como unload un paquete que no estoy usando
detach("package:dplyr", unload = TRUE)

### Older version 
require(devtools)
install_version("ggplot2", version = "3.3.2", repos = "http://cran.us.r-project.org")

### Cuantos paquetes hay disponibles en R?
available.packages()[,1:2]
nrow(available.packages())
is.element("dplyr",available.packages()[,1]) # Saber si un paquete existe
is.element("development",available.packages()[,1]) # Saber si un paquete existe
  
### Eliminar un paquetes 
remove.packages("dplyr") 

#+++++++++++++++++++++++++++#
# 2. Directorio de trabajo  # 
#+++++++++++++++++++++++++++#

# Limpiar memoria de R
list = ls() # Objetos en la memoria
rm() # Elinar objetos
rm(list = ls()) # Limipar todos los objetos en la memoria
cat("\f") # Limpiar la consoloa, tambien se puede hacer presionando las teclas ctrl + L)

# Fijar directorio de tabajo
getwd() # Obtener directorio de trabajo
setwd("~/dropbox/teaching/taller de r/github/clases/clase 2") # Establecer directorio de trabajo

# Inspeccionar directorio de trabajo
dir(".")    # Carpetas en el directorio
list.files(".") # Archivos en el directorio

#++++++++++++++++++++++++++++++#
# 3. Estructuras de datos en R #
#++++++++++++++++++++++++++++++#
"   ---------------------------------
    |  Homogeneos	 |  Heterogeneos  |
-------------------------------------
1d	|    Vector    |   Listas       |
2d	|    Matriz    |   Dataframe    |
nd	|    Array     |                |
-------------------------------------"

#------------#
## Vectores ##
#------------#

# Chracter
char_vec <- c("a","b","c","r","d","a","e","c","a","r","r")
char_vec

# Logicos
log_vec <- c(TRUE, FALSE, T, F)
log_vec

# Numericvos
1:10

# Otros
letras <- letters
letters
meses <- month.name
meses

### ¡Ojo! Los elementos no son homogeneos
vector2 <- c(1,2,"c")
str(vector2)

### Transformaciones a vectores
vector2 <- as.numeric(vector2) # Los elementos que no se pueden transformar en un n'umero se convierten en NA
str(vector2)

### Eliminar elementos de un vector
dbl_vec <- seq(from = 1 , to = 50, by = 2) # Explicar el help de seq
dbl_vec
dbl_vec[2] # Elemento numero 2
dbl_vec[1:0] # 10 primeros elementos
dbl_vec
dbl_vec <- dbl_vec[-1] # Eliminar el elemento de la posicion 1 del vector
dbl_vec
char_vec
char_vec <- char_vec[char_vec != "a"] # Dejar todos los elementos de char_vec diferentes de "a"
char_vec 
!char_vec %in% c("c","r")
char_vec <- char_vec[!char_vec %in% c("c","r")] # Eliminar todos los elementos de char_vec que sean diferentes de c y r
char_vec 

#------------#
## Matricez ##
#------------#

### Generemos una matriz de numeros aleatorios (de una distribucion normal)
matriz_normal <- matrix(rnorm(n = 25,mean = 100 ,sd = 10) , nrow = 5, ncol = 5) # Matriz de 5*5
matriz_normal # Ver la matriz sobre la consola
nrow(matriz_normal) # Numero de filas
ncol(matriz_normal) # Numero de columnas
rownames(matriz_normal)
colnames(matriz_normal)

### Cambiemos los nombres de las columnas en una matriz
colnames(matriz_normal)
colnames(matriz_normal) <- c("Columna 1","Columna 2","Columna 3","Columna 4","Columna 5")
colnames(matriz_normal)[2] = "Col 2"
matriz_normal
rownames(matriz_normal) # Cambien ustedes los nombres de las filas

### Elementos de una matriz
matriz_normal[1,2]
matriz_normal[,2]
matriz_normal[4,]
A <- matriz_normal[,3]
A

#--------------#
## Dataframes ##
#--------------#

### Generemos un dataframe
nota_numerica = seq(0,10,2)
nota_numerica
nota_alfabetica = c("a","b","b","a","c","b")
nota_alfabetica
dfm <- data.frame(nota_numerica,nota_alfabetica) # Creamos el dataframe

### Elementos de un dataframe
dfm 
dfm[3,1]
dfm[,2]


#----------#
## Listas ##
#----------#

### Crear y guardar objetos en una lista
lista <- list()
lista[[1]] <- dfm
lista[[2]] <- matriz_normal
lista[[3]] <- A

### Atributos de una lista
class(lista[[1]]) # Elemento 1
colnames(lista[[1]]) # Elemento 1
class(lista[[2]]) # Elemento 2
colnames(lista[[2]]) # Elemento 2
length(lista) # LArgo de la lista

### Ver elementos de una lista
lista
lista[[1]][,2]
lista[[1]][,2]





