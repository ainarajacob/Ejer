setwd("C://Users//ainar//OneDrive//Documentos//DATA SCIENCE//Ejer//Ejer")
library(readxl)
library(lubridate)
library(dplyr)

datos<- read_xlsx("online_retail_II.xlsx")

str(datos)

datos$InvoiceDate <- ymd_hms(datos$InvoiceDate)
datos$Invoice <- as.factor(datos$Invoice)

#Analisis
summary(datos)
head(datos)
str(datos)
class(datos)
length(datos)
dim(datos)

#Cuantos pedidos distintos hay
pedidos_distintos<- length(unique(datos$Invoice))


#Calcular el precio medio de producto por pedido
diez<- datos %>% 
  group_by(Invoice) %>% 
  summarize(media = mean(n()))
