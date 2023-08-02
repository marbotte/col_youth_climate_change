Encuesta: Relaciones entre variables
================
Juan Sebastian Cely
2023-08-01

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
| imp_sci               | Impacto de los científicos frente al cambio climático      |
| imp_ac                | Impacto de activistas frente al cambio climático           |
| imp_re                | Impacto de grupos religiosos frente al cambio climático    |
| imp_po                | Impacto de políticos frente al cambio climático            |
| thoughts              | Pensamientos frente al cambio climático                    |
| dis_act               | Disposición actuar cambio climático                        |
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
| imp_sci         | Negativo                     |        209 |
| imp_sci         | Neutro                       |        958 |
| imp_sci         | Positivo                     |       1053 |
| imp_ac          | Negativo                     |        591 |
| imp_ac          | Neutro                       |       1056 |
| imp_ac          | Positivo                     |        573 |
| imp_re          | Negativo                     |        767 |
| imp_re          | Neutro                       |       1010 |
| imp_re          | Positivo                     |        443 |
| imp_po          | Negativo                     |       1097 |
| imp_po          | Neutro                       |        808 |
| imp_po          | Positivo                     |        315 |
| thoughts        | Negativos                    |       1125 |
| thoughts        | Ambivalentes/Neutrales       |        951 |
| thoughts        | Positivos                    |        144 |
| dis_act         | Poco dispuesta               |        368 |
| dis_act         | Dispuesta                    |        925 |
| dis_act         | Muy dispuesta                |        927 |
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

<img src="./figuresanálisis de componentes múltiples-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-2.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-3.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-8.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.383804416 7.999224e-234
    ## imp_re          0.302497440 3.719855e-174
    ## dis_act         0.299856804 2.452721e-172
    ## clim_origin     0.287150439 2.978704e-165
    ## imp_ac          0.178337237  2.740703e-95
    ## Internet        0.134870520  7.685258e-72
    ## imp_sci         0.118707141  1.464868e-61
    ## trust_vote_inst 0.112839037  1.086035e-59
    ## eco_anx         0.096759414  1.018868e-49
    ## thoughts        0.065398819  2.749679e-33
    ## kids            0.053920314  1.457155e-28
    ## age_r           0.047729100  2.425311e-23
    ## ideology        0.041509268  3.892305e-21
    ## cont_clim       0.037116353  5.278970e-20
    ## Zona            0.017181405  5.672759e-10
    ## edu             0.012515377  1.259152e-07
    ## ethni           0.011488170  4.151733e-07
    ## strat           0.003364004  2.386637e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## imp_po=imp_po_Neutro                      0.223026722 1.972675e-191
    ## clim_origin=clim_origin_Incorrecta        0.182793810 2.978704e-165
    ## imp_re=imp_re_Neutro                      0.188515526 5.199627e-121
    ## imp_ac=imp_ac_Neutro                      0.184804038  1.359829e-89
    ## Internet=Internet_No                      0.152535297  7.685258e-72
    ## imp_sci=imp_sci_Neutro                    0.162760739  1.035868e-62
    ## trust_vote_inst=trust_vote_inst_Sí        0.136113796  1.086035e-59
    ## dis_act=Poco dispuesta                    0.204133311  3.770421e-59
    ## dis_act=Dispuesta                         0.059659653  5.278169e-40
    ## eco_anx=eco_anx_Positivas                 0.143291004  9.333663e-33
    ## kids=kids_Sí                              0.080107872  1.457155e-28
    ## cont_clim=cont_clim_Incorrecta            0.069519935  5.278970e-20
    ## thoughts=thoughts_Positivos               0.153630404  5.638895e-16
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.013314794  1.429228e-11
    ## age_r=De 30 a 32 años                     0.084310909  2.528590e-10
    ## Zona=Municipios rurales dispersos         0.076291828  5.672759e-10
    ## ideology=Centro                           0.052203980  9.539737e-10
    ## edu=edu_No                                0.049153840  1.259152e-07
    ## ethni=ethni_Sí                            0.066056220  4.151733e-07
    ## age_r=De 25 a 29 años                     0.066513129  1.232255e-06
    ## ideology=Derecha                          0.055661059  4.509196e-03
    ## imp_po=imp_po_Positivo                    0.013077734  8.588286e-03
    ## strat=Bajo                                0.020845521  8.654090e-03
    ## imp_re=imp_re_Positivo                    0.044412615  3.666627e-02
    ## strat=Medio                              -0.020646620  8.904527e-03
    ## ethni=ethni_No                           -0.066056220  4.151733e-07
    ## edu=edu_Sí                               -0.049153840  1.259152e-07
    ## imp_sci=imp_sci_Negativo                 -0.092596261  6.576710e-08
    ## age_r=De 21 a 24 años                    -0.066829675  1.086069e-09
    ## Zona=Urbana ciudades                     -0.076291828  5.672759e-10
    ## age_r=De 18 a 20 años                    -0.083994363  1.825448e-10
    ## imp_ac=imp_ac_Positivo                   -0.040350026  7.851840e-11
    ## thoughts=thoughts_Ambivalentes/Neutrales -0.009489158  4.016083e-12
    ## cont_clim=cont_clim_Correcta             -0.069519935  5.278970e-20
    ## ideology=Izquierda                       -0.107865039  3.190608e-22
    ## thoughts=thoughts_Negativos              -0.144141247  7.951016e-28
    ## kids=kids_No                             -0.080107872  1.457155e-28
    ## imp_sci=imp_sci_Positivo                 -0.070164478  1.233781e-39
    ## eco_anx=eco_anx_Negativas                -0.156605798  1.161609e-45
    ## imp_ac=imp_ac_Negativo                   -0.144454011  1.422197e-55
    ## trust_vote_inst=trust_vote_inst_No       -0.136113796  1.086035e-59
    ## Internet=Internet_Sí                     -0.152535297  7.685258e-72
    ## imp_re=imp_re_Negativo                   -0.232928141 6.900499e-159
    ## dis_act=Muy dispuesta                    -0.263792964 1.865471e-159
    ## clim_origin=clim_origin_Correcta         -0.182793810 2.978704e-165
    ## imp_po=imp_po_Negativo                   -0.236104457 4.461328e-206
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.478122988 8.400660e-314
    ## imp_po          0.444261635 1.544597e-283
    ## imp_ac          0.355488717 3.404371e-212
    ## imp_sci         0.322374448 4.489153e-188
    ## ideology        0.068593791  6.176244e-35
    ## ethni           0.032682059  9.171431e-18
    ## trust_vote_inst 0.031576639  3.309728e-17
    ## dis_act         0.032842162  8.391103e-17
    ## clim_origin     0.027259455  4.933147e-15
    ## age_r           0.030249397  1.098300e-14
    ## edu             0.024252118  1.601069e-13
    ## strat           0.024124812  1.752084e-12
    ## thoughts        0.011138247  4.053126e-06
    ## cont_clim       0.009471955  4.349800e-06
    ## Internet        0.004082708  2.595620e-03
    ## eco_anx         0.003455977  2.154557e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                               Estimate       p.value
    ## imp_re=imp_re_Positivo                    3.646258e-01 1.091219e-307
    ## imp_po=imp_po_Positivo                    3.959595e-01 3.498142e-278
    ## imp_ac=imp_ac_Positivo                    2.865196e-01 6.730561e-189
    ## imp_sci=imp_sci_Positivo                  2.624199e-01 8.504561e-181
    ## ideology=Derecha                          1.427845e-01  4.328788e-34
    ## ethni=ethni_No                            1.034666e-01  9.171431e-18
    ## trust_vote_inst=trust_vote_inst_Sí        6.686713e-02  3.309728e-17
    ## clim_origin=clim_origin_Correcta          5.230252e-02  4.933147e-15
    ## age_r=De 30 a 32 años                     8.622897e-02  5.689066e-14
    ## edu=edu_Sí                                6.354298e-02  1.601069e-13
    ## strat=Alto                                7.607589e-02  7.683302e-07
    ## cont_clim=cont_clim_Incorrecta            3.261398e-02  4.349800e-06
    ## strat=Medio                               9.233372e-05  8.616395e-05
    ## thoughts=thoughts_Ambivalentes/Neutrales  6.379320e-03  4.388847e-04
    ## dis_act=Muy dispuesta                     5.254177e-02  7.497644e-04
    ## dis_act=Dispuesta                         5.022347e-02  2.127832e-03
    ## Internet=Internet_Sí                      2.464582e-02  2.595620e-03
    ## thoughts=thoughts_Positivos               4.608718e-02  8.621072e-03
    ## age_r=De 25 a 29 años                    -1.594346e-02  2.917649e-02
    ## eco_anx=eco_anx_Negativas                -2.780979e-02  6.324097e-03
    ## Internet=Internet_No                     -2.464582e-02  2.595620e-03
    ## ideology=Centro                          -4.737921e-02  3.732942e-05
    ## cont_clim=cont_clim_Correcta             -3.261398e-02  4.349800e-06
    ## thoughts=thoughts_Negativos              -5.246650e-02  1.752916e-06
    ## age_r=De 18 a 20 años                    -6.880469e-02  7.079736e-08
    ## imp_po=imp_po_Neutro                     -1.666489e-01  3.369281e-08
    ## ideology=Izquierda                       -9.540534e-02  5.766718e-10
    ## strat=Bajo                               -7.616822e-02  2.299940e-11
    ## edu=edu_No                               -6.354298e-02  1.601069e-13
    ## clim_origin=clim_origin_Incorrecta       -5.230252e-02  4.933147e-15
    ## imp_ac=imp_ac_Neutro                     -7.243283e-02  4.404277e-15
    ## trust_vote_inst=trust_vote_inst_No       -6.686713e-02  3.309728e-17
    ## ethni=ethni_Sí                           -1.034666e-01  9.171431e-18
    ## dis_act=Poco dispuesta                   -1.027652e-01  7.714891e-18
    ## imp_re=imp_re_Neutro                     -1.492312e-01  4.585529e-28
    ## imp_sci=imp_sci_Negativo                 -1.951012e-01  1.733165e-40
    ## imp_re=imp_re_Negativo                   -2.153947e-01  2.472307e-59
    ## imp_po=imp_po_Negativo                   -2.293106e-01  2.245911e-64
    ## imp_ac=imp_ac_Negativo                   -2.140868e-01  9.145497e-75
    ## imp_sci=imp_sci_Neutro                   -6.731873e-02  5.617180e-85

