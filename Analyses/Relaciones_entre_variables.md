Encuesta: Relaciones entre variables
================
Juan Sebastian Cely
2023-07-17

# Variables y categorias

Tras el proceso de codificación, las variables de interés fueron
agrupadas en un nuevo data frame. A continuación se presentan dos
tablas. En la primera se encuentran las variables y una breve
descripción de cada una, y en la segunda se encuentran las variables,
cada una de sus categorías y la frecuencia correspondiente a cada
categoría.

| Código de la variable | Descripción de la variable                                 |
|:----------------------|:-----------------------------------------------------------|
| Zona                  | Zona de residencia                                         |
| sex                   | Sexo                                                       |
| age_r                 | Rango de edad                                              |
| strat                 | Estrato socioeconómico                                     |
| ethni                 | Pertenece a alguna etnia                                   |
| edu                   | Tiene estudios de educación superior                       |
| kids                  | Tiene hijos                                                |
| ideology              | Ideología política                                         |
| Internet              | Se informa a través de internet                            |
| trust_vote_inst       | Confía en las instituciones con cargos de elección popular |
| eco_anx               | Emociones frente al cambio climático                       |
| env_aso               | Se uniría a una organización ambiental                     |
| imp_sci               | Impacto de los científicos frente al cambio climático      |
| imp_ac                | Impacto de activistas frente al cambio climático           |
| imp_re                | Impacto de grupos religiosos frente al cambio climático    |
| imp_po                | Impacto de políticos frente al cambio climático            |
| thoughts              | Pensamientos frente al cambio climático                    |
| imp_com               | Impacto de acciones individuales en su comodidad           |
| imp_cli               | Impacto de acciones individuales en el cambio climático    |
| clim_origin           | Causa u origen del cambio climático                        |
| cont_clim             | Factor que más contribuye al cambio climático              |

| Variable        | Categoría                    | Frecuencia |
|:----------------|:-----------------------------|-----------:|
| Zona            | Municipios rurales dispersos |        210 |
| Zona            | Urbana ciudades              |       2010 |
| sex             | Hombre                       |       1115 |
| sex             | Mujer                        |       1105 |
| age_r           | De 18 a 20 años              |        412 |
| age_r           | De 21 a 24 años              |        524 |
| age_r           | De 25 a 29 años              |        651 |
| age_r           | De 30 a 32 años              |        633 |
| strat           | Bajo                         |       1097 |
| strat           | Medio                        |        929 |
| strat           | Alto                         |        194 |
| ethni           | No                           |       2035 |
| ethni           | Sí                           |        185 |
| edu             | No                           |       1811 |
| edu             | Sí                           |        409 |
| kids            | Sí                           |        935 |
| kids            | No                           |       1285 |
| ideology        | Derecha                      |        423 |
| ideology        | Centro                       |       1249 |
| ideology        | Izquierda                    |        548 |
| Internet        | No                           |        475 |
| Internet        | Sí                           |       1745 |
| trust_vote_inst | No                           |       1711 |
| trust_vote_inst | Sí                           |        509 |
| eco_anx         | Negativas                    |       1581 |
| eco_anx         | Ambivalentes/Neutrales       |        385 |
| eco_anx         | Positivas                    |        254 |
| env_aso         | Sí                           |       1274 |
| env_aso         | No                           |        946 |
| imp_sci         | Negativo                     |        753 |
| imp_sci         | Positivo                     |       1467 |
| imp_ac          | Negativo                     |       1178 |
| imp_ac          | Positivo                     |       1042 |
| imp_re          | Negativo                     |       1349 |
| imp_re          | Positivo                     |        871 |
| imp_po          | Negativo                     |       1589 |
| imp_po          | Positivo                     |        631 |
| thoughts        | Negativos                    |       1125 |
| thoughts        | Ambivalentes/Neutrales       |        951 |
| thoughts        | Positivos                    |        144 |
| imp_com         | Negativo                     |        461 |
| imp_com         | Positivo                     |       1759 |
| imp_cl          | Negativo                     |        249 |
| imp_cl          | Positivo                     |       1971 |
| clim_origin     | Correcta                     |       1053 |
| clim_origin     | Incorrecta                   |       1167 |
| cont_clim       | Correcta                     |        744 |
| cont_clim       | Incorrecta                   |       1476 |

# Análisis de correspondencia múltiple

Teniendo un conjunto de variables de categóricas provenientes de la
encuesta se procedió a realizar un análisis de componentes múltiples.
Esto con el propósito de explorar las posibles agrupaciones de
individuos y las relaciones entre las variables y cada una de sus
categorias.

## Análisis con todas las variables como variables activas en la conformación de las dimensiones

