Encuesta: Relaciones entre variables
================
Juan Sebastian Cely
2023-08-23

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
| clim_origin           | Causa u origen del cambio climático                        |
| cont_clim             | Factor que más contribuye al cambio climático              |
| aso                   | Unirse a una organización ambiental                        |
| neg_emo_gov           | Emociones negativas gobierno cambio climático              |
| imp_como              | Impacto en comodidad                                       |

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
| clim_origin     | Correcta                     |       1053 |
| clim_origin     | Incorrecta                   |       1167 |
| cont_clim       | Correcta                     |        744 |
| cont_clim       | Incorrecta                   |       1476 |
| aso             | Sí                           |       1274 |
| aso             | No                           |        946 |
| neg_emo_gov     | Bajo o nulo                  |        123 |
| neg_emo_gov     | Medio                        |       1638 |
| neg_emo_gov     | Alto                         |        459 |
| imp_como        | Negativo                     |        461 |
| imp_como        | Positivo                     |       1759 |

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
    ## neg_emo_gov     0.336533723 3.063363e-198
    ## imp_po          0.321986428 8.467448e-188
    ## imp_re          0.283141221 5.599569e-161
    ## clim_origin     0.258628029 2.466709e-146
    ## aso             0.154982329  3.364121e-83
    ## Internet        0.137844417  1.669093e-73
    ## eco_anx         0.130065970  8.328855e-68
    ## imp_ac          0.116851959  1.507113e-60
    ## trust_vote_inst 0.105834825  6.874557e-56
    ## thoughts        0.099683076  2.801022e-51
    ## imp_como        0.093556608  2.705953e-49
    ## imp_sci         0.080260220  5.279834e-41
    ## kids            0.056388943  7.862485e-30
    ## age_r           0.057483328  2.951726e-28
    ## cont_clim       0.049906637  1.655741e-26
    ## ideology        0.043574607  3.562397e-22
    ## Zona            0.023103759  6.040547e-13
    ## edu             0.012968157  7.446334e-08
    ## strat           0.014473806  9.575651e-08
    ## ethni           0.007966372  2.537550e-05
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## clim_origin=clim_origin_Incorrecta        0.171620644 2.466709e-146
    ## neg_emo_gov=neg_emo_gov_Medio             0.171355335 3.368750e-145
    ## imp_po=imp_po_Neutro                      0.183187090 9.821007e-141
    ## imp_re=imp_re_Neutro                      0.150127209  1.638806e-85
    ## aso=aso_No                                0.134150456  3.364121e-83
    ## Internet=Internet_No                      0.152556746  1.669093e-73
    ## imp_ac=imp_ac_Neutro                      0.148546130  6.130217e-58
    ## trust_vote_inst=trust_vote_inst_Sí        0.130410256  6.874557e-56
    ## imp_como=imp_como_Negativo                0.127067708  2.705953e-49
    ## eco_anx=eco_anx_Positivas                 0.158611144  4.395031e-42
    ## imp_sci=imp_sci_Neutro                    0.134988855  6.919743e-42
    ## kids=kids_Sí                              0.081044016  7.862485e-30
    ## cont_clim=cont_clim_Incorrecta            0.079750030  1.655741e-26
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.007052364  9.538840e-23
    ## thoughts=thoughts_Positivos               0.164473524  1.101037e-18
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.021711562  1.346335e-16
    ## Zona=Municipios rurales dispersos         0.087521549  6.040547e-13
    ## age_r=De 30 a 32 años                     0.092223355  3.993151e-12
    ## imp_re=imp_re_Positivo                    0.091861332  4.827862e-10
    ## ideology=Centro                           0.050837933  1.313685e-09
    ## edu=edu_No                                0.049499361  7.446334e-08
    ## age_r=De 25 a 29 años                     0.069802429  4.808356e-07
    ## imp_po=imp_po_Positivo                    0.044608011  1.629669e-06
    ## strat=strat_Bajo                          0.022595051  7.156659e-06
    ## ethni=ethni_Sí                            0.054418125  2.537550e-05
    ## ideology=Derecha                          0.059205199  1.605818e-03
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo       0.141836719  1.435415e-02
    ## ethni=ethni_No                           -0.054418125  2.537550e-05
    ## imp_sci=imp_sci_Negativo                 -0.083247275  8.278026e-07
    ## age_r=De 21 a 24 años                    -0.052796841  1.928142e-07
    ## edu=edu_Sí                               -0.049499361  7.446334e-08
    ## imp_ac=imp_ac_Positivo                   -0.034682477  4.651622e-08
    ## strat=strat_Medio                        -0.057471388  1.458088e-08
    ## Zona=Urbana ciudades                     -0.087521549  6.040547e-13
    ## age_r=De 18 a 20 años                    -0.109228944  1.179578e-16
    ## ideology=Izquierda                       -0.110043132  3.102959e-23
    ## imp_sci=imp_sci_Positivo                 -0.051741579  1.850249e-25
    ## cont_clim=cont_clim_Correcta             -0.079750030  1.655741e-26
    ## kids=kids_No                             -0.081044016  7.862485e-30
    ## imp_ac=imp_ac_Negativo                   -0.113863653  1.606751e-35
    ## thoughts=thoughts_Negativos              -0.171525887  5.144518e-46
    ## imp_como=imp_como_Positivo               -0.127067708  2.705953e-49
    ## trust_vote_inst=trust_vote_inst_No       -0.130410256  6.874557e-56
    ## eco_anx=eco_anx_Negativas                -0.180322706  6.872619e-63
    ## Internet=Internet_Sí                     -0.152556746  1.669093e-73
    ## aso=aso_Sí                               -0.134150456  3.364121e-83
    ## clim_origin=clim_origin_Correcta         -0.171620644 2.466709e-146
    ## imp_re=imp_re_Negativo                   -0.241988541 9.097852e-160
    ## imp_po=imp_po_Negativo                   -0.227795101 2.741258e-177
    ## neg_emo_gov=neg_emo_gov_Alto             -0.313192054 1.410218e-199
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.462619238 1.041657e-299
    ## imp_po          0.432368467 2.413958e-273
    ## imp_ac          0.349340213 1.267279e-207
    ## imp_sci         0.338579916 9.980997e-200
    ## ideology        0.069446393  2.237888e-35
    ## ethni           0.035945240  2.064341e-19
    ## clim_origin     0.035405836  3.867162e-19
    ## strat           0.031063223  6.434216e-16
    ## edu             0.028576458  1.073142e-15
    ## trust_vote_inst 0.026314471  1.473022e-14
    ## age_r           0.026659301  6.198220e-13
    ## imp_como        0.021806578  2.705700e-12
    ## Internet        0.010183895  1.895090e-06
    ## thoughts        0.008411335  8.580788e-05
    ## cont_clim       0.005805323  3.266885e-04
    ## neg_emo_gov     0.004942459  4.118362e-03
    ## Zona            0.002954529  1.042163e-02
    ## aso             0.002119082  3.009164e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## imp_re=imp_re_Positivo                    0.341452968 6.107485e-300
    ## imp_po=imp_po_Positivo                    0.375125133 1.763213e-273
    ## imp_sci=imp_sci_Positivo                  0.250796444 6.638015e-196
    ## imp_ac=imp_ac_Positivo                    0.272338389 7.948125e-195
    ## ideology=Derecha                          0.136529660  8.827087e-35
    ## ethni=ethni_No                            0.103027858  2.064341e-19
    ## clim_origin=clim_origin_Correcta          0.056596537  3.867162e-19
    ## edu=edu_Sí                                0.065491565  1.073142e-15
    ## trust_vote_inst=trust_vote_inst_Sí        0.057958278  1.473022e-14
    ## age_r=De 30 a 32 años                     0.077377374  6.405235e-13
    ## imp_como=imp_como_Positivo                0.054677976  2.705700e-12
    ## strat=strat_Alto                          0.074540699  2.959678e-07
    ## strat=strat_Medio                         0.006545467  6.284299e-07
    ## Internet=Internet_Sí                      0.036958512  1.895090e-06
    ## cont_clim=cont_clim_Incorrecta            0.024242958  3.266885e-04
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.008458799  1.132329e-03
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo       0.061776036  1.499969e-03
    ## Zona=Urbana ciudades                      0.027895780  1.042163e-02
    ## aso=aso_Sí                                0.013981237  3.009164e-02
    ## thoughts=thoughts_Positivos               0.033577162  4.263793e-02
    ## eco_anx=eco_anx_Negativas                -0.019236812  4.675923e-02
    ## aso=aso_No                               -0.013981237  3.009164e-02
    ## Zona=Municipios rurales dispersos        -0.027895780  1.042163e-02
    ## age_r=De 25 a 29 años                    -0.024266410  2.933543e-03
    ## cont_clim=cont_clim_Correcta             -0.024242958  3.266885e-04
    ## thoughts=thoughts_Negativos              -0.042035960  2.389830e-05
    ## ideology=Centro                          -0.046890603  1.380759e-05
    ## age_r=De 18 a 20 años                    -0.054529045  7.568229e-06
    ## Internet=Internet_No                     -0.036958512  1.895090e-06
    ## ideology=Izquierda                       -0.089639058  1.439170e-09
    ## imp_como=imp_como_Negativo               -0.054677976  2.705700e-12
    ## imp_po=imp_po_Neutro                     -0.173417063  2.498575e-14
    ## trust_vote_inst=trust_vote_inst_No       -0.057958278  1.473022e-14
    ## strat=strat_Bajo                         -0.081086167  4.395501e-15
    ## edu=edu_No                               -0.065491565  1.073142e-15
    ## clim_origin=clim_origin_Incorrecta       -0.056596537  3.867162e-19
    ## ethni=ethni_Sí                           -0.103027858  2.064341e-19
    ## imp_ac=imp_ac_Neutro                     -0.085045169  9.730232e-23
    ## imp_sci=imp_sci_Negativo                 -0.172244583  2.749095e-35
    ## imp_re=imp_re_Neutro                     -0.156821655  2.696831e-39
    ## imp_re=imp_re_Negativo                   -0.184631313  1.303575e-42
    ## imp_po=imp_po_Negativo                   -0.201708070  2.017552e-48
    ## imp_ac=imp_ac_Negativo                   -0.187293220  1.661606e-59
    ## imp_sci=imp_sci_Neutro                   -0.078551861  2.406709e-99

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
    ## imp_po          0.369258906 1.364503e-222
    ## neg_emo_gov     0.345793466 5.247365e-205
    ## imp_re          0.305682983 2.327189e-176
    ## clim_origin     0.271243510 1.305050e-154
    ## imp_ac          0.141948440  1.993367e-74
    ## aso             0.136484324  9.634311e-73
    ## eco_anx         0.131482494  1.367893e-68
    ## Internet        0.120683985  5.539334e-64
    ## trust_vote_inst 0.114210423  1.941558e-60
    ## imp_como        0.093911849  1.748691e-49
    ## thoughts        0.089846957  4.768049e-46
    ## imp_sci         0.088283764  3.194956e-45
    ## ideology        0.052531084  1.052616e-26
    ## cont_clim       0.049481977  2.729241e-26
    ## age_r           0.010815444  2.377310e-05
    ## kids            0.006831406  9.667145e-05
    ## Zona            0.006313460  1.785369e-04
    ## edu             0.003436467  5.729437e-03
    ## ethni           0.002548805  1.736414e-02
    ## strat           0.002737500  4.789809e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                               Estimate       p.value
    ## imp_po=imp_po_Neutro                      0.2354087641 3.910894e-164
    ## clim_origin=clim_origin_Incorrecta        0.2118723849 1.305050e-154
    ## neg_emo_gov=neg_emo_gov_Medio             0.2133750651 6.886198e-152
    ## imp_re=imp_re_Neutro                      0.1880873983  7.238178e-93
    ## aso=aso_No                                0.1517593280  9.634311e-73
    ## imp_ac=imp_ac_Neutro                      0.1928328698  1.184555e-67
    ## Internet=Internet_No                      0.1720776998  5.539334e-64
    ## trust_vote_inst=trust_vote_inst_Sí        0.1633101829  1.941558e-60
    ## imp_como=imp_como_Negativo                0.1534691556  1.748691e-49
    ## eco_anx=eco_anx_Positivas                 0.1989161210  2.548000e-44
    ## imp_sci=imp_sci_Neutro                    0.1803898647  5.997668e-44
    ## cont_clim=cont_clim_Incorrecta            0.0957278190  2.729241e-26
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.0009195948  4.277946e-19
    ## thoughts=thoughts_Positivos               0.1973512103  1.881622e-18
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.0188346824  2.642779e-15
    ## ideology=Centro                           0.0697162492  6.742142e-12
    ## imp_re=imp_re_Positivo                    0.1149952182  1.011926e-10
    ## imp_po=imp_po_Positivo                    0.0593694056  1.567004e-07
    ## kids=kids_Sí                              0.0340049357  9.667145e-05
    ## Zona=Municipios rurales dispersos         0.0551531527  1.785369e-04
    ## ideology=Derecha                          0.0751113563  1.248563e-03
    ## edu=edu_No                                0.0307170475  5.729437e-03
    ## age_r=De 30 a 32 años                     0.0441812477  7.095373e-03
    ## age_r=De 25 a 29 años                     0.0407679559  1.275190e-02
    ## ethni=ethni_Sí                            0.0371060304  1.736414e-02
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo       0.1658904991  2.913009e-02
    ## strat=strat_Alto                          0.0427991700  3.850363e-02
    ## age_r=De 21 a 24 años                    -0.0268652190  2.704617e-02
    ## ethni=ethni_No                           -0.0371060304  1.736414e-02
    ## edu=edu_Sí                               -0.0307170475  5.729437e-03
    ## age_r=De 18 a 20 años                    -0.0580839846  2.830129e-04
    ## Zona=Urbana ciudades                     -0.0551531527  1.785369e-04
    ## kids=kids_No                             -0.0340049357  9.667145e-05
    ## imp_ac=imp_ac_Positivo                   -0.0285883731  2.098631e-06
    ## imp_sci=imp_sci_Negativo                 -0.1403953001  2.742037e-12
    ## imp_sci=imp_sci_Positivo                 -0.0399945646  1.621401e-21
    ## cont_clim=cont_clim_Correcta             -0.0957278190  2.729241e-26
    ## ideology=Izquierda                       -0.1448276055  7.738488e-28
    ## thoughts=thoughts_Negativos              -0.1982708050  2.296179e-40
    ## imp_ac=imp_ac_Negativo                   -0.1642444967  1.345738e-48
    ## imp_como=imp_como_Positivo               -0.1534691556  1.748691e-49
    ## trust_vote_inst=trust_vote_inst_No       -0.1633101829  1.941558e-60
    ## eco_anx=eco_anx_Negativas                -0.2177508034  1.777006e-62
    ## Internet=Internet_Sí                     -0.1720776998  5.539334e-64
    ## aso=aso_Sí                               -0.1517593280  9.634311e-73
    ## clim_origin=clim_origin_Correcta         -0.2118723849 1.305050e-154
    ## imp_re=imp_re_Negativo                   -0.3030826165 7.602275e-175
    ## neg_emo_gov=neg_emo_gov_Alto             -0.3792655642 4.030702e-206
    ## imp_po=imp_po_Negativo                   -0.2947781697 8.121882e-210
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.496544211  0.000000e+00
    ## imp_po          0.458565958 4.317682e-296
    ## imp_ac          0.355428276 3.777290e-212
    ## imp_sci         0.349637022 7.642167e-208
    ## ideology        0.061940980  1.648681e-31
    ## clim_origin     0.048204754  1.225635e-25
    ## imp_como        0.026207328  1.667486e-14
    ## trust_vote_inst 0.023813979  2.657365e-13
    ## thoughts        0.011361037  3.157296e-06
    ## ethni           0.007901522  2.738500e-05
    ## cont_clim       0.006495333  1.439005e-04
    ## Internet        0.006272081  1.875239e-04
    ## neg_emo_gov     0.004546301  6.402512e-03
    ## eco_anx         0.003571598  1.894521e-02
    ## age_r           0.003996937  3.097227e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                             Estimate       p.value
    ## imp_re=imp_re_Positivo                    0.42761206  0.000000e+00
    ## imp_po=imp_po_Positivo                    0.46969292 2.054618e-297
    ## imp_sci=imp_sci_Positivo                  0.30226386 6.069310e-207
    ## imp_ac=imp_ac_Positivo                    0.33404941 1.283518e-205
    ## ideology=Derecha                          0.15617737  4.235713e-32
    ## clim_origin=clim_origin_Correcta          0.08000038  1.225635e-25
    ## imp_como=imp_como_Positivo                0.07261472  1.667486e-14
    ## trust_vote_inst=trust_vote_inst_Sí        0.06679267  2.657365e-13
    ## ethni=ethni_No                            0.05851726  2.738500e-05
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.01373462  1.062378e-04
    ## cont_clim=cont_clim_Incorrecta            0.03106474  1.439005e-04
    ## Internet=Internet_Sí                      0.03513646  1.875239e-04
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo       0.07067571  1.509345e-03
    ## age_r=De 30 a 32 años                     0.03609239  5.353412e-03
    ## thoughts=thoughts_Positivos               0.04464566  2.561844e-02
    ## eco_anx=eco_anx_Negativas                -0.03251223  5.388607e-03
    ## Internet=Internet_No                     -0.03513646  1.875239e-04
    ## cont_clim=cont_clim_Correcta             -0.03106474  1.439005e-04
    ## ethni=ethni_Sí                           -0.05851726  2.738500e-05
    ## ideology=Izquierda                       -0.09297932  1.836077e-06
    ## thoughts=thoughts_Negativos              -0.05838028  7.723019e-07
    ## ideology=Centro                          -0.06319805  3.966034e-07
    ## trust_vote_inst=trust_vote_inst_No       -0.06679267  2.657365e-13
    ## imp_como=imp_como_Negativo               -0.07261472  1.667486e-14
    ## imp_po=imp_po_Neutro                     -0.22628627  4.730220e-19
    ## clim_origin=clim_origin_Incorrecta       -0.08000038  1.225635e-25
    ## imp_sci=imp_sci_Negativo                 -0.18947041  1.839646e-29
    ## imp_ac=imp_ac_Neutro                     -0.12078844  3.665468e-31
    ## imp_re=imp_re_Negativo                   -0.21256506  1.033368e-33
    ## imp_po=imp_po_Negativo                   -0.24340665  8.271499e-45
    ## imp_ac=imp_ac_Negativo                   -0.21326097  1.520697e-49
    ## imp_re=imp_re_Neutro                     -0.21504700  1.801686e-55
    ## imp_sci=imp_sci_Neutro                   -0.11279345 2.257059e-113

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