## Análisis con las variables sociodemográficas como variables suplementarias

Para ver de forma más clara si las variables demográficas podrían estar
relacionadas con las dimensiones de variabilidad observadas, estas no
fueron incluidas como variables activas en la construcción de las
dimensiones, sino como variables suplementarias. Al interpretar el
análisis se encuentra que algunas variables demográficas pueden estar
relacionadas con algunas de las dimensiones obtenidas, pero su relación
con las variables de interés no es muy clara.
<img src="./figuresanálisis de componentes múltiples 2-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-2.png" width="80%" />

    ## Warning: ggrepel: 16 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-3.png" width="80%" />

    ## Warning: ggrepel: 7 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-8.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.428999165 1.705416e-270
    ## imp_re          0.321968380 8.721008e-188
    ## dis_act         0.307743582 8.628977e-178
    ## clim_origin     0.296034936 2.672714e-171
    ## imp_ac          0.206952395 2.361713e-112
    ## imp_sci         0.125453667  2.925901e-65
    ## trust_vote_inst 0.119019342  4.543321e-63
    ## Internet        0.111608937  5.076379e-59
    ## eco_anx         0.092065182  3.188622e-47
    ## thoughts        0.054897933  6.578900e-28
    ## ideology        0.049141505  5.513977e-25
    ## cont_clim       0.035677024  2.820647e-19
    ## kids            0.005223346  6.548793e-04
    ## Zona            0.004433320  1.695785e-03
    ## age_r           0.006628678  2.051547e-03
    ## ethni           0.003220177  7.486935e-03
    ## edu             0.002345575  2.249066e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## imp_po=imp_po_Neutro                      0.289763459 5.413529e-217
    ## clim_origin=clim_origin_Incorrecta        0.230584026 2.672714e-171
    ## imp_re=imp_re_Neutro                      0.241072155 2.525453e-129
    ## imp_ac=imp_ac_Neutro                      0.242072865 1.278242e-100
    ## imp_sci=imp_sci_Neutro                    0.219680964  1.892915e-64
    ## trust_vote_inst=trust_vote_inst_Sí        0.173672968  4.543321e-63
    ## Internet=Internet_No                      0.172390097  5.076379e-59
    ## dis_act=Poco dispuesta                    0.251475278  3.917233e-58
    ## dis_act=Dispuesta                         0.080333765  2.320130e-43
    ## eco_anx=eco_anx_Positivas                 0.180759417  1.060516e-32
    ## cont_clim=cont_clim_Incorrecta            0.084678277  2.820647e-19
    ## thoughts=thoughts_Positivos               0.185595586  4.155644e-15
    ## ideology=Centro                           0.074304667  3.628355e-12
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.007948041  7.459137e-10
    ## kids=kids_Sí                              0.030975932  6.548793e-04
    ## Zona=Municipios rurales dispersos         0.048146445  1.695785e-03
    ## imp_po=imp_po_Positivo                    0.022909223  1.860524e-03
    ## ideology=Derecha                          0.070035730  6.348275e-03
    ## ethni=ethni_Sí                            0.043448938  7.486935e-03
    ## edu=edu_No                                0.026436936  2.249066e-02
    ## imp_re=imp_re_Positivo                    0.057921597  2.623960e-02
    ## age_r=De 25 a 29 años                     0.036141903  2.871103e-02
    ## age_r=De 30 a 32 años                     0.033839638  4.740581e-02
    ## edu=edu_Sí                               -0.026436936  2.249066e-02
    ## age_r=De 18 a 20 años                    -0.037812085  2.094014e-02
    ## age_r=De 21 a 24 años                    -0.032169456  1.930743e-02
    ## ethni=ethni_No                           -0.043448938  7.486935e-03
    ## Zona=Urbana ciudades                     -0.048146445  1.695785e-03
    ## kids=kids_No                             -0.030975932  6.548793e-04
    ## imp_ac=imp_ac_Positivo                   -0.034296890  1.948760e-08
    ## thoughts=thoughts_Ambivalentes/Neutrales -0.019974854  5.003051e-09
    ## imp_sci=imp_sci_Negativo                 -0.157122712  6.978032e-14
    ## cont_clim=cont_clim_Correcta             -0.084678277  2.820647e-19
    ## thoughts=thoughts_Negativos              -0.165620731  2.795131e-22
    ## ideology=Izquierda                       -0.144340397  4.143815e-26
    ## imp_sci=imp_sci_Positivo                 -0.062558253  7.338376e-34
    ## eco_anx=eco_anx_Negativas                -0.188707458  2.062722e-42
    ## Internet=Internet_Sí                     -0.172390097  5.076379e-59
    ## trust_vote_inst=trust_vote_inst_No       -0.173672968  4.543321e-63
    ## imp_ac=imp_ac_Negativo                   -0.207775975  2.974781e-72
    ## dis_act=Muy dispuesta                    -0.331809043 4.566745e-166
    ## imp_re=imp_re_Negativo                   -0.298993752 2.853382e-171
    ## clim_origin=clim_origin_Correcta         -0.230584026 2.672714e-171
    ## imp_po=imp_po_Negativo                   -0.312672681 4.125345e-239
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.505773669  0.000000e+00
    ## imp_po          0.465868596 1.252947e-302
    ## imp_ac          0.358513793 1.849896e-214
    ## imp_sci         0.332850298 1.417502e-195
    ## ideology        0.062644186  7.179819e-32
    ## clim_origin     0.037419689  3.707408e-20
    ## dis_act         0.038723900  9.708858e-20
    ## trust_vote_inst 0.030223166  1.591136e-16
    ## thoughts        0.013491899  2.887865e-07
    ## cont_clim       0.010460875  1.372248e-06
    ## ethni           0.007292594  5.608143e-05
    ## eco_anx         0.005764162  1.648219e-03
    ## age_r           0.004265530  2.360130e-02
    ## Internet        0.002115252  3.024101e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                             Estimate       p.value
    ## imp_re=imp_re_Positivo                    0.46833445  0.000000e+00
    ## imp_po=imp_po_Positivo                    0.50700867 9.691791e-299
    ## imp_ac=imp_ac_Positivo                    0.36080205 2.931742e-197
    ## imp_sci=imp_sci_Positivo                  0.32812778 8.756175e-191
    ## ideology=Derecha                          0.17027899  4.465481e-32
    ## clim_origin=clim_origin_Correcta          0.07633756  3.707408e-20
    ## trust_vote_inst=trust_vote_inst_Sí        0.08149367  1.591136e-16
    ## cont_clim=cont_clim_Incorrecta            0.04269649  1.372248e-06
    ## dis_act=Muy dispuesta                     0.07818150  1.066143e-05
    ## ethni=ethni_No                            0.06088506  5.608143e-05
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.01027715  7.958596e-05
    ## age_r=De 30 a 32 años                     0.04052974  4.379083e-03
    ## thoughts=thoughts_Positivos               0.06109146  5.112625e-03
    ## dis_act=Dispuesta                         0.06005159  1.056965e-02
    ## eco_anx=eco_anx_Positivas                 0.03192063  1.281938e-02
    ## Internet=Internet_Sí                      0.02209909  3.024101e-02
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.01281975  3.358720e-02
    ## Internet=Internet_No                     -0.02209909  3.024101e-02
    ## eco_anx=eco_anx_Negativas                -0.04474038  4.162302e-04
    ## ethni=ethni_Sí                           -0.06088506  5.608143e-05
    ## ideology=Centro                          -0.06442022  2.791408e-06
    ## cont_clim=cont_clim_Correcta             -0.04269649  1.372248e-06
    ## ideology=Izquierda                       -0.10585877  1.889818e-07
    ## thoughts=thoughts_Negativos              -0.07136861  1.202040e-07
    ## imp_po=imp_po_Neutro                     -0.21940233  3.012628e-10
    ## trust_vote_inst=trust_vote_inst_No       -0.08149367  1.591136e-16
    ## imp_ac=imp_ac_Neutro                     -0.10412453  7.513739e-20
    ## clim_origin=clim_origin_Incorrecta       -0.07633756  3.707408e-20
    ## dis_act=Poco dispuesta                   -0.13823309  1.356137e-20
    ## imp_sci=imp_sci_Negativo                 -0.23105436  8.701907e-37
    ## imp_re=imp_re_Neutro                     -0.20875882  4.200875e-39
    ## imp_re=imp_re_Negativo                   -0.25957563  8.708414e-51
    ## imp_po=imp_po_Negativo                   -0.28760635  4.469012e-63
    ## imp_ac=imp_ac_Negativo                   -0.25667752  1.003602e-66
    ## imp_sci=imp_sci_Neutro                   -0.09707342  1.326921e-94

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