Los datos no son muy claros, la ausencia de una o dos dimensiones
dominantes con un gran porcentaje de varianza explicada sugiere que no
hay un único patrón que domine los datos. En cambio, la variación se
distribuye en múltiples dimensiones, cada una capturando una parte
relativamente pequeña de la varianza total. Es positivo que el análisis
parece mostrar que no hay sesgos grandes o evidentes en los datos. Esto
se evidencia por un lado en la ausencia de clusters de individuos
separados del resto que estén siendo influenciados por una variable
particular. Tampoco se observan asociaciones inusuales entre categorías
de las variables como podría ser una cercanía entre la categoría de
estrato alto y un nivel inferior de educación formal obtenida.

Aunque no muy claras, es posible ver posibles asociaciones entre
categorías que pueden ser de interés. Especialmente, relaciones que
incluyan a las variables relacionadas con el conocimiento sobre el
origen del cambio climático y las emociones frente al cambio climático.
Así, resulta interesante trazar una diagonal imaginaria que va desde la
esquina inferior izquierda hacia la esquina superior derecha. Esta
diagonal separa individuos que no parecen presentar preocupación por el
cambio climático, y que no entienden bien su origen y lo que podemos
hacer frente a él, de aquellos que sienten preocupación por este
fenomeno al entender su origen en la actividad humana, y que consideran
que es posible hacer algo frente a él de manera individual. Así, la
variabilidad entre individuos puede entenderse en cierta medida a partir
de esta diagonal. Algunas pocas variables demográficas podrían hacer
parte de estos dos perfiles aunque no es muy marcado ni clara su
contribución. Por ejemplo, se puede observar que el tener o no hijos
también podría estar contribuyendo a la distinción entre estos dos
perfiles. Individuos sin hijos parecen estar mejor informados sobre el
cambio climático y presentar pensamientos y emociones negativas frente a
este. En general, las variables demográficas parecen contribuir a una
dimensión distinta a aquellas ligadas con opiniones y percepciones
frente al cambio climático, por lo que posiblemente no estén asociadas a
estas opiniones y percepciones.