## Factor que más contribuye al cambio climático y emociones frente al cambio climático

|            | Negativas | Ambivalentes/Neutrales | Positivas |
|------------|----------:|-----------------------:|----------:|
| Correcta   |      24.6 |                    5.9 |       3.0 |
| Incorrecta |      46.6 |                   11.4 |       8.5 |

<img src="./figuresrelación contribucion al cambio climatico y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|     | Negativas | Ambivalentes/Neutrales | Positivas |
|-----|----------:|-----------------------:|----------:|
| Sí  |      42.7 |                    9.3 |       5.3 |
| No  |      28.5 |                    8.0 |       6.1 |

<img src="./figuresrelación unirse a una organización y emociones-1.png" width="80%" style="display: block; margin: auto;" />

|             | Negativas | Ambivalentes/Neutrales | Positivas |
|-------------|----------:|-----------------------:|----------:|
| Bajo o nulo |       2.5 |                    1.5 |       1.5 |
| Medio       |      50.8 |                   13.8 |       9.1 |
| Alto        |      17.9 |                    2.0 |       0.8 |

<img src="./figuresemociones gobierno y emociones-1.png" width="80%" style="display: block; margin: auto;" />

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

|          | Negativas | Ambivalentes/Neutrales | Positivas |
|----------|----------:|-----------------------:|----------:|
| Negativo |      13.7 |                    3.9 |       3.1 |
| Positivo |      57.5 |                   13.4 |       8.3 |