## Origen del cambio climático y emociones frente al cambio climático

|            | Negativas | Ambivalentes/Neutrales | Positivas |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      35.8 |                    7.7 |       3.9 |
| Incorrecta |      35.5 |                    9.6 |       7.5 |

<img src="./figuresrelación origen cambio climatico y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Pensamientos frente al cambio climático y emociones frente al cambio climático

|                        | Negativas | Ambivalentes/Neutrales | Positivas |
|------------------------|----------:|-----------------------:|----------:|
| Negativos              |      41.5 |                    6.4 |       2.8 |
| Ambivalentes/Neutrales |      27.3 |                    9.6 |       5.9 |
| Positivos              |       2.4 |                    1.3 |       2.7 |

<img src="./figuresrelación pensamientos y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Ideología política y emociones frente al cambio climático

|           | Negativas | Ambivalentes/Neutrales | Positivas |
|-----------|----------:|-----------------------:|----------:|
| Derecha   |      12.3 |                    4.1 |       2.7 |
| Centro    |      39.8 |                   10.0 |       6.5 |
| Izquierda |      19.2 |                    3.3 |       2.2 |

<img src="./figuresrelación ideologia y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Disposición a tomar acciones individuales y emociones frente al cambio climático

|                | Negativas | Ambivalentes/Neutrales | Positivas |
|----------------|----------:|-----------------------:|----------:|
| Poco dispuesta |      11.1 |                    3.0 |       2.5 |
| Dispuesta      |      29.0 |                    7.5 |       5.2 |
| Muy dispuesta  |      31.2 |                    6.8 |       3.8 |