<img src="./figuresanálisis de componentes múltiples-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-2.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-3.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-8.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-9.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-10.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.238940291 1.077748e-133
    ## imp_re          0.236509201 3.722030e-132
    ## clim_origin     0.225025633 5.912636e-125
    ## env_aso         0.160016720  4.384782e-86
    ## imp_com         0.146046808  4.035593e-78
    ## Internet        0.137685413  2.049025e-73
    ## imp_cl          0.128821770  1.783533e-68
    ## thoughts        0.121513913  4.267007e-63
    ## eco_anx         0.110292302  5.504091e-57
    ## kids            0.107085565  1.447258e-56
    ## age_r           0.110169660  8.508718e-56
    ## trust_vote_inst 0.102904009  2.626411e-54
    ## imp_ac          0.063515198  1.655569e-33
    ## cont_clim       0.060881270  3.808365e-32
    ## ideology        0.037622891  3.453407e-19
    ## Zona            0.034763742  8.161463e-19
    ## strat           0.017610517  2.795674e-09
    ## imp_sci         0.013126349  6.198244e-08
    ## edu             0.008222246  1.878962e-05
    ## ethni           0.003412659  5.900261e-03
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                             Estimate       p.value
    ## imp_po=imp_po_Positivo                    0.16994491 1.077748e-133
    ## imp_re=imp_re_Positivo                    0.15618850 3.722030e-132
    ## clim_origin=clim_origin_Incorrecta        0.14897263 5.912636e-125
    ## env_aso=env_aso_No                        0.12685059  4.384782e-86
    ## imp_com=imp_com_Negativo                  0.14774158  4.035593e-78
    ## Internet=Internet_No                      0.14188600  2.049025e-73
    ## imp_cl=imp_cl_Negativo                    0.17835765  1.783533e-68
    ## kids=kids_Sí                              0.10393174  1.447258e-56
    ## trust_vote_inst=trust_vote_inst_Sí        0.11966643  2.626411e-54
    ## eco_anx=eco_anx_Positivas                 0.13706873  4.387834e-36
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.03242075  6.673416e-36
    ## imp_ac=imp_ac_Positivo                    0.07919038  1.655569e-33
    ## cont_clim=cont_clim_Incorrecta            0.08196950  3.808365e-32
    ## age_r=De 30 a 32 años                     0.12908133  1.228784e-26
    ## Zona=Municipios rurales dispersos         0.09990694  8.161463e-19
    ## thoughts=thoughts_Positivos               0.13488098  4.318891e-15
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.01732887  5.633625e-14
    ## age_r=De 25 a 29 años                     0.07649488  1.259642e-08
    ## imp_sci=imp_sci_Positivo                  0.03794893  6.198244e-08
    ## strat=Bajo                                0.01957679  2.381462e-06
    ## ideology=Derecha                          0.06754579  6.320509e-06
    ## edu=edu_No                                0.03667874  1.878962e-05
    ## ideology=Centro                           0.03010707  3.130259e-05
    ## ethni=ethni_Sí                            0.03314503  5.900261e-03
    ## strat=Alto                                0.04113225  1.326114e-02
    ## ethni=ethni_No                           -0.03314503  5.900261e-03
    ## edu=edu_Sí                               -0.03667874  1.878962e-05
    ## imp_sci=imp_sci_Negativo                 -0.03794893  6.198244e-08
    ## strat=Medio                              -0.06070904  5.181485e-10
    ## age_r=De 21 a 24 años                    -0.06389983  6.892780e-12
    ## Zona=Urbana ciudades                     -0.09990694  8.161463e-19
    ## ideology=Izquierda                       -0.09765285  3.104437e-19
    ## age_r=De 18 a 20 años                    -0.14167638  3.711151e-31
    ## cont_clim=cont_clim_Correcta             -0.08196950  3.808365e-32
    ## imp_ac=imp_ac_Negativo                   -0.07919038  1.655569e-33
    ## eco_anx=eco_anx_Negativas                -0.15439759  7.093861e-53
    ## trust_vote_inst=trust_vote_inst_No       -0.11966643  2.626411e-54
    ## kids=kids_No                             -0.10393174  1.447258e-56
    ## thoughts=thoughts_Negativos              -0.16730173  3.830387e-61
    ## imp_cl=imp_cl_Positivo                   -0.17835765  1.783533e-68
    ## Internet=Internet_Sí                     -0.14188600  2.049025e-73
    ## imp_com=imp_com_Positivo                 -0.14774158  4.035593e-78
    ## env_aso=env_aso_Sí                       -0.12685059  4.384782e-86
    ## clim_origin=clim_origin_Correcta         -0.14897263 5.912636e-125
    ## imp_re=imp_re_Negativo                   -0.15618850 3.722030e-132
    ## imp_po=imp_po_Negativo                   -0.16994491 1.077748e-133
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_ac          0.302835619 5.579355e-176
    ## imp_sci         0.262286805 1.014537e-148
    ## imp_re          0.243558533 1.249805e-136
    ## imp_cl          0.211202881 1.996953e-116
    ## imp_po          0.200588245 5.616931e-110
    ## imp_com         0.181258068  1.900826e-98
    ## strat           0.075556423  1.508113e-38
    ## ideology        0.064659758  6.604247e-33
    ## clim_origin     0.057722089  1.620410e-30
    ## ethni           0.048702211  6.829356e-26
    ## Zona            0.044722894  7.295140e-24
    ## edu             0.043201868  4.331745e-23
    ## env_aso         0.034835210  7.510535e-19
    ## Internet        0.013662244  3.330252e-08
    ## kids            0.012959548  7.521058e-08
    ## age_r           0.013824776  9.113368e-07
    ## trust_vote_inst 0.009538927  4.022475e-06
    ## eco_anx         0.011000378  4.730480e-06
    ## cont_clim       0.002158872  2.858434e-02
    ## thoughts        0.002773621  4.601303e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_ac=imp_ac_Negativo              0.16307537 5.579355e-176
    ## imp_sci=imp_sci_Negativo            0.15998051 1.014537e-148
    ## imp_re=imp_re_Negativo              0.14947826 1.249805e-136
    ## imp_cl=imp_cl_Negativo              0.21537651 1.996953e-116
    ## imp_po=imp_po_Negativo              0.14684783 5.616931e-110
    ## imp_com=imp_com_Negativo            0.15522322  1.900826e-98
    ## strat=Bajo                          0.12380442  9.378524e-36
    ## clim_origin=clim_origin_Incorrecta  0.07115621  1.620410e-30
    ## ethni=ethni_Sí                      0.11808580  6.829356e-26
    ## Zona=Municipios rurales dispersos   0.10686825  7.295140e-24
    ## edu=edu_No                          0.07929062  4.331745e-23
    ## env_aso=env_aso_No                  0.05581749  7.510535e-19
    ## ideology=Izquierda                  0.09727933  1.434943e-13
    ## Internet=Internet_No                0.04215100  3.330252e-08
    ## kids=kids_Sí                        0.03409800  7.521058e-08
    ## eco_anx=eco_anx_Positivas           0.06364816  7.786216e-07
    ## trust_vote_inst=trust_vote_inst_No  0.03436033  4.022475e-06
    ## age_r=De 25 a 29 años               0.03916185  3.826569e-05
    ## ideology=Centro                     0.03006560  1.545807e-02
    ## thoughts=thoughts_Positivos         0.03940135  1.945192e-02
    ## cont_clim=cont_clim_Incorrecta      0.01455711  2.858434e-02
    ## cont_clim=cont_clim_Correcta       -0.01455711  2.858434e-02
    ## eco_anx=eco_anx_Negativas          -0.03470274  2.131417e-03
    ## trust_vote_inst=trust_vote_inst_Sí -0.03436033  4.022475e-06
    ## age_r=De 30 a 32 años              -0.05046418  5.846209e-07
    ## kids=kids_No                       -0.03409800  7.521058e-08
    ## Internet=Internet_Sí               -0.04215100  3.330252e-08
    ## strat=Alto                         -0.11019974  9.935255e-15
    ## strat=Medio                        -0.01360468  5.992615e-16
    ## env_aso=env_aso_Sí                 -0.05581749  7.510535e-19
    ## edu=edu_Sí                         -0.07929062  4.331745e-23
    ## Zona=Urbana ciudades               -0.10686825  7.295140e-24
    ## ethni=ethni_No                     -0.11808580  6.829356e-26
    ## ideology=Derecha                   -0.12734493  1.578730e-29
    ## clim_origin=clim_origin_Correcta   -0.07115621  1.620410e-30
    ## imp_com=imp_com_Positivo           -0.15522322  1.900826e-98
    ## imp_po=imp_po_Positivo             -0.14684783 5.616931e-110
    ## imp_cl=imp_cl_Positivo             -0.21537651 1.996953e-116
    ## imp_re=imp_re_Positivo             -0.14947826 1.249805e-136
    ## imp_sci=imp_sci_Positivo           -0.15998051 1.014537e-148
    ## imp_ac=imp_ac_Positivo             -0.16307537 5.579355e-176

