---
title: "Entrega 1"
author: "Grupo X"
date: "15 abril, 2021"
output: 
    html_document:
        keep_md: true
---




## Librerias


```r
library(tidyverse)
```

```
## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──
```

```
## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
## ✓ tibble  3.1.0     ✓ dplyr   1.0.5
## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
## ✓ readr   1.4.0     ✓ forcats 0.5.1
```

```
## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
```

```r
library(kableExtra)
```

```
## 
## Attaching package: 'kableExtra'
```

```
## The following object is masked from 'package:dplyr':
## 
##     group_rows
```

## Datos


```r
datos <- read_csv2("../data/raw/DAMASCO.csv")
```

```
## ℹ Using ',' as decimal and '.' as grouping mark. Use `read_delim()` for more control.
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   VAR = col_character(),
##   TAMFLOR = col_double(),
##   LONGPET = col_double(),
##   ANCHOPET = col_double(),
##   SUPHOJA = col_double(),
##   LONANCHO = col_double(),
##   PECLIMBO = col_double(),
##   PESOF = col_double(),
##   LONGF = col_double(),
##   ANCHOF = col_double(),
##   ESPESORF = col_double(),
##   PESOEND = col_double(),
##   LONGEND = col_double(),
##   ANCHOEND = col_double()
## )
```

Inspeccionamos con `str(datos)`


```r
str(datos)
```

```
## spec_tbl_df[,14] [18 × 14] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
##  $ VAR     : chr [1:18] "BLANCO" "BULIDA" "CURROT.T" "CANINO" ...
##  $ TAMFLOR : num [1:18] 33.3 26.8 28.8 27.5 33.9 ...
##  $ LONGPET : num [1:18] 13.9 13.4 12.7 12.3 14.4 ...
##  $ ANCHOPET: num [1:18] 18.3 15.9 15.4 14.3 16.4 ...
##  $ SUPHOJA : num [1:18] 44.1 36.7 51.7 36 39 ...
##  $ LONANCHO: num [1:18] 1.053 1.112 0.912 1.005 1.058 ...
##  $ PECLIMBO: num [1:18] 0.415 0.395 0.389 0.452 0.311 0.411 0.385 0.344 0.412 0.41 ...
##  $ PESOF   : num [1:18] 49.3 49 43 66.8 63.1 ...
##  $ LONGF   : num [1:18] 46.3 44.6 40.1 51.3 50.7 ...
##  $ ANCHOF  : num [1:18] 44.9 45.1 43.5 50.8 49.2 ...
##  $ ESPESORF: num [1:18] 45.4 43.4 43 49.1 46.8 ...
##  $ PESOEND : num [1:18] 4.31 2.57 1.62 3.42 3.34 3.46 1.88 2.58 1.52 1.2 ...
##  $ LONGEND : num [1:18] 31.1 25.3 20.1 23.8 29.1 ...
##  $ ANCHOEND: num [1:18] 24.2 20.3 17.6 21.2 22.9 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   VAR = col_character(),
##   ..   TAMFLOR = col_double(),
##   ..   LONGPET = col_double(),
##   ..   ANCHOPET = col_double(),
##   ..   SUPHOJA = col_double(),
##   ..   LONANCHO = col_double(),
##   ..   PECLIMBO = col_double(),
##   ..   PESOF = col_double(),
##   ..   LONGF = col_double(),
##   ..   ANCHOF = col_double(),
##   ..   ESPESORF = col_double(),
##   ..   PESOEND = col_double(),
##   ..   LONGEND = col_double(),
##   ..   ANCHOEND = col_double()
##   .. )
```


A. Cuáles son los valores de n y p ? Cuanto vale y que indica el valor $x_{32}$ ? Y el vector $x_6$ ?


El valor de $n$ es 18 y el valor de $p$ es 14. El
valor de $x_{32}$ es 28.84 e indica el tamano de la flor de la 
observacion 3. El vector $x_6$ indica la relacion entre el ancho y largo de la 
hoja.

B. Cómo clasificaría las variables sobre las que se está trabajando ?


Las variables con las que se esta trabajando son de tipo continuo en todos los 
casos. Mas aun, todas estan medidas en escala de intervalo.


C. Encuentre el vector de medias y matriz de varianzas-covariancias asociados a la tabla de datos ?



```r
datos %>% 
    select(-VAR) %>% 
    summarise_all(mean, na.rm=T) %>% 
    round(1) %>% 
    kableExtra::kable() %>% 
    kableExtra::kable_styling(font_size = 10) %>% 
    kableExtra::kable_classic_2()
```