<img src="./figuresdisposicion a actuar y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Factor que más contribuye al cambio climático y emociones frente al cambio climático

|            | Negativas | Ambivalentes/Neutrales | Positivas |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      24.6 |                    5.9 |       3.0 |
| Incorrecta |      46.6 |                   11.4 |       8.5 |

<img src="./figuresrelación contribucion al cambio climatico y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Uso de internet como fuente de información y emociones frente al cambio climático

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| No  |      14.1 |                    4.2 |       3.2 |
| Sí  |      57.2 |                   13.2 |       8.3 |

<img src="./figuresrelación internet y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Confianza en Instituciones y emociones frente al cambio climático

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| No  |      56.8 |                   12.6 |       7.7 |
| Sí  |      14.5 |                    4.8 |       3.7 |

<img src="./figuresconfianza instituciones y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Zona de residencia y emociones frente al cambio climático

|                              | Negativas | Ambivalentes/Neutrales | Positivas |
|------------------------------|----------:|-----------------------:|----------:|
| Municipios rurales dispersos |       6.4 |                    2.0 |       1.0 |
| Urbana ciudades              |      64.8 |                   15.4 |      10.4 |

<img src="./figureszona y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Rango de edad y emociones frente al cambio climático

|                 | Negativas | Ambivalentes/Neutrales | Positivas |
|-----------------|----------:|-----------------------:|----------:|
| De 18 a 20 años |      13.5 |                    3.0 |       2.1 |
| De 21 a 24 años |      16.9 |                    4.1 |       2.6 |
| De 25 a 29 años |      20.7 |                    4.9 |       3.7 |
| De 30 a 32 años |      20.1 |                    5.4 |       3.1 |

<img src="./figuresedad y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Nivel educativo y origen del cambio climático

|                     | Correcta | Incorrecta |
|---------------------|---------:|-----------:|
| Básica Primaria     |      0.9 |        1.6 |
| Básica Secundaria   |      3.2 |        4.2 |
| Secundaria Completa |     22.0 |       23.6 |
| Técnico o Tecnólogo |     13.2 |       12.8 |
| Pregrado            |      7.1 |        8.5 |
| Posgrado            |      1.0 |        1.8 |

<img src="./figuresrelación origen cambio climatico y educacion-1.png" width="80%" style="display: block; margin: auto;" />

## Rango de edad y origen del cambio climático

|                 | Correcta | Incorrecta |
|-----------------|---------:|-----------:|
| De 18 a 20 años |     10.0 |        8.6 |
| De 21 a 24 años |     11.3 |       12.3 |
| De 25 a 29 años |     12.2 |       17.1 |
| De 30 a 32 años |     14.0 |       14.5 |

<img src="./figuresrelación origen cambio climatico y edad-1.png" width="80%" style="display: block; margin: auto;" />

## Opinión impacto de los científicos y origen del cambio climático

|          | Correcta | Incorrecta |
|----------|---------:|-----------:|
| Negativo |      4.3 |        5.1 |
| Neutro   |     16.9 |       26.2 |
| Positivo |     26.2 |       21.3 |

<img src="./figuresrelación origen cambio climatico y opinion cientificos-1.png" width="80%" style="display: block; margin: auto;" />

## Disposición a tomar acciones individuales y origen del cambio climático

|                | Correcta | Incorrecta |
|----------------|---------:|-----------:|
| Poco dispuesta |      3.1 |       13.5 |
| Dispuesta      |     17.0 |       24.7 |
| Muy dispuesta  |     27.4 |       14.4 |

<img src="./figuresrelación origen cambio climatico y disposición a actuar-1.png" width="80%" style="display: block; margin: auto;" />

## Pensamientos frente al cambio climático y origen del cambio climático

|                        | Correcta | Incorrecta |
|------------------------|---------:|-----------:|
| Negativos              |     26.6 |       24.1 |
| Ambivalentes/Neutrales |     18.0 |       24.9 |
| Positivos              |      2.8 |        3.6 |

<img src="./figuresrelación origen cambio climatico y pensamientos sobre cambio climatico-1.png" width="80%" style="display: block; margin: auto;" />

## Uso de internet como fuente de información y origen del cambio climático

|     | Correcta | Incorrecta |
|-----|---------:|-----------:|
| No  |      7.2 |       14.2 |
| Sí  |     40.3 |       38.3 |

<img src="./figuresrelación origen cambio climatico e internet-1.png" width="80%" style="display: block; margin: auto;" />

## Zona de residencia y origen del cambio climático

|                              | Correcta | Incorrecta |
|------------------------------|---------:|-----------:|
| Municipios rurales dispersos |      4.1 |        5.4 |
| Urbana ciudades              |     43.3 |       47.2 |

<img src="./figuresrelación origen cambio climatico y zona-1.png" width="80%" style="display: block; margin: auto;" />

## Ideología política y origen del cambio climático

|           | Correcta | Incorrecta |
|-----------|---------:|-----------:|
| Derecha   |     10.2 |        8.8 |
| Centro    |     25.0 |       31.2 |
| Izquierda |     12.2 |       12.5 |

<img src="./figuresrelación origen cambio climatico e ideología-1.png" width="80%" style="display: block; margin: auto;" />

## Confianza en Instituciones y origen del cambio climático

|     | Correcta | Incorrecta |
|-----|---------:|-----------:|
| No  |     38.6 |       38.4 |
| Sí  |      8.8 |       14.1 |

<img src="./figuresrelación origen cambio climatico y confianza en instituciones-1.png" width="80%" style="display: block; margin: auto;" />

# Tests de chi-cuadrado

Se realizaron múltiples test de chi-cuadrado para establecer si existen
relaciones significativas entre las principales variables de interés y
las demás variables. Dado el alto número de tests se utilizó la
corrección propuesta por Benjamini y Hochberg.

## Tests para la variable origen del cambio climático

| Variable                      |   P-value |
|:------------------------------|----------:|
| Edad                          | 0.0016174 |
| Estrato                       | 0.0193850 |
| Etnia                         | 0.0042548 |
| Ideología                     | 0.0042548 |
| Internet                      | 0.0000000 |
| Confianza Instituciones       | 0.0000102 |
| Emociones cambio climático    | 0.0000153 |
| Impacto científicos           | 0.0000000 |
| Impacto activistas            | 0.0002275 |
| Impacto grupos religiosos     | 0.0000000 |
| Impacto políticos             | 0.0000000 |
| Pensamientos cambio climático | 0.0000153 |
| Disposición a actuar          | 0.0000000 |
| Contribución cambio climático | 0.0001727 |