## Análisis con las variables sociodemográficas como variables suplementarias

Para ver de forma más clara si las variables demográficas podrían estar
relacionadas con las dimensiones de variabilidad observadas, estas no
fueron incluidas como variables activas en la construcción de las
dimensiones, sino como variables suplementarias. Al interpretar el
análisis se encuentra que algunas variables demográficas pueden estar
relacionadas con algunas de las dimensiones obtenidas, pero no con las
variables de mayor interés relacionadas con el cambio climático.
<img src="./figuresanálisis de componentes múltiples 2-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-2.png" width="80%" />

    ## Warning: ggrepel: 15 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-3.png" width="80%" />

    ## Warning: ggrepel: 8 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-8.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-9.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-10.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.323927792 8.622002e-191
    ## imp_re          0.286820275 4.980790e-165
    ## clim_origin     0.249704910 1.452161e-140
    ## imp_com         0.152250228  1.217328e-81
    ## env_aso         0.141652744  1.214543e-75
    ## imp_cl          0.132834199  1.050178e-70
    ## imp_ac          0.120941765  3.997438e-64
    ## Internet        0.116587098  9.765629e-62
    ## thoughts        0.112033569  6.274418e-58
    ## eco_anx         0.106034565  1.094022e-54
    ## trust_vote_inst 0.099191722  2.607416e-52
    ## cont_clim       0.061819165  1.248017e-32
    ## imp_sci         0.043412502  3.385222e-23
    ## ideology        0.012528581  8.520130e-07
    ## age_r           0.013231820  1.737727e-06
    ## Zona            0.009259986  5.572529e-06
    ## kids            0.006102774  2.292955e-04
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## imp_po=imp_po_Positivo                    0.244177271 8.622002e-191
    ## imp_re=imp_re_Positivo                    0.212249966 4.980790e-165
    ## clim_origin=clim_origin_Incorrecta        0.193651866 1.452161e-140
    ## imp_com=imp_com_Negativo                  0.186145847  1.217328e-81
    ## env_aso=env_aso_No                        0.147278710  1.214543e-75
    ## imp_cl=imp_cl_Negativo                    0.223495984  1.050178e-70
    ## imp_ac=imp_ac_Positivo                    0.134846415  3.997438e-64
    ## Internet=Internet_No                      0.161115931  9.765629e-62
    ## trust_vote_inst=trust_vote_inst_Sí        0.144981162  2.607416e-52
    ## eco_anx=eco_anx_Positivas                 0.179130335  5.097884e-38
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.036644917  1.107184e-32
    ## cont_clim=cont_clim_Incorrecta            0.101927103  1.248017e-32
    ## imp_sci=imp_sci_Positivo                  0.085163328  3.385222e-23
    ## thoughts=thoughts_Positivos               0.162325565  2.130643e-14
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.005757895  8.466618e-11
    ## Zona=Municipios rurales dispersos         0.063629022  5.572529e-06
    ## kids=kids_Sí                              0.030617098  2.292955e-04
    ## age_r=De 30 a 32 años                     0.047134574  2.577541e-03
    ## ideology=Centro                           0.024636836  7.471985e-03
    ## age_r=De 25 a 29 años                     0.041253136  9.000641e-03
    ## ideology=Derecha                          0.044610174  2.013013e-02
    ## strat=Alto                                0.044954154  2.112569e-02
    ## age_r=De 21 a 24 años                    -0.023431596  3.370732e-02
    ## kids=kids_No                             -0.030617098  2.292955e-04
    ## age_r=De 18 a 20 años                    -0.064956114  2.203004e-05
    ## Zona=Urbana ciudades                     -0.063629022  5.572529e-06
    ## ideology=Izquierda                       -0.069247010  1.925495e-07
    ## imp_sci=imp_sci_Negativo                 -0.085163328  3.385222e-23
    ## cont_clim=cont_clim_Correcta             -0.101927103  1.248017e-32
    ## eco_anx=eco_anx_Negativas                -0.184888230  1.429437e-48
    ## trust_vote_inst=trust_vote_inst_No       -0.144981162  2.607416e-52
    ## thoughts=thoughts_Negativos              -0.198970482  4.985964e-56
    ## Internet=Internet_Sí                     -0.161115931  9.765629e-62
    ## imp_ac=imp_ac_Negativo                   -0.134846415  3.997438e-64
    ## imp_cl=imp_cl_Positivo                   -0.223495984  1.050178e-70
    ## env_aso=env_aso_Sí                       -0.147278710  1.214543e-75
    ## imp_com=imp_com_Positivo                 -0.186145847  1.217328e-81
    ## clim_origin=clim_origin_Correcta         -0.193651866 1.452161e-140
    ## imp_re=imp_re_Negativo                   -0.212249966 4.980790e-165
    ## imp_po=imp_po_Negativo                   -0.244177271 8.622002e-191
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                      R2       p.value
    ## imp_cl      0.342363120 4.054562e-204
    ## imp_com     0.309125588 2.382416e-180
    ## imp_ac      0.293055093 2.907786e-169
    ## imp_re      0.228452042 4.308634e-127
    ## imp_sci     0.227498792 1.697991e-126
    ## imp_po      0.157543243  1.152070e-84
    ## clim_origin 0.115471401  3.977967e-61
    ## env_aso     0.031553452  3.400001e-17
    ## eco_anx     0.023169222  5.184810e-12
    ## ethni       0.010865983  8.561509e-07
    ## ideology    0.008526314  7.545741e-05
    ## Internet    0.006922350  8.681854e-05
    ## cont_clim   0.005043594  8.124945e-04
    ## Zona        0.003564199  4.895265e-03
    ## kids        0.003472818  5.478276e-03
    ## thoughts    0.004058158  1.102466e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_cl=imp_cl_Negativo              0.33959171 4.054562e-204
    ## imp_com=imp_com_Negativo            0.25103870 2.382416e-180
    ## imp_ac=imp_ac_Negativo              0.19866653 2.907786e-169
    ## imp_re=imp_re_Negativo              0.17928298 4.308634e-127
    ## imp_sci=imp_sci_Negativo            0.18451581 1.697991e-126
    ## imp_po=imp_po_Negativo              0.16116838  1.152070e-84
    ## clim_origin=clim_origin_Incorrecta  0.12463620  3.977967e-61
    ## env_aso=env_aso_No                  0.06578846  3.400001e-17
    ## eco_anx=eco_anx_Positivas           0.11508819  5.999295e-13
    ## ethni=ethni_Sí                      0.06907534  8.561509e-07
    ## Internet=Internet_No                0.03715685  8.681854e-05
    ## cont_clim=cont_clim_Incorrecta      0.02755478  8.124945e-04
    ## thoughts=thoughts_Positivos         0.06145966  3.332176e-03
    ## Zona=Municipios rurales dispersos   0.03736198  4.895265e-03
    ## kids=kids_Sí                        0.02185950  5.478276e-03
    ## kids=kids_No                       -0.02185950  5.478276e-03
    ## Zona=Urbana ciudades               -0.03736198  4.895265e-03
    ## cont_clim=cont_clim_Correcta       -0.02755478  8.124945e-04
    ## Internet=Internet_Sí               -0.03715685  8.681854e-05
    ## ideology=Derecha                   -0.05836935  1.677809e-05
    ## eco_anx=eco_anx_Negativas          -0.06132819  1.322554e-05
    ## ethni=ethni_No                     -0.06907534  8.561509e-07
    ## env_aso=env_aso_Sí                 -0.06578846  3.400001e-17
    ## clim_origin=clim_origin_Correcta   -0.12463620  3.977967e-61
    ## imp_po=imp_po_Positivo             -0.16116838  1.152070e-84
    ## imp_sci=imp_sci_Positivo           -0.18451581 1.697991e-126
    ## imp_re=imp_re_Positivo             -0.17928298 4.308634e-127
    ## imp_ac=imp_ac_Positivo             -0.19866653 2.907786e-169
    ## imp_com=imp_com_Positivo           -0.25103870 2.382416e-180
    ## imp_cl=imp_cl_Positivo             -0.33959171 4.054562e-204