<img src="./figuresimpacto comodidad y emociones-1.png" width="80%" style="display: block; margin: auto;" />

## Nivel educativo y origen del cambio climático

|     | Correcta | Incorrecta |
|-----|---------:|-----------:|
| No  |     39.3 |       42.3 |
| Sí  |      8.2 |       10.3 |

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

|     | Correcta | Incorrecta |
|-----|---------:|-----------:|
| Sí  |     31.0 |       26.4 |
| No  |     16.4 |       26.2 |

<img src="./figuresrelación unirse a una organización y origen cambio climático-1.png" width="80%" style="display: block; margin: auto;" />

|             | Correcta | Incorrecta |
|-------------|---------:|-----------:|
| Bajo o nulo |      2.4 |        3.2 |
| Medio       |     30.3 |       43.5 |
| Alto        |     14.8 |        5.9 |

<img src="./figuresemociones gobierno y origen cambio climático-1.png" width="80%" style="display: block; margin: auto;" />

|          | Correcta | Incorrecta |
|----------|---------:|-----------:|
| Negativo |      5.9 |       14.9 |
| Positivo |     41.6 |       37.7 |

<img src="./figuresimpacto comodidad y origen cambio climático-1.png" width="80%" style="display: block; margin: auto;" />

# Tests de chi-cuadrado