## Tests para la variable emociones frente al cambio climático

| Variable                      |   P-value |
|:------------------------------|----------:|
| Ideología                     | 0.0011543 |
| Internet                      | 0.0194640 |
| Confianza Instituciones       | 0.0000507 |
| Impacto grupos religiosos     | 0.0093094 |
| Pensamientos cambio climático | 0.0000000 |
| Disposición a actuar          | 0.0260008 |
| Origen cambio climático       | 0.0000507 |

# Calculo de multiples Cramér’s V

Se calcularon los tamaños del efecto de las distintas asociaciones entre
las principales variables de interés y las demás variables. La medida
del tamaño del efecto utilizada fue Cramér’s V.

## Valores para la variable origen del cambio climático

| Variable                      | Cramér’s V |
|:------------------------------|-----------:|
| Edad                          |  0.0773886 |
| Estrato                       |  0.0639786 |
| Etnia                         |  0.0608797 |
| Ideología                     |  0.0657453 |
| Internet                      |  0.1443268 |
| Confianza Instituciones       |  0.0973730 |
| Emociones cambio climático    |  0.0991216 |
| Impacto científicos           |  0.1489673 |
| Impacto activistas            |  0.0847853 |
| Impacto grupos religiosos     |  0.1506780 |
| Impacto políticos             |  0.1931039 |
| Pensamientos cambio climático |  0.0994835 |
| Disposición a actuar          |  0.3428330 |
| Contribución cambio climático |  0.0815839 |

## Valores para la variable emociones frente al cambio climático

| Variable                      | Cramér’s V |
|:------------------------------|-----------:|
| Ideología                     |  0.0627360 |
| Internet                      |  0.0603232 |
| Confianza Instituciones       |  0.0981141 |
| Impacto grupos religiosos     |  0.0527561 |
| Pensamientos cambio climático |  0.2294467 |
| Disposición a actuar          |  0.0456626 |
| Origen cambio climático       |  0.0991216 |

# Relación variables con nueva variable para emociones frente al cambio climático

Los análisis anteriores se realizaron nuevamente pero modificando la
variable de las emociones frente al cambio climático, incluyendo esta
vez la clasificación basada en el modelo “Circumplex model of affect”.

## Análisis de correspondencia múltiple