## Conclusión del Análisis de correspondencia múltiple

En general, el análisis permite establecer que no hay sesgos en la
muestra, pero tampoco hay claridad en las relaciones entre las variables
y en los perfiles de los individuos. Sin embargo, considerando las
principales variables de interés, vale la pena explorar asociaciones
entre estas y otras variables partiendo de las sútiles pero interesantes
relaciones entre categorias observadas en los gráficos.

# Exploración visual de relaciones entre las variables de interés y otras variables

Partiendo de lo observado en el MCA se decidió explorar en gráficos
separados las relaciones entre las variables que podrían estar
asociadas.

|            | Negativas | Ambivalentes/Neutrales | Positivas |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      35.8 |                    7.7 |       3.9 |
| Incorrecta |      35.5 |                    9.6 |       7.5 |

<img src="./figuresrelación origen cambio climatico y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|                        | Negativas | Ambivalentes/Neutrales | Positivas |
|------------------------|----------:|-----------------------:|----------:|
| Negativos              |      41.5 |                    6.4 |       2.8 |
| Ambivalentes/Neutrales |      27.3 |                    9.6 |       5.9 |
| Positivos              |       2.4 |                    1.3 |       2.7 |

<img src="./figuresrelación pensamientos y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|           | Negativas | Ambivalentes/Neutrales | Positivas |
|-----------|----------:|-----------------------:|----------:|
| Derecha   |      12.3 |                    4.1 |       2.7 |
| Centro    |      39.8 |                   10.0 |       6.5 |
| Izquierda |      19.2 |                    3.3 |       2.2 |