Se realizaron múltiples test de chi-cuadrado para establecer si existen
relaciones significativas entre las principales variables de interés y
las demás variables. Dado el alto número de tests se utilizó la
corrección propuesta por Benjamini y Hochberg.

## Tests para la variable origen del cambio climático

| Variable                                                |   P-value |
|:--------------------------------------------------------|----------:|
| Edad                                                    | 0.0015206 |
| Estrato                                                 | 0.0104604 |
| Etnia                                                   | 0.0040972 |
| Ideología                                               | 0.0040972 |
| Internet                                                | 0.0000000 |
| Confianza Instituciones                                 | 0.0000085 |
| Emociones cambio climático                              | 0.0000136 |
| Impacto científicos                                     | 0.0000000 |
| Impacto activistas                                      | 0.0002106 |
| Impacto grupos religiosos                               | 0.0000000 |
| Impacto políticos                                       | 0.0000000 |
| Pensamientos cambio climático                           | 0.0000136 |
| Contribución cambio climático                           | 0.0001570 |
| Unirse a una organización ambiental                     | 0.0000000 |
| Emociones negativas hacia gobierno por cambio climático | 0.0000000 |
| Impacto en comodidad                                    | 0.0000000 |

## Tests para la variable emociones frente al cambio climático

| Variable                                                |   P-value |
|:--------------------------------------------------------|----------:|
| Educación                                               | 0.0224469 |
| Ideología                                               | 0.0008551 |
| Internet                                                | 0.0162200 |
| Confianza Instituciones                                 | 0.0000423 |
| Impacto grupos religiosos                               | 0.0073884 |
| Impacto políticos                                       | 0.0424036 |
| Pensamientos cambio climático                           | 0.0000000 |
| Origen cambio climático                                 | 0.0000423 |
| Contribución cambio climático                           | 0.0424036 |
| Unirse a una organización ambiental                     | 0.0003034 |
| Emociones negativas hacia gobierno por cambio climático | 0.0000000 |
| Impacto en comodidad                                    | 0.0223873 |

# Calculo de multiples Cramér’s V

Se calcularon los tamaños del efecto de las distintas asociaciones entre
las principales variables de interés y las demás variables. La medida
del tamaño del efecto utilizada fue Cramér’s V.

## Valores para la variable origen del cambio climático

| Variable                                                | Cramér’s V |
|:--------------------------------------------------------|-----------:|
| Edad                                                    |  0.0773886 |
| Estrato                                                 |  0.0583911 |
| Etnia                                                   |  0.0608797 |
| Ideología                                               |  0.0657453 |
| Internet                                                |  0.1443268 |
| Confianza Instituciones                                 |  0.0973730 |
| Emociones cambio climático                              |  0.0991216 |
| Impacto científicos                                     |  0.1489673 |
| Impacto activistas                                      |  0.0847853 |
| Impacto grupos religiosos                               |  0.1506780 |
| Impacto políticos                                       |  0.1931039 |
| Pensamientos cambio climático                           |  0.0994835 |
| Contribución cambio climático                           |  0.0815839 |
| Unirse a una organización ambiental                     |  0.1512568 |
| Emociones negativas hacia gobierno por cambio climático |  0.2440540 |
| Impacto en comodidad                                    |  0.1960790 |

## Valores para la variable emociones frente al cambio climático

| Variable                                                | Cramér’s V |
|:--------------------------------------------------------|-----------:|
| Educación                                               |  0.0560797 |
| Ideología                                               |  0.0627360 |
| Internet                                                |  0.0603232 |
| Confianza Instituciones                                 |  0.0981141 |
| Impacto grupos religiosos                               |  0.0527561 |
| Impacto políticos                                       |  0.0401935 |
| Pensamientos cambio climático                           |  0.2294467 |
| Origen cambio climático                                 |  0.0991216 |
| Contribución cambio climático                           |  0.0490642 |
| Unirse a una organización ambiental                     |  0.0874568 |
| Emociones negativas hacia gobierno por cambio climático |  0.1505289 |
| Impacto en comodidad                                    |  0.0569411 |

# Relación variables con nueva variable para emociones frente al cambio climático

Los análisis anteriores se realizaron nuevamente pero modificando la
variable de las emociones frente al cambio climático, incluyendo esta
vez la clasificación basada en el modelo “Circumplex model of affect”.

## Análisis de correspondencia múltiple