<img src="./figuresanálisis de componentes múltiples nueva variable emociones-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-2.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-3.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-8.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                         R2       p.value
    ## imp_po          0.37889593 5.280937e-230
    ## dis_act         0.30163066 1.473689e-173
    ## imp_re          0.29803146 4.396599e-171
    ## clim_origin     0.29007904 3.083639e-167
    ## imp_ac          0.16875908  1.040609e-89
    ## Internet        0.13186180  3.652811e-70
    ## cir_mod         0.13784655  7.050283e-69
    ## trust_vote_inst 0.11512506  6.149713e-61
    ## imp_sci         0.11246201  3.674829e-58
    ## thoughts        0.06969227  1.669625e-35
    ## kids            0.05287635  4.998662e-28
    ## age_r           0.04852750  9.653594e-24
    ## ideology        0.04096253  7.323766e-21
    ## cont_clim       0.03722976  4.625654e-20
    ## Zona            0.02034687  1.461904e-11
    ## edu             0.01080017  9.243223e-07
    ## ethni           0.01023051  1.794859e-06
    ## strat           0.00390499  1.307367e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                        Estimate       p.value
    ## imp_po=imp_po_Neutro                0.218239251 1.812902e-184
    ## clim_origin=clim_origin_Incorrecta  0.184730655 3.083639e-167
    ## imp_re=imp_re_Neutro                0.184108168 3.474639e-115
    ## imp_ac=imp_ac_Neutro                0.179662794  2.064460e-83
    ## Internet=Internet_No                0.151651037  3.652811e-70
    ## dis_act=Poco dispuesta              0.210884260  1.518655e-62
    ## trust_vote_inst=trust_vote_inst_Sí  0.138239278  6.149713e-61
    ## imp_sci=imp_sci_Neutro              0.159852650  2.913745e-59
    ## dis_act=Dispuesta                   0.055237687  1.146321e-37
    ## cir_mod=Pos                         0.186987578  9.093596e-34
    ## kids=kids_Sí                        0.079763420  4.998662e-28
    ## cont_clim=cont_clim_Incorrecta      0.070007711  4.625654e-20
    ## thoughts=Positivos                  0.152085662  1.391024e-15
    ## Zona=Municipios rurales dispersos   0.083477908  1.461904e-11
    ## age_r=De 30 a 32 años               0.086557955  8.860721e-11
    ## ideology=Centro                     0.047680469  1.635239e-08
    ## edu=edu_No                          0.045911848  9.243223e-07
    ## age_r=De 25 a 29 años               0.066121778  1.703110e-06
    ## ethni=ethni_Sí                      0.062677387  1.794859e-06
    ## cir_mod=Pos y neg act               0.059449014  2.496788e-06
    ## cir_mod=Neg act                     0.006237320  4.443328e-04
    ## ideology=Derecha                    0.061479125  8.639533e-04
    ## cir_mod=Pos y neg no act            0.092538921  9.272866e-04
    ## imp_po=imp_po_Positivo              0.021269262  1.375491e-03
    ## strat=Bajo                          0.019610753  6.602898e-03
    ## imp_re=imp_re_Positivo              0.051494502  7.599673e-03
    ## strat=Medio                        -0.025190832  3.754417e-03
    ## ethni=ethni_No                     -0.062677387  1.794859e-06
    ## edu=edu_Sí                         -0.045911848  9.243223e-07
    ## cir_mod=Neg no act                 -0.179049455  2.972024e-07
    ## imp_sci=imp_sci_Negativo           -0.092300180  8.322003e-08
    ## imp_ac=imp_ac_Positivo             -0.035053721  2.841076e-09
    ## age_r=De 18 a 20 años              -0.082934197  3.563199e-10
    ## age_r=De 21 a 24 años              -0.069745537  3.152554e-10
    ## Zona=Urbana ciudades               -0.083477908  1.461904e-11
    ## thoughts=Ambivalentes/Neutrales    -0.003768341  3.938329e-14
    ## cont_clim=cont_clim_Correcta       -0.070007711  4.625654e-20
    ## ideology=Izquierda                 -0.109159594  7.781989e-22
    ## kids=kids_No                       -0.079763420  4.998662e-28
    ## thoughts=Negativos                 -0.148317321  1.125302e-30
    ## imp_sci=imp_sci_Positivo           -0.067552470  3.530302e-37
    ## cir_mod=Neg no act y act           -0.166163378  2.769540e-44
    ## imp_ac=imp_ac_Negativo             -0.144609072  2.290110e-54
    ## trust_vote_inst=trust_vote_inst_No -0.138239278  6.149713e-61
    ## Internet=Internet_Sí               -0.151651037  3.652811e-70
    ## dis_act=Muy dispuesta              -0.266121947 1.564806e-158
    ## imp_re=imp_re_Negativo             -0.235602670 1.351787e-158
    ## clim_origin=clim_origin_Correcta   -0.184730655 3.083639e-167
    ## imp_po=imp_po_Negativo             -0.239508513 3.711795e-206
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.473451996 1.636782e-309
    ## imp_po          0.438235597 2.403523e-278
    ## imp_ac          0.358201577 3.172479e-214
    ## imp_sci         0.325234394 4.130774e-190
    ## ideology        0.067532688  2.182045e-34
    ## dis_act         0.034412330  1.385517e-17
    ## ethni           0.032100343  1.802135e-17
    ## clim_origin     0.030030263  1.990002e-16
    ## trust_vote_inst 0.028746920  8.808072e-16
    ## age_r           0.031124086  4.097442e-15
    ## edu             0.024926877  7.336237e-14
    ## strat           0.024974454  6.671602e-13
    ## cir_mod         0.014703008  4.093043e-06
    ## thoughts        0.009534980  2.441682e-05
    ## cont_clim       0.007946341  2.597986e-05
    ## Internet        0.004750712  1.155732e-03
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                        Estimate       p.value
    ## imp_re=imp_re_Positivo              0.363724858 5.320534e-305
    ## imp_po=imp_po_Positivo              0.394946818 1.596267e-274
    ## imp_ac=imp_ac_Positivo              0.288588924 2.450022e-192
    ## imp_sci=imp_sci_Positivo            0.263227318 1.870801e-183
    ## ideology=Derecha                    0.142043685  6.557495e-34
    ## ethni=ethni_No                      0.102699529  1.802135e-17
    ## clim_origin=clim_origin_Correcta    0.054980874  1.990002e-16
    ## trust_vote_inst=trust_vote_inst_Sí  0.063898910  8.808072e-16
    ## age_r=De 30 a 32 años               0.088006972  1.800491e-14
    ## edu=edu_Sí                          0.064520058  7.336237e-14
    ## strat=Alto                          0.080166161  2.057058e-07
    ## cir_mod=Pos y neg act               0.081079744  1.360794e-05
    ## cont_clim=cont_clim_Incorrecta      0.029918213  2.597986e-05
    ## dis_act=Muy dispuesta               0.057418172  9.292057e-05
    ## thoughts=Ambivalentes/Neutrales     0.013985160  2.027549e-04
    ## Internet=Internet_Sí                0.026626649  1.155732e-03
    ## dis_act=Dispuesta                   0.047648185  7.598568e-03
    ## cir_mod=Neg act                     0.026927907  1.560988e-02
    ## age_r=De 25 a 29 años              -0.016028840  2.814022e-02
    ## Internet=Internet_No               -0.026626649  1.155732e-03
    ## cir_mod=Neg no act y act           -0.030638778  3.282681e-04
    ## strat=Medio                        -0.002308175  1.422944e-04
    ## cont_clim=cont_clim_Correcta       -0.029918213  2.597986e-05
    ## ideology=Centro                    -0.049247994  1.418570e-05
    ## thoughts=Negativos                 -0.045109158  4.899225e-06
    ## age_r=De 18 a 20 años              -0.069114725  6.301209e-08
    ## ideology=Izquierda                 -0.092795690  3.318277e-09
    ## imp_po=imp_po_Neutro               -0.169584767  3.024283e-09
    ## strat=Bajo                         -0.077857987  1.997825e-11
    ## edu=edu_No                         -0.064520058  7.336237e-14
    ## trust_vote_inst=trust_vote_inst_No -0.063898910  8.808072e-16
    ## imp_ac=imp_ac_Neutro               -0.075581836  2.648758e-16
    ## clim_origin=clim_origin_Incorrecta -0.054980874  1.990002e-16
    ## ethni=ethni_Sí                     -0.102699529  1.802135e-17
    ## dis_act=Poco dispuesta             -0.105066357  1.546518e-18
    ## imp_re=imp_re_Neutro               -0.152197231  6.695021e-30
    ## imp_sci=imp_sci_Negativo           -0.193186202  1.274456e-39
    ## imp_re=imp_re_Negativo             -0.211527627  8.150606e-56
    ## imp_po=imp_po_Negativo             -0.225362052  2.072273e-60
    ## imp_ac=imp_ac_Negativo             -0.213007087  3.937967e-73
    ## imp_sci=imp_sci_Neutro             -0.070041116  2.291716e-87