<table class="table lightable-classic-2" style='font-size: 10px; margin-left: auto; margin-right: auto; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:right;"> TAMFLOR </th>
   <th style="text-align:right;"> LONGPET </th>
   <th style="text-align:right;"> ANCHOPET </th>
   <th style="text-align:right;"> SUPHOJA </th>
   <th style="text-align:right;"> LONANCHO </th>
   <th style="text-align:right;"> PECLIMBO </th>
   <th style="text-align:right;"> PESOF </th>
   <th style="text-align:right;"> LONGF </th>
   <th style="text-align:right;"> ANCHOF </th>
   <th style="text-align:right;"> ESPESORF </th>
   <th style="text-align:right;"> PESOEND </th>
   <th style="text-align:right;"> LONGEND </th>
   <th style="text-align:right;"> ANCHOEND </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 28.9 </td>
   <td style="text-align:right;"> 12.9 </td>
   <td style="text-align:right;"> 15.5 </td>
   <td style="text-align:right;"> 41 </td>
   <td style="text-align:right;"> 1 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 46.7 </td>
   <td style="text-align:right;"> 42 </td>
   <td style="text-align:right;"> 43.7 </td>
   <td style="text-align:right;"> 43.9 </td>
   <td style="text-align:right;"> 2.4 </td>
   <td style="text-align:right;"> 22 </td>
   <td style="text-align:right;"> 19.7 </td>
  </tr>
</tbody>
</table>



```r
datos %>% 
    select(-VAR) %>%  
    cov() %>%  
    round(1) %>% 
    kableExtra::kable() %>% 
    kableExtra::kable_styling(font_size = 10)%>% 
    kableExtra::kable_classic_2() 
```

<table class="table lightable-classic-2" style='font-size: 10px; margin-left: auto; margin-right: auto; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> TAMFLOR </th>
   <th style="text-align:right;"> LONGPET </th>
   <th style="text-align:right;"> ANCHOPET </th>
   <th style="text-align:right;"> SUPHOJA </th>
   <th style="text-align:right;"> LONANCHO </th>
   <th style="text-align:right;"> PECLIMBO </th>
   <th style="text-align:right;"> PESOF </th>
   <th style="text-align:right;"> LONGF </th>
   <th style="text-align:right;"> ANCHOF </th>
   <th style="text-align:right;"> ESPESORF </th>
   <th style="text-align:right;"> PESOEND </th>
   <th style="text-align:right;"> LONGEND </th>
   <th style="text-align:right;"> ANCHOEND </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> TAMFLOR </td>
   <td style="text-align:right;"> 9.9 </td>
   <td style="text-align:right;"> 2.2 </td>
   <td style="text-align:right;"> 4.1 </td>
   <td style="text-align:right;"> 2.2 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 15.2 </td>
   <td style="text-align:right;"> 10.0 </td>
   <td style="text-align:right;"> 6.1 </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 1.7 </td>
   <td style="text-align:right;"> 9.1 </td>
   <td style="text-align:right;"> 3.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGPET </td>
   <td style="text-align:right;"> 2.2 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 1.6 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 4.9 </td>
   <td style="text-align:right;"> 2.9 </td>
   <td style="text-align:right;"> 1.9 </td>
   <td style="text-align:right;"> 1.8 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 3.3 </td>
   <td style="text-align:right;"> 1.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOPET </td>
   <td style="text-align:right;"> 4.1 </td>
   <td style="text-align:right;"> 1.6 </td>
   <td style="text-align:right;"> 3.1 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 7.9 </td>
   <td style="text-align:right;"> 4.9 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> 5.3 </td>
   <td style="text-align:right;"> 2.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SUPHOJA </td>
   <td style="text-align:right;"> 2.2 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 32.6 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> -14.3 </td>
   <td style="text-align:right;"> -5.2 </td>
   <td style="text-align:right;"> -5.8 </td>
   <td style="text-align:right;"> -1.7 </td>
   <td style="text-align:right;"> -0.7 </td>
   <td style="text-align:right;"> -3.2 </td>
   <td style="text-align:right;"> -2.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONANCHO </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PECLIMBO </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PESOF </td>
   <td style="text-align:right;"> 15.2 </td>
   <td style="text-align:right;"> 4.9 </td>
   <td style="text-align:right;"> 7.9 </td>
   <td style="text-align:right;"> -14.3 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 144.4 </td>
   <td style="text-align:right;"> 67.5 </td>
   <td style="text-align:right;"> 57.5 </td>
   <td style="text-align:right;"> 49.7 </td>
   <td style="text-align:right;"> 7.5 </td>
   <td style="text-align:right;"> 35.0 </td>
   <td style="text-align:right;"> 19.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGF </td>
   <td style="text-align:right;"> 10.0 </td>
   <td style="text-align:right;"> 2.9 </td>
   <td style="text-align:right;"> 4.9 </td>
   <td style="text-align:right;"> -5.2 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 67.5 </td>
   <td style="text-align:right;"> 35.9 </td>
   <td style="text-align:right;"> 26.3 </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 20.7 </td>
   <td style="text-align:right;"> 10.8 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOF </td>
   <td style="text-align:right;"> 6.1 </td>
   <td style="text-align:right;"> 1.9 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> -5.8 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 57.5 </td>
   <td style="text-align:right;"> 26.3 </td>
   <td style="text-align:right;"> 23.6 </td>
   <td style="text-align:right;"> 19.9 </td>
   <td style="text-align:right;"> 3.1 </td>
   <td style="text-align:right;"> 14.5 </td>
   <td style="text-align:right;"> 7.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESPESORF </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 1.8 </td>
   <td style="text-align:right;"> 3.2 </td>
   <td style="text-align:right;"> -1.7 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 49.7 </td>
   <td style="text-align:right;"> 22.8 </td>
   <td style="text-align:right;"> 19.9 </td>
   <td style="text-align:right;"> 19.3 </td>
   <td style="text-align:right;"> 2.7 </td>
   <td style="text-align:right;"> 11.8 </td>
   <td style="text-align:right;"> 7.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PESOEND </td>
   <td style="text-align:right;"> 1.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 1.1 </td>
   <td style="text-align:right;"> -0.7 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 7.5 </td>
   <td style="text-align:right;"> 4.3 </td>
   <td style="text-align:right;"> 3.1 </td>
   <td style="text-align:right;"> 2.7 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 2.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGEND </td>
   <td style="text-align:right;"> 9.1 </td>
   <td style="text-align:right;"> 3.3 </td>
   <td style="text-align:right;"> 5.3 </td>
   <td style="text-align:right;"> -3.2 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 35.0 </td>
   <td style="text-align:right;"> 20.7 </td>
   <td style="text-align:right;"> 14.5 </td>
   <td style="text-align:right;"> 11.8 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 21.8 </td>
   <td style="text-align:right;"> 10.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOEND </td>
   <td style="text-align:right;"> 3.7 </td>
   <td style="text-align:right;"> 1.8 </td>
   <td style="text-align:right;"> 2.7 </td>
   <td style="text-align:right;"> -2.1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0 </td>
   <td style="text-align:right;"> 19.6 </td>
   <td style="text-align:right;"> 10.8 </td>
   <td style="text-align:right;"> 7.9 </td>
   <td style="text-align:right;"> 7.1 </td>
   <td style="text-align:right;"> 2.3 </td>
   <td style="text-align:right;"> 10.6 </td>
   <td style="text-align:right;"> 6.2 </td>
  </tr>