<img src="./figuresanálisis de componentes múltiples nueva variable emociones-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-2.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-3.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples nueva variable emociones-7.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## neg_emo_gov     0.340672902 2.974237e-201
    ## imp_po          0.316367891 7.955884e-184
    ## imp_re          0.277776143 2.176325e-157
    ## clim_origin     0.258932678 1.562815e-146
    ## cir_mod2        0.180352232  3.548368e-89
    ## aso             0.157525113  1.179963e-84
    ## Internet        0.134099020  2.071152e-71
    ## imp_ac          0.109251188  2.012319e-56
    ## trust_vote_inst 0.106812997  2.032794e-56
    ## thoughts        0.103083512  4.222800e-53
    ## imp_como        0.093727641  2.193015e-49
    ## imp_sci         0.076302547  6.162028e-39
    ## kids            0.054957747  4.275672e-29
    ## age_r           0.057151267  4.348504e-28
    ## cont_clim       0.048640628  7.342219e-26
    ## ideology        0.042310087  1.541049e-21
    ## Zona            0.025940431  2.270920e-14
    ## strat           0.015702940  2.400929e-08
    ## edu             0.011691966  3.276101e-07
    ## ethni           0.007172927  6.458279e-05
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                         Estimate       p.value
    ## neg_emo_gov=neg_emo_gov_Medio        0.172806972 9.231582e-147
    ## clim_origin=clim_origin_Incorrecta   0.172914682 1.562815e-146
    ## imp_po=imp_po_Neutro                 0.179722453 1.575534e-135
    ## aso=aso_No                           0.136186064  1.179963e-84
    ## imp_re=imp_re_Neutro                 0.146126958  7.493970e-81
    ## Internet=Internet_No                 0.151515245  2.071152e-71
    ## trust_vote_inst=trust_vote_inst_Sí   0.131921690  2.032794e-56
    ## imp_ac=imp_ac_Neutro                 0.143884115  1.545786e-53
    ## imp_como=imp_como_Negativo           0.128067376  2.193015e-49
    ## imp_sci=imp_sci_Neutro               0.133013628  9.102834e-40
    ## kids=kids_Sí                         0.080564765  4.275672e-29
    ## cont_clim=cont_clim_Incorrecta       0.079278969  7.342219e-26
    ## thoughts=Ambivalentes/Neutrales      0.011824313  9.195200e-25
    ## cir_mod2=Pos act                     0.137880664  4.024760e-21
    ## thoughts=Positivos                   0.162422032  4.495413e-18
    ## Zona=Municipios rurales dispersos    0.093383246  2.270920e-14
    ## age_r=De 30 a 32 años                0.093594085  2.236178e-12
    ## cir_mod2=Pos act y no act            0.190672416  3.877945e-12
    ## imp_re=imp_re_Positivo               0.096900755  3.647611e-11
    ## cir_mod2=Neg act y pos act           0.037693967  3.386419e-10
    ## cir_mod2=Pos no act                  0.165267838  6.961600e-10
    ## ideology=Centro                      0.046520008  2.216017e-08
    ## imp_po=imp_po_Positivo               0.049665573  2.978007e-07
    ## edu=edu_No                           0.047327215  3.276101e-07
    ## age_r=De 25 a 29 años                0.069521392  6.312836e-07
    ## strat=strat_Bajo                     0.021239451  5.906738e-06
    ## ethni=ethni_Sí                       0.051995792  6.458279e-05
    ## ideology=Derecha                     0.063781303  3.825619e-04
    ## cir_mod2=Neg no act y pos no act     0.112891782  8.783472e-03
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo  0.145174326  1.125082e-02
    ## strat=strat_Alto                     0.040232244  2.563472e-02
    ## cir_mod2=Neg no act y pos act       -0.007949741  4.205880e-02
    ## cir_mod2=Neg act                    -0.057474333  6.347023e-04
    ## ethni=ethni_No                      -0.051995792  6.458279e-05
    ## imp_sci=imp_sci_Negativo            -0.083262268  9.620236e-07
    ## imp_ac=imp_ac_Positivo              -0.030607838  5.551028e-07
    ## edu=edu_Sí                          -0.047327215  3.276101e-07
    ## age_r=De 21 a 24 años               -0.056626992  4.721902e-08
    ## strat=strat_Medio                   -0.061471695  4.104231e-09
    ## cir_mod2=Neg no act                 -0.269848404  5.796326e-10
    ## Zona=Urbana ciudades                -0.093383246  2.270920e-14
    ## age_r=De 18 a 20 años               -0.106488485  9.314052e-16
    ## ideology=Izquierda                  -0.110301311  1.891525e-22
    ## imp_sci=imp_sci_Positivo            -0.049751360  5.832688e-24
    ## cont_clim=cont_clim_Correcta        -0.079278969  7.342219e-26
    ## kids=kids_No                        -0.080564765  4.275672e-29
    ## imp_ac=imp_ac_Negativo              -0.113276277  2.762620e-34
    ## thoughts=Negativos                  -0.174246345  1.852781e-48
    ## imp_como=imp_como_Positivo          -0.128067376  2.193015e-49
    ## cir_mod2=Neg act y no act           -0.241225727  2.235970e-54
    ## trust_vote_inst=trust_vote_inst_No  -0.131921690  2.032794e-56
    ## Internet=Internet_Sí                -0.151515245  2.071152e-71
    ## aso=aso_Sí                          -0.136186064  1.179963e-84
    ## clim_origin=clim_origin_Correcta    -0.172914682 1.562815e-146
    ## imp_re=imp_re_Negativo              -0.243027713 5.227501e-157
    ## imp_po=imp_po_Negativo              -0.229388026 5.709483e-175
    ## neg_emo_gov=neg_emo_gov_Alto        -0.317981298 1.244623e-202
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.455617550 1.777101e-293
    ## imp_po          0.422841207 2.488045e-265
    ## imp_ac          0.348590368 4.543115e-207
    ## imp_sci         0.334555806 8.303340e-197
    ## ideology        0.071284975  2.498733e-36
    ## clim_origin     0.040466368  1.060732e-21
    ## cir_mod2        0.042852971  6.511951e-17
    ## strat           0.032872808  8.101475e-17
    ## ethni           0.029759814  2.722911e-16
    ## imp_como        0.028506465  1.163792e-15
    ## age_r           0.029247234  3.393462e-14
    ## edu             0.025489057  3.828461e-14
    ## trust_vote_inst 0.023417570  4.202518e-13
    ## Internet        0.009182370  6.101886e-06
    ## cont_clim       0.004464421  1.633132e-03
    ## thoughts        0.005692310  1.785685e-03
    ## Zona            0.004243898  2.133628e-03
    ## aso             0.002210881  2.673171e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                         Estimate       p.value
    ## imp_re=imp_re_Positivo               0.340626131 8.331744e-294
    ## imp_po=imp_po_Positivo               0.373224379 7.894701e-266
    ## imp_ac=imp_ac_Positivo               0.273166650 5.345436e-193
    ## imp_sci=imp_sci_Positivo             0.251323562 1.533737e-192
    ## ideology=Derecha                     0.139173734  2.644119e-36
    ## clim_origin=clim_origin_Correcta     0.060821802  1.060732e-21
    ## ethni=ethni_No                       0.094234259  2.722911e-16
    ## imp_como=imp_como_Positivo           0.062842013  1.163792e-15
    ## age_r=De 30 a 32 años                0.083471012  1.168648e-14
    ## edu=edu_Sí                           0.062175285  3.828461e-14
    ## trust_vote_inst=trust_vote_inst_Sí   0.054960263  4.202518e-13
    ## strat=strat_Medio                    0.010177713  6.959788e-08
    ## strat=strat_Alto                     0.072963312  5.597733e-07
    ## Internet=Internet_Sí                 0.035277246  6.101886e-06
    ## cir_mod2=Neg act y pos act           0.105772884  6.366181e-06
    ## cir_mod2=Pos act                     0.093319846  1.010973e-03
    ## cont_clim=cont_clim_Incorrecta       0.021370501  1.633132e-03
    ## Zona=Urbana ciudades                 0.033607530  2.133628e-03
    ## thoughts=Ambivalentes/Neutrales      0.014034210  2.175517e-03
    ## cir_mod2=Neg act                     0.045141149  1.257536e-02
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo  0.044895525  1.940370e-02
    ## aso=aso_Sí                           0.014355363  2.673171e-02
    ## aso=aso_No                          -0.014355363  2.673171e-02
    ## age_r=De 25 a 29 años               -0.021885594  5.685047e-03
    ## Zona=Municipios rurales dispersos   -0.033607530  2.133628e-03
    ## cir_mod2=Neg act y no act           -0.006690255  1.655716e-03
    ## cont_clim=cont_clim_Correcta        -0.021370501  1.633132e-03
    ## thoughts=Negativos                  -0.031110138  3.763674e-04
    ## age_r=De 18 a 20 años               -0.054968981  6.155324e-06
    ## Internet=Internet_No                -0.035277246  6.101886e-06
    ## ideology=Centro                     -0.051799676  9.774403e-07
    ## ideology=Izquierda                  -0.087374058  1.501865e-08
    ## cir_mod2=Pos no act                 -0.246605947  1.312394e-12
    ## trust_vote_inst=trust_vote_inst_No  -0.054960263  4.202518e-13
    ## edu=edu_No                          -0.062175285  3.828461e-14
    ## imp_po=imp_po_Neutro                -0.174075166  9.048001e-15
    ## imp_como=imp_como_Negativo          -0.062842013  1.163792e-15
    ## strat=strat_Bajo                    -0.083141025  2.762855e-16
    ## ethni=ethni_Sí                      -0.094234259  2.722911e-16
    ## imp_ac=imp_ac_Neutro                -0.082908769  2.043898e-21
    ## clim_origin=clim_origin_Incorrecta  -0.060821802  1.060732e-21
    ## imp_sci=imp_sci_Negativo            -0.174775252  6.596674e-36
    ## imp_re=imp_re_Neutro                -0.156736172  6.262549e-39
    ## imp_re=imp_re_Negativo              -0.183889959  9.845473e-42
    ## imp_po=imp_po_Negativo              -0.199149213  4.839320e-46
    ## imp_ac=imp_ac_Negativo              -0.190257881  2.276999e-61
    ## imp_sci=imp_sci_Neutro              -0.076548309  1.314229e-96