## Análisis con las variables sociodemográficas como variables suplementarias

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-2.png" width="80%" />

    ## Warning: ggrepel: 16 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-3.png" width="80%" />

    ## Warning: ggrepel: 7 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-8.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.422584134 4.076041e-265
    ## imp_re          0.316662842 4.931045e-184
    ## dis_act         0.310224944 1.611563e-179
    ## clim_origin     0.300581840 2.007713e-174
    ## imp_ac          0.196626760 3.989284e-106
    ## cir_mod         0.132055161  1.094194e-65
    ## trust_vote_inst 0.120510284  6.900830e-64
    ## imp_sci         0.120735880  1.138415e-62
    ## Internet        0.109831056  4.697975e-58
    ## thoughts        0.058481339  9.758240e-30
    ## ideology        0.048233888  1.587699e-24
    ## cont_clim       0.035958972  2.031608e-19
    ## Zona            0.005478270  4.826681e-04
    ## kids            0.005247270  6.363706e-04
    ## age_r           0.006980116  1.418320e-03
    ## ethni           0.002968034  1.024725e-02
    ## edu             0.002047657  3.300858e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_po=imp_po_Neutro                0.28489251 1.264497e-209
    ## clim_origin=clim_origin_Incorrecta  0.23358380 2.007713e-174
    ## imp_re=imp_re_Neutro                0.23670044 5.315082e-124
    ## imp_ac=imp_ac_Neutro                0.23605726  3.195214e-94
    ## trust_vote_inst=trust_vote_inst_Sí  0.17568679  6.900830e-64
    ## dis_act=Poco dispuesta              0.26117700  3.651253e-62
    ## imp_sci=imp_sci_Neutro              0.21666653  6.128972e-62
    ## Internet=Internet_No                0.17192104  4.697975e-58
    ## dis_act=Dispuesta                   0.07399100  1.322335e-40
    ## cir_mod=Pos                         0.23059020  2.283022e-33
    ## cont_clim=cont_clim_Incorrecta      0.08546434  2.031608e-19
    ## thoughts=Positivos                  0.18270281  1.340095e-14
    ## ideology=Centro                     0.06859630  9.959112e-11
    ## cir_mod=Pos y neg act               0.05318961  1.114509e-04
    ## cir_mod=Pos y neg no act            0.13754028  1.498312e-04
    ## imp_po=imp_po_Positivo              0.03038241  4.267191e-04
    ## Zona=Municipios rurales dispersos   0.05380529  4.826681e-04
    ## cir_mod=Neg act                     0.00699934  5.391149e-04
    ## kids=kids_Sí                        0.03121191  6.363706e-04
    ## ideology=Derecha                    0.07721932  1.279637e-03
    ## imp_re=imp_re_Positivo              0.06423595  8.339236e-03
    ## ethni=ethni_Sí                      0.04193506  1.024725e-02
    ## age_r=De 25 a 29 años               0.03609389  3.015619e-02
    ## edu=edu_No                          0.02483240  3.300858e-02
    ## age_r=De 30 a 32 años               0.03599432  3.411772e-02
    ## edu=edu_Sí                         -0.02483240  3.300858e-02
    ## age_r=De 18 a 20 años              -0.03698714  2.404415e-02
    ## age_r=De 21 a 24 años              -0.03510107  1.201722e-02
    ## ethni=ethni_No                     -0.04193506  1.024725e-02
    ## kids=kids_No                       -0.03121191  6.363706e-04
    ## Zona=Urbana ciudades               -0.05380529  4.826681e-04
    ## imp_ac=imp_ac_Positivo             -0.02974288  1.983883e-07
    ## cir_mod=Neg no act                 -0.22879956  1.115098e-07
    ## thoughts=Ambivalentes/Neutrales    -0.01225920  8.068721e-11
    ## imp_sci=imp_sci_Negativo           -0.15499565  2.039906e-13
    ## cont_clim=cont_clim_Correcta       -0.08546434  2.031608e-19
    ## thoughts=Negativos                 -0.17044361  7.578687e-25
    ## ideology=Izquierda                 -0.14581562  1.268616e-25
    ## imp_sci=imp_sci_Positivo           -0.06167088  1.324915e-32
    ## cir_mod=Neg no act y act           -0.19951987  1.197658e-40
    ## Internet=Internet_Sí               -0.17192104  4.697975e-58
    ## trust_vote_inst=trust_vote_inst_No -0.17568679  6.900830e-64
    ## imp_ac=imp_ac_Negativo             -0.20631438  7.200830e-70
    ## dis_act=Muy dispuesta              -0.33516799 2.458892e-165
    ## imp_re=imp_re_Negativo             -0.30093638 8.035238e-170
    ## clim_origin=clim_origin_Correcta   -0.23358380 2.007713e-174
    ## imp_po=imp_po_Negativo             -0.31527492 2.949773e-237
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.502719317  0.000000e+00
    ## imp_po          0.461366723 1.375595e-298
    ## imp_ac          0.362326239 2.497408e-217
    ## imp_sci         0.334705661 6.468874e-197
    ## ideology        0.061256877  3.699075e-31
    ## clim_origin     0.039259985  4.337043e-21
    ## dis_act         0.039763910  2.924425e-20
    ## trust_vote_inst 0.028123243  1.814170e-15
    ## cir_mod         0.016525311  6.221454e-07
    ## thoughts        0.012005957  1.531689e-06
    ## cont_clim       0.008994135  7.604831e-06
    ## ethni           0.007045282  7.508430e-05
    ## age_r           0.004432761  1.991199e-02
    ## Internet        0.002311260  2.350014e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_re=imp_re_Positivo              0.46765816  0.000000e+00
    ## imp_po=imp_po_Positivo              0.50573336 2.969520e-295
    ## imp_ac=imp_ac_Positivo              0.36339524 2.877626e-200
    ## imp_sci=imp_sci_Positivo            0.32916735 2.694488e-192
    ## ideology=Derecha                    0.16859154  1.534247e-31
    ## clim_origin=clim_origin_Correcta    0.07830764  4.337043e-21
    ## trust_vote_inst=trust_vote_inst_Sí  0.07872768  1.814170e-15
    ## cir_mod=Pos y neg act               0.11480918  4.781548e-07
    ## dis_act=Muy dispuesta               0.08205067  1.998278e-06
    ## cont_clim=cont_clim_Incorrecta      0.03964868  7.604831e-06
    ## thoughts=Ambivalentes/Neutrales     0.01942199  3.105312e-05
    ## ethni=ethni_No                      0.05993214  7.508430e-05
    ## age_r=De 30 a 32 años               0.04165302  3.463434e-03
    ## dis_act=Dispuesta                   0.05761156  2.322381e-02
    ## Internet=Internet_Sí                0.02313442  2.350014e-02
    ## thoughts=Positivos                  0.04369456  4.250981e-02
    ## Internet=Internet_No               -0.02313442  2.350014e-02
    ## cir_mod=Neg no act y act           -0.04249074  1.291179e-04
    ## ethni=ethni_Sí                     -0.05993214  7.508430e-05
    ## cont_clim=cont_clim_Correcta       -0.03964868  7.604831e-06
    ## ideology=Centro                    -0.06554938  1.610963e-06
    ## ideology=Izquierda                 -0.10304217  6.037132e-07
    ## thoughts=Negativos                 -0.06311655  2.913548e-07
    ## imp_po=imp_po_Neutro               -0.22032480  1.316524e-10
    ## trust_vote_inst=trust_vote_inst_No -0.07872768  1.814170e-15
    ## imp_ac=imp_ac_Neutro               -0.10581357  2.045233e-20
    ## dis_act=Poco dispuesta             -0.13966224  6.123725e-21
    ## clim_origin=clim_origin_Incorrecta -0.07830764  4.337043e-21
    ## imp_sci=imp_sci_Negativo           -0.23068351  1.406241e-36
    ## imp_re=imp_re_Neutro               -0.21067535  3.448623e-40
    ## imp_re=imp_re_Negativo             -0.25698281  5.331671e-49
    ## imp_po=imp_po_Negativo             -0.28540856  2.353407e-61
    ## imp_ac=imp_ac_Negativo             -0.25758168  7.759215e-67
    ## imp_sci=imp_sci_Neutro             -0.09848384  9.650939e-96

# Exploración visual de relaciones

## Origen del cambio climático y emociones frente al cambio climático

|            | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|------------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Correcta   | 4.7 |           5.6 |              1.4 |    12.7 |             19.5 |        3.6 |
| Incorrecta | 8.7 |           6.3 |              2.1 |    16.5 |             16.4 |        2.6 |