<img src="./figuresrelación ideologia y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| -3  |       0.1 |                    0.1 |       0.0 |
| -2  |       1.0 |                    0.1 |       0.1 |
| -1  |       6.8 |                    1.6 |       1.4 |
| 1   |      18.3 |                    4.6 |       3.4 |
| 2   |      21.5 |                    6.2 |       3.9 |
| 3   |      23.5 |                    4.7 |       2.7 |

<img src="./figuresrelación impacto accion individual y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| -3  |       0.3 |                    0.1 |       0.0 |
| -2  |       2.0 |                    0.3 |       0.3 |
| -1  |      11.4 |                    3.5 |       2.8 |
| 1   |      32.0 |                    7.6 |       5.4 |
| 2   |      18.1 |                    4.7 |       2.2 |
| 3   |       7.3 |                    1.1 |       0.7 |

<img src="./figuresrelación impacto en la comodidad y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| Sí  |      42.7 |                    9.3 |       5.3 |
| No  |      28.5 |                    8.0 |       6.1 |

<img src="./figuresrelación unirse organizaciones ambientales y eco ansiedad-1.png" width="80%" style="display: block; margin: auto;" />

|            | Negativas | Ambivalentes/Neutrales | Positivas |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      24.6 |                    5.9 |       3.0 |
| Incorrecta |      46.6 |                   11.4 |       8.5 |

<img src="./figuresrelación contribucion al cambio climatico y eco ansiedad-1.png" width="80%" style="display: block; margin: auto;" />

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| No  |      14.1 |                    4.2 |       3.2 |
| Sí  |      57.2 |                   13.2 |       8.3 |

<img src="./figuresrelación internet y eco ansiedad-1.png" width="80%" style="display: block; margin: auto;" />

|            | Básica Primaria | Básica Secundaria | Secundaria Completa | Técnico o Tecnólogo | Pregrado | Posgrado |
|------------|----------------:|------------------:|--------------------:|--------------------:|---------:|---------:|
| Correcta   |             0.9 |               3.2 |                22.0 |                13.2 |      7.1 |      1.0 |
| Incorrecta |             1.6 |               4.2 |                23.6 |                12.8 |      8.5 |      1.8 |

<img src="./figuresrelación origen cambio climatico y educacion-1.png" width="80%" style="display: block; margin: auto;" />

|            | De 18 a 20 años | De 21 a 24 años | De 25 a 29 años | De 30 a 32 años |
|------------|----------------:|----------------:|----------------:|----------------:|
| Correcta   |            10.0 |            11.3 |            12.2 |            14.0 |
| Incorrecta |             8.6 |            12.3 |            17.1 |            14.5 |