## Análisis con las variables sociodemográficas como variables suplementarias

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-2.png" width="80%" />

    ## Warning: ggrepel: 16 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-3.png" width="80%" />

    ## Warning: ggrepel: 7 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2 nueva variable emociones-7.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.361534658 9.879330e-217
    ## neg_emo_gov     0.350490068 1.783838e-208
    ## imp_re          0.299125251 7.805464e-172
    ## clim_origin     0.273416041 4.741745e-156
    ## cir_mod2        0.180432671  3.188631e-89
    ## aso             0.139833875  1.278553e-74
    ## imp_ac          0.133291311  1.356398e-69
    ## Internet        0.117848435  1.991658e-62
    ## trust_vote_inst 0.114374825  1.579216e-60
    ## imp_como        0.094564570  7.836875e-50
    ## thoughts        0.093189465  8.074276e-48
    ## imp_sci         0.085132344  1.464357e-43
    ## ideology        0.050769525  8.250865e-26
    ## cont_clim       0.048450939  9.176623e-26
    ## age_r           0.011090593  1.767141e-05
    ## Zona            0.007471752  4.540712e-05
    ## kids            0.006850936  9.446484e-05
    ## edu             0.003128335  8.391499e-03
    ## ethni           0.002343203  2.255896e-02
    ## strat           0.003194489  2.881787e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                         Estimate       p.value
    ## imp_po=imp_po_Neutro                 0.231747454 3.942006e-158
    ## clim_origin=clim_origin_Incorrecta   0.214169132 4.741745e-156
    ## neg_emo_gov=neg_emo_gov_Medio        0.215675497 5.799510e-154
    ## imp_re=imp_re_Neutro                 0.184280541  1.488656e-88
    ## aso=aso_No                           0.154657295  1.278553e-74
    ## imp_ac=imp_ac_Neutro                 0.187319780  7.976461e-63
    ## Internet=Internet_No                 0.171203203  1.991658e-62
    ## trust_vote_inst=trust_vote_inst_Sí   0.164541639  1.579216e-60
    ## imp_como=imp_como_Negativo           0.155051274  7.836875e-50
    ## imp_sci=imp_sci_Neutro               0.178347265  2.233205e-42
    ## cont_clim=cont_clim_Incorrecta       0.095370914  9.176623e-26
    ## cir_mod2=Pos act                     0.173857716  2.133028e-22
    ## thoughts=Ambivalentes/Neutrales      0.007526089  3.533466e-21
    ## thoughts=Positivos                   0.193977703  1.047042e-17
    ## imp_re=imp_re_Positivo               0.119010859  1.897776e-11
    ## cir_mod2=Pos no act                  0.221966784  3.112191e-11
    ## cir_mod2=Pos act y no act            0.208674102  6.294827e-11
    ## ideology=Centro                      0.064337504  1.905770e-10
    ## cir_mod2=Neg act y pos act           0.027198142  2.020838e-08
    ## imp_po=imp_po_Positivo               0.063708335  4.666213e-08
    ## Zona=Municipios rurales dispersos    0.060408498  4.540712e-05
    ## kids=kids_Sí                         0.034285626  9.446484e-05
    ## ideology=Derecha                     0.080517825  2.933259e-04
    ## age_r=De 30 a 32 años                0.046069882  4.966278e-03
    ## cir_mod2=Neg no act y pos act        0.025554177  6.304363e-03
    ## edu=edu_No                           0.029507354  8.391499e-03
    ## cir_mod2=Neg no act y pos no act     0.127315362  1.103586e-02
    ## age_r=De 25 a 29 años                0.040972013  1.290710e-02
    ## ethni=ethni_Sí                       0.035820481  2.255896e-02
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo  0.169289100  2.495523e-02
    ## strat=strat_Alto                     0.046339598  2.607588e-02
    ## strat=strat_Medio                   -0.036512122  4.596982e-02
    ## ethni=ethni_No                      -0.035820481  2.255896e-02
    ## age_r=De 21 a 24 años               -0.030339210  1.548661e-02
    ## edu=edu_Sí                          -0.029507354  8.391499e-03
    ## cir_mod2=Neg act                    -0.071546738  8.465483e-04
    ## age_r=De 18 a 20 años               -0.056702685  4.133655e-04
    ## kids=kids_No                        -0.034285626  9.446484e-05
    ## Zona=Urbana ciudades                -0.060408498  4.540712e-05
    ## imp_ac=imp_ac_Positivo              -0.025119962  1.116182e-05
    ## cir_mod2=Neg no act                 -0.339289189  4.753968e-11
    ## imp_sci=imp_sci_Negativo            -0.138801612  6.750468e-12
    ## imp_sci=imp_sci_Positivo            -0.039545653  8.599448e-21
    ## cont_clim=cont_clim_Correcta        -0.095370914  9.176623e-26
    ## ideology=Izquierda                  -0.144855329  7.791808e-27
    ## thoughts=Negativos                  -0.201503792  6.824044e-43
    ## imp_ac=imp_ac_Negativo              -0.162199818  2.012664e-46
    ## imp_como=imp_como_Positivo          -0.155051274  7.836875e-50
    ## cir_mod2=Neg act y no act           -0.288655132  2.626716e-52
    ## trust_vote_inst=trust_vote_inst_No  -0.164541639  1.579216e-60
    ## Internet=Internet_Sí                -0.171203203  1.991658e-62
    ## aso=aso_Sí                          -0.154657295  1.278553e-74
    ## clim_origin=clim_origin_Correcta    -0.214169132 4.741745e-156
    ## imp_re=imp_re_Negativo              -0.303291400 5.360172e-171
    ## imp_po=imp_po_Negativo              -0.295455789 1.521107e-205
    ## neg_emo_gov=neg_emo_gov_Alto        -0.384964598 1.274863e-209
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_re          0.488647634 1.482197e-323
    ## imp_po          0.447787761 1.332084e-286
    ## imp_ac          0.354084054 3.802795e-211
    ## imp_sci         0.343864125 1.372807e-203
    ## ideology        0.063210806  3.672956e-32
    ## clim_origin     0.052300408  9.862384e-28
    ## cir_mod2        0.048994348  8.395926e-20
    ## imp_como        0.032021769  1.974253e-17
    ## trust_vote_inst 0.022237918  1.643463e-12
    ## thoughts        0.008282471  9.910290e-05
    ## ethni           0.006507895  1.417743e-04
    ## Internet        0.005370718  5.489237e-04
    ## cont_clim       0.005191453  6.804018e-04
    ## age_r           0.004216200  2.481219e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                        Estimate       p.value
    ## imp_re=imp_re_Positivo               0.42686891  0.000000e+00
    ## imp_po=imp_po_Positivo               0.46673776 7.765918e-288
    ## imp_ac=imp_ac_Positivo               0.33514546 8.076233e-203
    ## imp_sci=imp_sci_Positivo             0.30337373 5.067628e-202
    ## ideology=Derecha                     0.15837253  5.292734e-33
    ## clim_origin=clim_origin_Correcta     0.08382419  9.862384e-28
    ## imp_como=imp_como_Positivo           0.08074315  1.974253e-17
    ## trust_vote_inst=trust_vote_inst_Sí   0.06492764  1.643463e-12
    ## cir_mod2=Neg act y pos act           0.13720350  2.535049e-07
    ## ethni=ethni_No                       0.05342181  1.417743e-04
    ## cir_mod2=Pos act                     0.11857971  2.144645e-04
    ## thoughts=Ambivalentes/Neutrales      0.01940554  2.591759e-04
    ## Internet=Internet_Sí                 0.03270680  5.489237e-04
    ## cont_clim=cont_clim_Incorrecta       0.02793709  6.804018e-04
    ## age_r=De 30 a 32 años                0.03828895  3.371920e-03
    ## neg_emo_gov=neg_emo_gov_Bajo o nulo  0.05202958  1.753968e-02
    ## strat=strat_Bajo                    -0.02242607  3.097832e-02
    ## cir_mod2=Neg no act y pos act       -0.08206538  3.044905e-02
    ## cont_clim=cont_clim_Correcta        -0.02793709  6.804018e-04
    ## Internet=Internet_No                -0.03270680  5.489237e-04
    ## cir_mod2=Neg act y no act           -0.01724762  5.002381e-04
    ## ethni=ethni_Sí                      -0.05342181  1.417743e-04
    ## thoughts=Negativos                  -0.04616882  1.798138e-05
    ## ideology=Izquierda                  -0.09063288  8.476007e-06
    ## ideology=Centro                     -0.06773965  4.254481e-08
    ## trust_vote_inst=trust_vote_inst_No  -0.06492764  1.643463e-12
    ## cir_mod2=Pos no act                 -0.32373784  5.597634e-14
    ## imp_como=imp_como_Negativo          -0.08074315  1.974253e-17
    ## imp_po=imp_po_Neutro                -0.22387892  3.405883e-18
    ## clim_origin=clim_origin_Incorrecta  -0.08382419  9.862384e-28
    ## imp_ac=imp_ac_Neutro                -0.11610783  1.857969e-28
    ## imp_sci=imp_sci_Negativo            -0.19519840  8.701950e-31
    ## imp_re=imp_re_Negativo              -0.21383831  3.718167e-34
    ## imp_po=imp_po_Negativo              -0.24285884  1.986362e-44
    ## imp_ac=imp_ac_Negativo              -0.21903763  1.210649e-52
    ## imp_re=imp_re_Neutro                -0.21303060  2.373368e-53
    ## imp_sci=imp_sci_Neutro              -0.10817533 1.678489e-108