</tbody>
</table>

D. Podría decir cuál y cuáles variables son las más dispersas ?


    
    ```r
    datos %>% select(-VAR) %>%
    cov() %>%
    diag() %>% 
    which.max() %>% 
    names()
    ```
    
    ```
    ## [1] "PESOF"
    ```


```r
datos %>% select(-VAR) %>%
    cov() %>%
    diag() %>% 
    sort() %>% 
    names()
```

```
##  [1] "PECLIMBO" "LONANCHO" "LONGPET"  "PESOEND"  "ANCHOPET" "ANCHOEND"
##  [7] "TAMFLOR"  "ESPESORF" "LONGEND"  "ANCHOF"   "SUPHOJA"  "LONGF"   
## [13] "PESOF"
```
E. Estandarice las variables por media y desvío. Ahora puede responder al inciso (d) ?

Aca hay que calcular el coeficiente de variacion.


```r
# No utilizamos la primer columna
datos_std = scale(datos[-1])
```


```r
datos %>% select(-VAR) %>%
    mutate_all(scale) %>% 
    cov() %>%
    diag() %>% 
    sort()
```

```
##  LONGEND  LONGPET ANCHOPET  SUPHOJA  PESOEND  TAMFLOR LONANCHO PECLIMBO 
##        1        1        1        1        1        1        1        1 
##    LONGF   ANCHOF ESPESORF    PESOF ANCHOEND 
##        1        1        1        1        1
```

F. Halle la matriz de correlación. Que variables son las más relacionadas?


```r
datos %>% select(-VAR) %>%
    cor() %>% 
    round(1)  %>% 
    kableExtra::kable() %>% 
    kableExtra::kable_styling(font_size = 10)%>% 
    kableExtra::kable_classic_2()
```