<img src="./figuresrelación origen cambio climatico y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Pensamientos frente al cambio climático y emociones frente al cambio climático

|                        | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|------------------------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Negativos              | 3.1 |           4.6 |              1.5 |    15.3 |             22.3 |        3.9 |
| Ambivalentes/Neutrales | 7.2 |           6.5 |              1.8 |    12.7 |             12.6 |        2.0 |
| Positivos              | 3.1 |           0.8 |              0.2 |     1.1 |              1.0 |        0.3 |

<img src="./figuresrelación pensamientos y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Ideología política y emociones frente al cambio climático

|           | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|-----------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Derecha   | 3.0 |           2.6 |              1.2 |     6.0 |              5.6 |        0.7 |
| Centro    | 7.6 |           7.0 |              1.9 |    15.6 |             20.5 |        3.7 |
| Izquierda | 2.7 |           2.3 |              0.5 |     7.6 |              9.9 |        1.7 |

<img src="./figuresrelación ideologia y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Disposición a tomar acciones individuales y emociones frente al cambio climático

|                | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|----------------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Poco dispuesta | 3.2 |           1.6 |              0.7 |     5.9 |              4.2 |        0.9 |
| Dispuesta      | 5.9 |           5.2 |              1.6 |    11.7 |             14.4 |        2.9 |
| Muy dispuesta  | 4.3 |           5.0 |              1.2 |    11.5 |             17.3 |        2.3 |

<img src="./figuresdisposicion a actuar y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Factor que más contribuye al cambio climático y emociones frente al cambio climático

|            | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|------------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Correcta   | 3.6 |           4.3 |              1.0 |     9.7 |             12.3 |        2.6 |
| Incorrecta | 9.8 |           7.6 |              2.5 |    19.4 |             23.6 |        3.5 |

<img src="./figuresrelación contribucion al cambio climatico y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Uso de internet como fuente de información y emociones frente al cambio climático

|     | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|-----|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| No  | 3.6 |           3.0 |              0.7 |     6.3 |              6.8 |        0.9 |
| Sí  | 9.8 |           8.9 |              2.8 |    22.8 |             29.1 |        5.2 |

<img src="./figuresrelación internet y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Confianza en Instituciones y emociones frente al cambio climático

|     | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|-----|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| No  | 9.2 |           8.6 |              2.5 |    22.3 |             29.5 |        4.9 |
| Sí  | 4.2 |           3.3 |              1.0 |     6.8 |              6.4 |        1.2 |

<img src="./figuresconfianza instituciones y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Zona de residencia y emociones frente al cambio climático

|                              |  Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|------------------------------|-----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| Municipios rurales dispersos |  1.5 |           1.1 |              0.4 |     3.4 |              2.8 |        0.3 |
| Urbana ciudades              | 11.9 |          10.8 |              3.1 |    25.8 |             33.2 |        5.9 |

<img src="./figureszona y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Rango de edad y emociones frente al cambio climático

|                 | Pos | Pos y neg act | Pos y neg no act | Neg act | Neg no act y act | Neg no act |
|-----------------|----:|--------------:|-----------------:|--------:|-----------------:|-----------:|
| De 18 a 20 años | 2.5 |           1.8 |              0.8 |     5.6 |              6.8 |        1.0 |
| De 21 a 24 años | 3.0 |           2.7 |              1.0 |     6.0 |              9.3 |        1.6 |
| De 25 a 29 años | 4.4 |           3.5 |              0.7 |     8.6 |             10.3 |        1.8 |
| De 30 a 32 años | 3.5 |           3.9 |              1.0 |     8.9 |              9.5 |        1.7 |

<img src="./figuresedad y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Tests de Chi-cuadrado para la variable origen del cambio climático

| Variable                      |   P-value |
|:------------------------------|----------:|
| Edad                          | 0.0017072 |
| Estrato                       | 0.0204620 |
| Etnia                         | 0.0044912 |
| Ideología                     | 0.0044912 |
| Internet                      | 0.0000000 |
| Confianza Instituciones       | 0.0000093 |
| Emociones cambio climático    | 0.0000000 |
| Impacto científicos           | 0.0000000 |
| Impacto activistas            | 0.0002401 |
| Impacto grupos religiosos     | 0.0000000 |
| Impacto políticos             | 0.0000000 |
| Pensamientos cambio climático | 0.0000149 |
| Disposición a actuar          | 0.0000000 |
| Contribución cambio climático | 0.0001822 |

## Tests de Chi-cuadrado para la variable emociones frente al cambio climático

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

| Variable                      |   P-value |
|:------------------------------|----------:|
| Sexo                          | 0.0298233 |
| Estrato                       | 0.0162191 |
| Nivel educativo               | 0.0455107 |
| Ideología                     | 0.0002019 |
| Internet                      | 0.0329670 |
| Confianza Instituciones       | 0.0001383 |
| Impacto activistas            | 0.0491040 |
| Impacto grupos religiosos     | 0.0013985 |
| Impacto políticos             | 0.0172459 |
| Pensamientos cambio climático | 0.0000000 |
| Disposición a actuar          | 0.0000041 |
| Origen cambio climático       | 0.0000001 |
| Contribución cambio climático | 0.0414672 |

## Valores de Cramers’ V para la variable origen del cambio climático

| Variable                      | Cramér’s V |
|:------------------------------|-----------:|
| Edad                          |  0.0773886 |
| Estrato                       |  0.0639786 |
| Etnia                         |  0.0608797 |
| Ideología                     |  0.0657453 |
| Internet                      |  0.1443268 |
| Confianza Instituciones       |  0.0973730 |
| Emociones cambio climático    |  0.1360172 |
| Impacto científicos           |  0.1489673 |
| Impacto activistas            |  0.0847853 |
| Impacto grupos religiosos     |  0.1506780 |
| Impacto políticos             |  0.1931039 |
| Pensamientos cambio climático |  0.0994835 |
| Disposición a actuar          |  0.3428330 |
| Contribución cambio climático |  0.0815839 |

## Valores de Cramers’ V para la variable emociones frente al cambio climático

| Variable                      | Cramér’s V |
|:------------------------------|-----------:|
| Sexo                          |  0.0645383 |
| Estrato                       |  0.0438092 |
| Nivel educativo               |  0.0368637 |
| Ideología                     |  0.0782387 |
| Internet                      |  0.0627496 |
| Confianza Instituciones       |  0.1028955 |
| Impacto activistas            |  0.0464352 |
| Impacto grupos religiosos     |  0.0700058 |
| Impacto políticos             |  0.0564305 |
| Pensamientos cambio climático |  0.2369547 |
| Disposición a actuar          |  0.0924014 |
| Origen cambio climático       |  0.1360172 |
| Contribución cambio climático |  0.0597860 |