# Exploración visual de relaciones

## Origen del cambio climático y emociones frente al cambio climático

|            | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Correcta   |    12.7 |             19.5 |               4.7 |                  0.9 |        3.6 |                  1.0 |                     0.4 |     2.9 |              1.2 |        0.6 |
| Incorrecta |    16.5 |             16.4 |               5.5 |                  0.8 |        2.6 |                  1.7 |                     0.5 |     4.8 |              1.7 |        2.2 |

<img src="./figuresrelación origen cambio climatico y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Pensamientos frente al cambio climático y emociones frente al cambio climático

|                        | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|------------------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Negativos              |    15.3 |             22.3 |               4.1 |                  0.5 |        3.9 |                  1.2 |                     0.3 |     1.9 |              0.6 |        0.6 |
| Ambivalentes/Neutrales |    12.7 |             12.6 |               5.5 |                  1.0 |        2.0 |                  1.4 |                     0.4 |     4.0 |              1.7 |        1.6 |
| Positivos              |     1.1 |              1.0 |               0.6 |                  0.1 |        0.3 |                  0.1 |                     0.1 |     1.8 |              0.6 |        0.6 |

<img src="./figuresrelación pensamientos y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Ideología política y emociones frente al cambio climático

|           | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-----------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Derecha   |     6.0 |              5.6 |               2.3 |                  0.3 |        0.7 |                  0.9 |                     0.3 |     2.1 |              0.7 |        0.3 |
| Centro    |    15.6 |             20.5 |               5.9 |                  1.1 |        3.7 |                  1.4 |                     0.5 |     4.0 |              1.8 |        1.9 |
| Izquierda |     7.6 |              9.9 |               2.0 |                  0.3 |        1.7 |                  0.4 |                     0.1 |     1.6 |              0.5 |        0.6 |

<img src="./figuresrelación ideologia y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Impacto en comodidad de acciones individuales y emociones frente al cambio climático

|          | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|----------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Negativo |     6.1 |              6.7 |               1.7 |                  0.5 |        0.9 |                  0.5 |                     0.3 |     1.8 |              1.0 |        1.2 |
| Positivo |    23.0 |             29.2 |               8.5 |                  1.2 |        5.2 |                  2.2 |                     0.5 |     5.8 |              1.9 |        1.6 |

<img src="./figuresdisposicion a actuar y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Factor que más contribuye al cambio climático y emociones frente al cambio climático

|            | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Correcta   |     9.7 |             12.3 |               3.7 |                  0.5 |        2.6 |                  0.7 |                     0.3 |     2.0 |              0.6 |        0.9 |
| Incorrecta |    19.4 |             23.6 |               6.5 |                  1.1 |        3.5 |                  2.0 |                     0.5 |     5.6 |              2.3 |        1.9 |

<img src="./figuresrelación contribucion al cambio climatico y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Uso de internet como fuente de información y emociones frente al cambio climático