<table class="table lightable-classic-2" style='font-size: 10px; margin-left: auto; margin-right: auto; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> TAMFLOR </th>
   <th style="text-align:right;"> LONGPET </th>
   <th style="text-align:right;"> ANCHOPET </th>
   <th style="text-align:right;"> SUPHOJA </th>
   <th style="text-align:right;"> LONANCHO </th>
   <th style="text-align:right;"> PECLIMBO </th>
   <th style="text-align:right;"> PESOF </th>
   <th style="text-align:right;"> LONGF </th>
   <th style="text-align:right;"> ANCHOF </th>
   <th style="text-align:right;"> ESPESORF </th>
   <th style="text-align:right;"> PESOEND </th>
   <th style="text-align:right;"> LONGEND </th>
   <th style="text-align:right;"> ANCHOEND </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> TAMFLOR </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.5 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGPET </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> -0.3 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOPET </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> SUPHOJA </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> -0.4 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> -0.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONANCHO </td>
   <td style="text-align:right;"> 0.2 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> -0.4 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> -0.3 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PECLIMBO </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.3 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> -0.3 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> -0.1 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PESOF </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGF </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOF </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> -0.2 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESPESORF </td>
   <td style="text-align:right;"> 0.3 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> PESOEND </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.1 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGEND </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> 0.0 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
   <td style="text-align:right;"> 0.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOEND </td>
   <td style="text-align:right;"> 0.5 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.4 </td>
   <td style="text-align:right;"> -0.1 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.7 </td>
   <td style="text-align:right;"> 0.6 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 0.9 </td>
   <td style="text-align:right;"> 1.0 </td>
  </tr>
</tbody>
</table>



```r
ncol_datos = ncol(datos)-1
datos %>% select(-VAR) %>%
    cor() %>% 
    as_tibble() %>% 
    mutate(var0=colnames(.)) %>% 
    pivot_longer(
        "TAMFLOR":"ANCHOEND", 
        names_to="var1", values_to="corr"
    ) %>% 
    filter(
        rep(
            1:ncol_datos,
            each=ncol_datos
        ) > 
            rep(
                1:ncol_datos,
                times=ncol_datos
            )
    ) %>% 
    arrange(-abs(corr)) %>% 
    head(10) %>% 
    kableExtra::kable() %>% 
    kableExtra::kable_styling(font_size = 10)%>% 
    kableExtra::kable_classic_2()
```

<table class="table lightable-classic-2" style='font-size: 10px; margin-left: auto; margin-right: auto; font-family: "Arial Narrow", "Source Sans Pro", sans-serif; margin-left: auto; margin-right: auto;'>
 <thead>
  <tr>
   <th style="text-align:left;"> var0 </th>
   <th style="text-align:left;"> var1 </th>
   <th style="text-align:right;"> corr </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> ANCHOF </td>
   <td style="text-align:left;"> PESOF </td>
   <td style="text-align:right;"> 0.9852213 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGEND </td>
   <td style="text-align:left;"> PESOEND </td>
   <td style="text-align:right;"> 0.9447408 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESPESORF </td>
   <td style="text-align:left;"> PESOF </td>
   <td style="text-align:right;"> 0.9412822 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> LONGF </td>
   <td style="text-align:left;"> PESOF </td>
   <td style="text-align:right;"> 0.9381432 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESPESORF </td>
   <td style="text-align:left;"> ANCHOF </td>
   <td style="text-align:right;"> 0.9327883 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOPET </td>
   <td style="text-align:left;"> LONGPET </td>
   <td style="text-align:right;"> 0.9175753 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOEND </td>
   <td style="text-align:left;"> PESOEND </td>
   <td style="text-align:right;"> 0.9121184 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOEND </td>
   <td style="text-align:left;"> LONGEND </td>
   <td style="text-align:right;"> 0.9088800 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ANCHOF </td>
   <td style="text-align:left;"> LONGF </td>
   <td style="text-align:right;"> 0.9037702 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> ESPESORF </td>
   <td style="text-align:left;"> LONGF </td>
   <td style="text-align:right;"> 0.8662107 </td>
  </tr>
</tbody>
</table>


G. Pueden dividirse las variables en subgrupos, de modo que las variables dentro de un mismo subgrupo tengan elevadas correlaciones entre sí y que las que se encuentren en subgrupos diferentes tengan bajas correlaciones ? Si es así, cuáles variables quedan en cada uno de los subgrupos ?


H. Encuentre la matriz que mide el grado de similaridad entre las variedades en función de la distancia euclídea calculada sobre los datos originales.

I. Podría decir cuales son los tres pares de variedades que presentan mayor semejanza ?


J. Repita lo realizado en el inciso (h) pero sobre las variables estandarizadas por media y desvío estándar.
Son las mimas las tres variedades más parecidas ? Comente al respecto