<img src="./figuresrelación origen cambio climatico y edad-1.png" width="80%" style="display: block; margin: auto;" />

|            |  -3 |  -2 |  -1 |    1 |    2 |    3 |
|------------|----:|----:|----:|-----:|-----:|-----:|
| Correcta   | 0.1 | 0.2 | 1.3 |  8.4 | 16.6 | 20.8 |
| Incorrecta | 0.1 | 0.9 | 8.5 | 17.9 | 15.0 | 10.1 |

<img src="./figuresrelación origen cambio climatico e impacto individual-1.png" width="80%" style="display: block; margin: auto;" />

|            |  -3 |  -2 |   -1 |    1 |    2 |   3 |
|------------|----:|----:|-----:|-----:|-----:|----:|
| Correcta   | 0.2 | 0.5 |  5.1 | 19.7 | 15.6 | 6.3 |
| Incorrecta | 0.3 | 2.0 | 12.6 | 25.4 |  9.4 | 2.9 |

<img src="./figuresrelación origen cambio climatico e impacto en la comodidad-1.png" width="80%" style="display: block; margin: auto;" />

|            |   Sí |   No |
|------------|-----:|-----:|
| Correcta   | 31.0 | 16.4 |
| Incorrecta | 26.4 | 26.2 |

<img src="./figuresrelación origen cambio climatico y unirse organizaciones ambientales-1.png" width="80%" style="display: block; margin: auto;" />

|            | Negativos | Ambivalentes/Neutrales | Positivos |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      26.6 |                   18.0 |       2.8 |
| Incorrecta |      24.1 |                   24.9 |       3.6 |

<img src="./figuresrelación origen cambio climatico y pensamientos sobre cambio climatico-1.png" width="80%" style="display: block; margin: auto;" />

|            |   No |   Sí |
|------------|-----:|-----:|
| Correcta   |  7.2 | 40.3 |
| Incorrecta | 14.2 | 38.3 |

<img src="./figuresrelación origen cambio climatico y redes sociales-1.png" width="80%" style="display: block; margin: auto;" />

# Tests de chi-cuadrado

Se realizaron múltiples test de chi-cuadrado para establecer si existen
relaciones significativas entre las principales variables de interés y
las demás variables. Dado el alto número de tests se utilizó la
corrección propuesta por Benjamini y Hochberg.

## Tests para la variable origen del cambio climático

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Variable age_r is significantly associated with clim_origin with adjusted p-value: 0.001453519 
    ## Variable estrato is significantly associated with clim_origin with adjusted p-value: 0.01884656 
    ## Variable etnia is significantly associated with clim_origin with adjusted p-value: 0.01236785 
    ## Variable ideology is significantly associated with clim_origin with adjusted p-value: 0.004220962 
    ## Variable Internet is significantly associated with clim_origin with adjusted p-value: 2.068288e-11 
    ## Variable trust_vote_inst is significantly associated with clim_origin with adjusted p-value: 6.568142e-06 
    ## Variable eco_anx is significantly associated with clim_origin with adjusted p-value: 1.130156e-05 
    ## Variable env_aso is significantly associated with clim_origin with adjusted p-value: 2.137599e-12 
    ## Variable imp_scien is significantly associated with clim_origin with adjusted p-value: 6.048624e-33 
    ## Variable imp_act is significantly associated with clim_origin with adjusted p-value: 1.442057e-07 
    ## Variable imp_rel is significantly associated with clim_origin with adjusted p-value: 3.956478e-20 
    ## Variable imp_pol is significantly associated with clim_origin with adjusted p-value: 1.965114e-25 
    ## Variable thoughts is significantly associated with clim_origin with adjusted p-value: 1.118072e-05 
    ## Variable imp_como is significantly associated with clim_origin with adjusted p-value: 1.831613e-32 
    ## Variable imp_cli is significantly associated with clim_origin with adjusted p-value: 1.675852e-57 
    ## Variable no_car is significantly associated with clim_origin with adjusted p-value: 6.98691e-33 
    ## Variable one_fw_ch is significantly associated with clim_origin with adjusted p-value: 7.641959e-23 
    ## Variable veg is significantly associated with clim_origin with adjusted p-value: 1.732633e-29 
    ## Variable only_bk_wk is significantly associated with clim_origin with adjusted p-value: 2.393742e-42 
    ## Variable cont_clim is significantly associated with clim_origin with adjusted p-value: 0.0001348859