|     | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-----|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| No  |     6.3 |              6.8 |               2.6 |                  0.4 |        0.9 |                  0.5 |                     0.2 |     2.1 |              1.0 |        0.5 |
| Sí  |    22.8 |             29.1 |               7.6 |                  1.3 |        5.2 |                  2.2 |                     0.6 |     5.6 |              1.9 |        2.3 |

<img src="./figuresrelación internet y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Confianza en Instituciones y emociones frente al cambio climático

|     | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-----|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| No  |    22.3 |             29.5 |               7.2 |                  1.4 |        4.9 |                  1.9 |                     0.6 |     5.2 |              1.9 |        2.1 |
| Sí  |     6.8 |              6.4 |               3.0 |                  0.3 |        1.2 |                  0.8 |                     0.2 |     2.5 |              1.0 |        0.7 |

<img src="./figuresconfianza instituciones y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Zona de residencia y emociones frente al cambio climático

|                              | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|------------------------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Municipios rurales dispersos |     3.4 |              2.8 |               0.9 |                  0.2 |        0.3 |                  0.4 |                     0.0 |     0.7 |              0.5 |        0.4 |
| Urbana ciudades              |    25.8 |             33.2 |               9.3 |                  1.5 |        5.9 |                  2.3 |                     0.8 |     7.0 |              2.5 |        2.4 |

<img src="./figureszona y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Rango de edad y emociones frente al cambio climático

|                 | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-----------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| De 18 a 20 años |     5.6 |              6.8 |               1.6 |                  0.2 |        1.0 |                  0.5 |                     0.2 |     1.4 |              0.5 |        0.6 |
| De 21 a 24 años |     6.0 |              9.3 |               2.2 |                  0.5 |        1.6 |                  0.9 |                     0.0 |     1.5 |              0.8 |        0.7 |
| De 25 a 29 años |     8.6 |             10.3 |               3.1 |                  0.5 |        1.8 |                  0.5 |                     0.2 |     2.6 |              0.9 |        0.9 |
| De 30 a 32 años |     8.9 |              9.5 |               3.4 |                  0.5 |        1.7 |                  0.7 |                     0.3 |     2.2 |              0.6 |        0.7 |

<img src="./figuresedad y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

|     | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-----|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Sí  |    15.9 |             23.0 |               5.2 |                  0.9 |        3.9 |                  1.9 |                     0.4 |     3.6 |              1.4 |        1.1 |
| No  |    13.3 |             12.9 |               5.0 |                  0.7 |        2.3 |                  0.8 |                     0.4 |     4.0 |              1.5 |        1.7 |

<img src="./figuresrelación unirse a una organización y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

|             | Neg act | Neg act y no act | Neg act y pos act | Neg act y pos no act | Neg no act | Neg no act y pos act | Neg no act y pos no act | Pos act | Pos act y no act | Pos no act |
|-------------|--------:|-----------------:|------------------:|---------------------:|-----------:|---------------------:|------------------------:|--------:|-----------------:|-----------:|
| Bajo o nulo |     0.9 |              1.2 |               0.6 |                  0.2 |        0.4 |                  0.1 |                     0.2 |     0.9 |              0.7 |        0.4 |
| Medio       |    22.8 |             24.0 |               8.3 |                  1.2 |        4.0 |                  2.4 |                     0.5 |     6.1 |              2.1 |        2.3 |
| Alto        |     5.4 |             10.8 |               1.3 |                  0.3 |        1.7 |                  0.2 |                     0.1 |     0.6 |              0.1 |        0.1 |

<img src="./figuresemociones gobierno y emociones 2-1.png" width="80%" style="display: block; margin: auto;" />

## Tests de Chi-cuadrado para la variable origen del cambio climático

| Variable                                                |   P-value |
|:--------------------------------------------------------|----------:|
| Edad                                                    | 0.0015206 |
| Estrato                                                 | 0.0104604 |
| Etnia                                                   | 0.0040972 |
| Ideología                                               | 0.0040972 |
| Internet                                                | 0.0000000 |
| Confianza Instituciones                                 | 0.0000076 |
| Emociones cambio climático                              | 0.0000001 |
| Impacto científicos                                     | 0.0000000 |
| Impacto activistas                                      | 0.0002106 |
| Impacto grupos religiosos                               | 0.0000000 |
| Impacto políticos                                       | 0.0000000 |
| Pensamientos cambio climático                           | 0.0000125 |
| Contribución cambio climático                           | 0.0001570 |
| Unirse a una organización ambiental                     | 0.0000000 |
| Emociones negativas hacia gobierno por cambio climático | 0.0000000 |
| Impacto en comodidad                                    | 0.0000000 |

## Tests de Chi-cuadrado para la variable emociones frente al cambio climático

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

| Variable                                                |   P-value |
|:--------------------------------------------------------|----------:|
| Ideología                                               | 0.0003686 |
| Confianza Instituciones                                 | 0.0003686 |
| Impacto grupos religiosos                               | 0.0005449 |
| Impacto políticos                                       | 0.0239998 |
| Pensamientos cambio climático                           | 0.0000000 |
| Origen cambio climático                                 | 0.0000002 |
| Unirse a una organización ambiental                     | 0.0000051 |
| Emociones negativas hacia gobierno por cambio climático | 0.0000000 |
| Impacto en comodidad                                    | 0.0001178 |

## Valores de Cramers’ V para la variable origen del cambio climático

| Variable                                                | Cramér’s V |
|:--------------------------------------------------------|-----------:|
| Edad                                                    |  0.0773886 |
| Estrato                                                 |  0.0583911 |
| Etnia                                                   |  0.0608797 |
| Ideología                                               |  0.0657453 |
| Internet                                                |  0.1443268 |
| Confianza Instituciones                                 |  0.0973730 |
| Emociones cambio climático                              |  0.1409398 |
| Impacto científicos                                     |  0.1489673 |
| Impacto activistas                                      |  0.0847853 |
| Impacto grupos religiosos                               |  0.1506780 |
| Impacto políticos                                       |  0.1931039 |
| Pensamientos cambio climático                           |  0.0994835 |
| Contribución cambio climático                           |  0.0815839 |
| Unirse a una organización ambiental                     |  0.1512568 |
| Emociones negativas hacia gobierno por cambio climático |  0.2440540 |
| Impacto en comodidad                                    |  0.1960790 |

## Valores de Cramers’ V para la variable emociones frente al cambio climático

| Variable                                                | Cramér’s V |
|:--------------------------------------------------------|-----------:|
| Ideología                                               |  0.0830557 |
| Confianza Instituciones                                 |  0.1041770 |
| Impacto grupos religiosos                               |  0.0807225 |
| Impacto políticos                                       |  0.0610437 |
| Pensamientos cambio climático                           |  0.2343047 |
| Origen cambio climático                                 |  0.1409398 |
| Unirse a una organización ambiental                     |  0.1269456 |
| Emociones negativas hacia gobierno por cambio climático |  0.1864907 |
| Impacto en comodidad                                    |  0.1117739 |