## Tests para la variable emociones frente al cambio climático

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Variable edu is significantly associated with eco_anx with adjusted p-value: 0.02805863 
    ## Variable ideology is significantly associated with eco_anx with adjusted p-value: 0.001282594 
    ## Variable Internet is significantly associated with eco_anx with adjusted p-value: 0.02027504 
    ## Variable trust_vote_inst is significantly associated with eco_anx with adjusted p-value: 7.044676e-05 
    ## Variable env_aso is significantly associated with eco_anx with adjusted p-value: 0.0004741051 
    ## Variable imp_rel is significantly associated with eco_anx with adjusted p-value: 0.02895086 
    ## Variable thoughts is significantly associated with eco_anx with adjusted p-value: 7.860687e-49 
    ## Variable imp_como is significantly associated with eco_anx with adjusted p-value: 0.008412295 
    ## Variable no_car is significantly associated with eco_anx with adjusted p-value: 0.04922477 
    ## Variable one_fw_ch is significantly associated with eco_anx with adjusted p-value: 0.02678232 
    ## Variable veg is significantly associated with eco_anx with adjusted p-value: 0.007238619 
    ## Variable clim_origin is significantly associated with eco_anx with adjusted p-value: 7.044676e-05 
    ## Variable cont_clim is significantly associated with eco_anx with adjusted p-value: 0.04922477

# Calculo de multiples Cramér’s V

Se calcularon los tamaños del efecto de las distintas asociaciones entre
las principales variables de interés y las demás variables. La medida
del tamaño del efecto utilizada fue Cramér’s V.

## Valores para la variable origen del cambio climático

    ## $Zona
    ## [1] 0.01592219
    ## 
    ## $sex
    ## [1] 0
    ## 
    ## $age_r
    ## [1] 0.07738864
    ## 
    ## $estrato
    ## [1] 0.06397857
    ## 
    ## $etnia
    ## [1] 0.06791127
    ## 
    ## $education
    ## [1] 0.05140177
    ## 
    ## $edu
    ## [1] 0.02155064
    ## 
    ## $kids
    ## [1] 0.02139138
    ## 
    ## $ideology
    ## [1] 0.06574526
    ## 
    ## $Internet
    ## [1] 0.1443268
    ## 
    ## $trust_vote_inst
    ## [1] 0.09737299
    ## 
    ## $eco_anx
    ## [1] 0.09912163
    ## 
    ## $env_aso
    ## [1] 0.1512568
    ## 
    ## $imp_scien
    ## [1] 0.271043
    ## 
    ## $imp_act
    ## [1] 0.1311048
    ## 
    ## $imp_rel
    ## [1] 0.212246
    ## 
    ## $imp_pol
    ## [1] 0.2380509
    ## 
    ## $thoughts
    ## [1] 0.09948352
    ## 
    ## $imp_como
    ## [1] 0.2660131
    ## 
    ## $imp_cli
    ## [1] 0.3534405
    ## 
    ## $no_car
    ## [1] 0.2680532
    ## 
    ## $one_fw_ch
    ## [1] 0.2234418
    ## 
    ## $veg
    ## [1] 0.2535725
    ## 
    ## $only_bk_wk
    ## [1] 0.3040538
    ## 
    ## $cont_clim
    ## [1] 0.08158392

## Valores para la variable emociones frente al cambio climático

    ## $Zona
    ## [1] 0.006969885
    ## 
    ## $sex
    ## [1] 0.03833253
    ## 
    ## $age_r
    ## [1] 0
    ## 
    ## $estrato
    ## [1] 0.041517
    ## 
    ## $etnia
    ## [1] 0
    ## 
    ## $education
    ## [1] 0.03821462
    ## 
    ## $edu
    ## [1] 0.05607967
    ## 
    ## $kids
    ## [1] 0.03570624
    ## 
    ## $ideology
    ## [1] 0.06273595
    ## 
    ## $Internet
    ## [1] 0.06032322
    ## 
    ## $trust_vote_inst
    ## [1] 0.09811412
    ## 
    ## $env_aso
    ## [1] 0.08745675
    ## 
    ## $imp_scien
    ## [1] 0.04855219
    ## 
    ## $imp_act
    ## [1] 0.004250028
    ## 
    ## $imp_rel
    ## [1] 0.05509745
    ## 
    ## $imp_pol
    ## [1] 0.03565998
    ## 
    ## $thoughts
    ## [1] 0.2294467
    ## 
    ## $imp_como
    ## [1] 0.06239652
    ## 
    ## $imp_cli
    ## [1] 0.04496724
    ## 
    ## $no_car
    ## [1] 0.04843456
    ## 
    ## $one_fw_ch
    ## [1] 0.05477745
    ## 
    ## $veg
    ## [1] 0.06387608
    ## 
    ## $only_bk_wk
    ## [1] 0.03779449
    ## 
    ## $clim_origin
    ## [1] 0.09912163
    ## 
    ## $cont_clim
    ## [1] 0.04906422
