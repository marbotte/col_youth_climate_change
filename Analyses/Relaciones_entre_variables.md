Encuesta: Relaciones entre variables
================
Juan Sebastian Cely
2023-07-12

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
| med                   | Tipo de medios de información utilizado                    |
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
| med             | Fuentes validadas            |        603 |
| med             | Fuentes mixtas               |       1114 |
| med             | Fuentes no validadas         |        503 |
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

<img src="./figuresanálisis de componentes múltiples-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-2.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-3.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-8.png" width="80%" /><img src="./figuresanálisis de componentes múltiples-9.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.273987002 1.980906e-156
    ## imp_re          0.267864824 2.218919e-152
    ## clim_origin     0.208268129 1.235954e-114
    ## env_aso         0.145875363  5.044833e-78
    ## age_r           0.131354602  2.359930e-67
    ## imp_com         0.123341198  1.910334e-65
    ## kids            0.114141269  2.117779e-60
    ## thoughts        0.116378248  2.730879e-60
    ## imp_cl          0.110215183  2.905890e-58
    ## trust_vote_inst 0.099152862  2.735718e-52
    ## eco_anx         0.098175142  1.790445e-50
    ## imp_ac          0.093165429  4.375494e-49
    ## med             0.081639292  1.000545e-41
    ## cont_clim       0.061133462  2.821617e-32
    ## ideology        0.038093164  2.008829e-19
    ## imp_sci         0.027738571  2.832520e-15
    ## Zona            0.023485690  3.884226e-13
    ## strat           0.017116589  4.880592e-09
    ## sex             0.002061332  3.242810e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                              Estimate       p.value
    ## imp_po=imp_po_Positivo                    0.180685021 1.980906e-156
    ## imp_re=imp_re_Positivo                    0.165035202 2.218919e-152
    ## clim_origin=clim_origin_Incorrecta        0.142296951 1.235954e-114
    ## env_aso=env_aso_No                        0.120252605  5.044833e-78
    ## imp_com=imp_com_Negativo                  0.134804534  1.910334e-65
    ## kids=kids_Sí                              0.106536342  2.117779e-60
    ## imp_cl=imp_cl_Negativo                    0.163799106  2.905890e-58
    ## trust_vote_inst=trust_vote_inst_Sí        0.116627920  2.735718e-52
    ## imp_ac=imp_ac_Positivo                    0.095225813  4.375494e-49
    ## med=Fuentes validadas                     0.134243279  6.156254e-37
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.037389878  2.309754e-36
    ## age_r=De 30 a 32 años                     0.143049819  3.660988e-33
    ## cont_clim=cont_clim_Incorrecta            0.081553696  2.821617e-32
    ## eco_anx=eco_anx_Positivas                 0.123619393  8.650750e-31
    ## imp_sci=imp_sci_Positivo                  0.054772592  2.832520e-15
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.021494804  8.921185e-14
    ## Zona=Municipios rurales dispersos         0.081531942  3.884226e-13
    ## thoughts=thoughts_Positivos               0.122606019  6.040401e-13
    ## age_r=De 25 a 29 años                     0.076362254  2.637215e-08
    ## ideology=Derecha                          0.072184420  5.188610e-07
    ## strat=Alto                                0.070615978  9.522780e-06
    ## ideology=Centro                           0.025439753  2.258467e-04
    ## sex=Mujer                                 0.014138039  3.242810e-02
    ## sex=Hombre                               -0.014138039  3.242810e-02
    ## strat=Bajo                               -0.005482582  6.157457e-03
    ## med=Fuentes mixtas                       -0.024824140  2.583086e-04
    ## strat=Medio                              -0.065133396  1.037871e-07
    ## age_r=De 21 a 24 años                    -0.059859239  2.090653e-11
    ## Zona=Urbana ciudades                     -0.081531942  3.884226e-13
    ## imp_sci=imp_sci_Negativo                 -0.054772592  2.832520e-15
    ## ideology=Izquierda                       -0.097624172  7.081846e-19
    ## med=Fuentes no validadas                 -0.109419139  2.897639e-19
    ## cont_clim=cont_clim_Correcta             -0.081553696  2.821617e-32
    ## age_r=De 18 a 20 años                    -0.159552835  1.220714e-39
    ## eco_anx=eco_anx_Negativas                -0.145114197  8.359037e-48
    ## imp_ac=imp_ac_Negativo                   -0.095225813  4.375494e-49
    ## trust_vote_inst=trust_vote_inst_No       -0.116627920  2.735718e-52
    ## imp_cl=imp_cl_Positivo                   -0.163799106  2.905890e-58
    ## thoughts=thoughts_Negativos              -0.159995898  2.546803e-59
    ## kids=kids_No                             -0.106536342  2.117779e-60
    ## imp_com=imp_com_Positivo                 -0.134804534  1.910334e-65
    ## env_aso=env_aso_Sí                       -0.120252605  5.044833e-78
    ## clim_origin=clim_origin_Correcta         -0.142296951 1.235954e-114
    ## imp_re=imp_re_Negativo                   -0.165035202 2.218919e-152
    ## imp_po=imp_po_Negativo                   -0.180685021 1.980906e-156
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_ac          0.264537998 3.407454e-150
    ## imp_cl          0.252800637 1.472365e-142
    ## imp_sci         0.246557299 1.517263e-138
    ## imp_com         0.226719408 5.204229e-126
    ## imp_re          0.199225237 3.727899e-109
    ## imp_po          0.153267538  3.203744e-82
    ## clim_origin     0.083985082  3.270583e-44
    ## strat           0.077891175  9.142078e-40
    ## Zona            0.056755060  5.096458e-30
    ## ideology        0.056737777  7.586853e-29
    ## ethni           0.047588518  2.528338e-25
    ## env_aso         0.046423766  9.925905e-25
    ## edu             0.043755210  2.266377e-23
    ## eco_anx         0.019245135  4.413493e-10
    ## kids            0.014724627  9.729061e-09
    ## age_r           0.013968694  7.790491e-07
    ## med             0.011476932  2.772534e-06
    ## cont_clim       0.006102049  2.294931e-04
    ## thoughts        0.007390810  2.683717e-04
    ## trust_vote_inst 0.003422618  5.828181e-03
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_ac=imp_ac_Negativo              0.15223644 3.407454e-150
    ## imp_cl=imp_cl_Negativo              0.23535703 1.472365e-142
    ## imp_sci=imp_sci_Negativo            0.15492713 1.517263e-138
    ## imp_com=imp_com_Negativo            0.17339719 5.204229e-126
    ## imp_re=imp_re_Negativo              0.13503247 3.727899e-109
    ## imp_po=imp_po_Negativo              0.12821226  3.203744e-82
    ## clim_origin=clim_origin_Incorrecta  0.08572995  3.270583e-44
    ## strat=Bajo                          0.12465490  1.501127e-37
    ## Zona=Municipios rurales dispersos   0.12024740  5.096458e-30
    ## ethni=ethni_Sí                      0.11659075  2.528338e-25
    ## env_aso=env_aso_No                  0.06436073  9.925905e-25
    ## edu=edu_No                          0.07970308  2.266377e-23
    ## eco_anx=eco_anx_Positivas           0.07958887  1.289168e-10
    ## ideology=Izquierda                  0.08621492  3.205058e-10
    ## kids=kids_Sí                        0.03630328  9.729061e-09
    ## age_r=De 25 a 29 años               0.04247618  1.045434e-05
    ## cont_clim=cont_clim_Incorrecta      0.02444496  2.294931e-04
    ## med=Fuentes validadas               0.02706340  2.835673e-04
    ## thoughts=thoughts_Positivos         0.05684897  6.757362e-04
    ## ideology=Centro                     0.03427656  2.557648e-03
    ## trust_vote_inst=trust_vote_inst_No  0.02055779  5.828181e-03
    ## med=Fuentes no validadas            0.01432869  3.443882e-02
    ## trust_vote_inst=trust_vote_inst_Sí -0.02055779  5.828181e-03
    ## thoughts=thoughts_Negativos        -0.04278375  2.406191e-03
    ## cont_clim=cont_clim_Correcta       -0.02444496  2.294931e-04
    ## eco_anx=eco_anx_Negativas          -0.05085505  2.410484e-06
    ## age_r=De 30 a 32 años              -0.04877843  1.021604e-06
    ## med=Fuentes mixtas                 -0.04139209  5.493070e-07
    ## kids=kids_No                       -0.03630328  9.729061e-09
    ## strat=Alto                         -0.10694824  4.890471e-14
    ## strat=Medio                        -0.01770665  1.504571e-17
    ## edu=edu_Sí                         -0.07970308  2.266377e-23
    ## env_aso=env_aso_Sí                 -0.06436073  9.925905e-25
    ## ethni=ethni_No                     -0.11659075  2.528338e-25
    ## ideology=Derecha                   -0.12049148  2.736194e-27
    ## Zona=Urbana ciudades               -0.12024740  5.096458e-30
    ## clim_origin=clim_origin_Correcta   -0.08572995  3.270583e-44
    ## imp_po=imp_po_Positivo             -0.12821226  3.203744e-82
    ## imp_re=imp_re_Positivo             -0.13503247 3.727899e-109
    ## imp_com=imp_com_Positivo           -0.17339719 5.204229e-126
    ## imp_sci=imp_sci_Positivo           -0.15492713 1.517263e-138
    ## imp_cl=imp_cl_Positivo             -0.23535703 1.472365e-142
    ## imp_ac=imp_ac_Positivo             -0.15223644 3.407454e-150

## Análisis con las variables sociodemográficas como variables suplementarias

Para ver de forma más clara si las variables demográficas podrían estar
relacionadas con las dimensiones de variabilidad observadas, estas no
fueron incluidas como variables activas en la construcción de las
dimensiones, sino como variables suplementarias. Al interpretar el
análisis se encuentra que algunas variables demográficas pueden estar
relacionadas con algunas de las dimensiones obtenidas, pero no con las
variables de mayor interés relacionadas con el cambio climático.
<img src="./figuresanálisis de componentes múltiples 2-1.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-2.png" width="80%" />

    ## Warning: ggrepel: 14 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-3.png" width="80%" />

    ## Warning: ggrepel: 7 unlabeled data points (too many overlaps). Consider
    ## increasing max.overlaps

<img src="./figuresanálisis de componentes múltiples 2-4.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-5.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-6.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-7.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-8.png" width="80%" /><img src="./figuresanálisis de componentes múltiples 2-9.png" width="80%" />

    ## $`Dim 1`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                          R2       p.value
    ## imp_po          0.385457550 8.702704e-237
    ## imp_re          0.340113422 1.795427e-202
    ## clim_origin     0.194370797 3.074150e-106
    ## imp_ac          0.168640506  4.574216e-91
    ## trust_vote_inst 0.122851883  3.554016e-65
    ## env_aso         0.104495002  3.640236e-55
    ## imp_com         0.100493969  5.207519e-53
    ## thoughts        0.101982750  1.644624e-52
    ## eco_anx         0.101030901  5.321948e-52
    ## imp_cl          0.079332409  9.268526e-42
    ## imp_sci         0.075162790  1.428717e-39
    ## cont_clim       0.060555414  5.610159e-32
    ## med             0.056652212  8.389374e-29
    ## ideology        0.056623143  8.680885e-29
    ## age_r           0.012437360  4.117735e-06
    ## Zona            0.005745980  3.506335e-04
    ## kids            0.005163671  7.034506e-04
    ## strat           0.003410155  2.267217e-02
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                             Estimate       p.value
    ## imp_po=imp_po_Positivo                    0.25670755 8.702704e-237
    ## imp_re=imp_re_Positivo                    0.22275313 1.795427e-202
    ## clim_origin=clim_origin_Incorrecta        0.16466181 3.074150e-106
    ## imp_ac=imp_ac_Positivo                    0.15346220  4.574216e-91
    ## trust_vote_inst=trust_vote_inst_Sí        0.15550129  3.554016e-65
    ## env_aso=env_aso_No                        0.12191144  3.640236e-55
    ## imp_com=imp_com_Negativo                  0.14575169  5.207519e-53
    ## imp_cl=imp_cl_Negativo                    0.16645978  9.268526e-42
    ## imp_sci=imp_sci_Positivo                  0.10799804  1.428717e-39
    ## eco_anx=eco_anx_Positivas                 0.15664840  2.940787e-33
    ## cont_clim=cont_clim_Incorrecta            0.09722408  5.610159e-32
    ## thoughts=thoughts_Ambivalentes/Neutrales  0.03579051  2.335298e-30
    ## med=Fuentes validadas                     0.13542958  1.387020e-29
    ## eco_anx=eco_anx_Ambivalentes/Neutrales    0.01902340  8.769247e-13
    ## thoughts=thoughts_Positivos               0.14629229  8.805751e-13
    ## ideology=Derecha                          0.10457700  1.394601e-09
    ## ideology=Centro                           0.03800828  4.701461e-06
    ## Zona=Municipios rurales dispersos         0.04830603  3.506335e-04
    ## age_r=De 30 a 32 años                     0.05081591  5.099295e-04
    ## kids=kids_Sí                              0.02714244  7.034506e-04
    ## strat=Alto                                0.05140934  5.919870e-03
    ## kids=kids_No                             -0.02714244  7.034506e-04
    ## Zona=Urbana ciudades                     -0.04830603  3.506335e-04
    ## age_r=De 18 a 20 años                    -0.06090073  3.833834e-05
    ## med=Fuentes no validadas                 -0.08057994  9.352050e-07
    ## med=Fuentes mixtas                       -0.05484964  5.469396e-09
    ## ideology=Izquierda                       -0.14258528  1.264769e-27
    ## cont_clim=cont_clim_Correcta             -0.09722408  5.610159e-32
    ## imp_sci=imp_sci_Negativo                 -0.10799804  1.428717e-39
    ## imp_cl=imp_cl_Positivo                   -0.16645978  9.268526e-42
    ## eco_anx=eco_anx_Negativas                -0.17567180  2.823907e-48
    ## thoughts=thoughts_Negativos              -0.18208279  3.722658e-51
    ## imp_com=imp_com_Positivo                 -0.14575169  5.207519e-53
    ## env_aso=env_aso_Sí                       -0.12191144  3.640236e-55
    ## trust_vote_inst=trust_vote_inst_No       -0.15550129  3.554016e-65
    ## imp_ac=imp_ac_Negativo                   -0.15346220  4.574216e-91
    ## clim_origin=clim_origin_Correcta         -0.16466181 3.074150e-106
    ## imp_re=imp_re_Negativo                   -0.22275313 1.795427e-202
    ## imp_po=imp_po_Negativo                   -0.25670755 8.702704e-237
    ## 
    ## $`Dim 2`
    ## 
    ## Link between the variable and the categorical variable (1-way anova)
    ## =============================================
    ##                      R2       p.value
    ## imp_cl      0.415236978 1.000456e-260
    ## imp_com     0.367739892 4.357379e-223
    ## imp_ac      0.210240202 7.741064e-116
    ## imp_sci     0.178928751  4.467187e-97
    ## clim_origin 0.174954624  9.559798e-95
    ## imp_re      0.158255012  4.502101e-85
    ## imp_po      0.091663602  2.763783e-48
    ## env_aso     0.061531600  1.757207e-32
    ## ideology    0.043249221  5.193941e-22
    ## eco_anx     0.030103486  1.927987e-15
    ## cont_clim   0.013221800  5.548842e-08
    ## ethni       0.011610159  3.602858e-07
    ## thoughts    0.009278844  3.252132e-05
    ## Zona        0.005804105  3.271631e-04
    ## med         0.004760464  5.043903e-03
    ## kids        0.003325460  6.571538e-03
    ## 
    ## Link between variable and the categories of the categorical variables
    ## ================================================================
    ##                                       Estimate       p.value
    ## imp_cl=imp_cl_Negativo              0.36192654 1.000456e-260
    ## imp_com=imp_com_Negativo            0.26497347 4.357379e-223
    ## imp_ac=imp_ac_Negativo              0.16284213 7.741064e-116
    ## imp_sci=imp_sci_Negativo            0.15835906  4.467187e-97
    ## clim_origin=clim_origin_Incorrecta  0.14846651  9.559798e-95
    ## imp_re=imp_re_Negativo              0.14440395  4.502101e-85
    ## imp_po=imp_po_Negativo              0.11896994  2.763783e-48
    ## env_aso=env_aso_No                  0.08890665  1.757207e-32
    ## eco_anx=eco_anx_Positivas           0.12495571  2.541940e-16
    ## cont_clim=cont_clim_Incorrecta      0.04317487  5.548842e-08
    ## ideology=Centro                     0.06100781  1.604619e-07
    ## ethni=ethni_Sí                      0.06909815  3.602858e-07
    ## thoughts=thoughts_Positivos         0.07365445  2.356691e-04
    ## Zona=Municipios rurales dispersos   0.04613976  3.271631e-04
    ## ideology=Izquierda                  0.06457131  3.605896e-03
    ## kids=kids_Sí                        0.02070065  6.571538e-03
    ## med=Fuentes validadas               0.02618846  6.800806e-03
    ## kids=kids_No                       -0.02070065  6.571538e-03
    ## med=Fuentes mixtas                 -0.03025147  2.044102e-03
    ## thoughts=thoughts_Negativos        -0.05763388  3.822449e-04
    ## Zona=Urbana ciudades               -0.04613976  3.271631e-04
    ## ethni=ethni_No                     -0.06909815  3.602858e-07
    ## eco_anx=eco_anx_Negativas          -0.07048102  1.372415e-07
    ## cont_clim=cont_clim_Correcta       -0.04317487  5.548842e-08
    ## ideology=Derecha                   -0.12557912  4.182214e-23
    ## env_aso=env_aso_Sí                 -0.08890665  1.757207e-32
    ## imp_po=imp_po_Positivo             -0.11896994  2.763783e-48
    ## imp_re=imp_re_Positivo             -0.14440395  4.502101e-85
    ## clim_origin=clim_origin_Correcta   -0.14846651  9.559798e-95
    ## imp_sci=imp_sci_Positivo           -0.15835906  4.467187e-97
    ## imp_ac=imp_ac_Positivo             -0.16284213 7.741064e-116
    ## imp_com=imp_com_Positivo           -0.26497347 4.357379e-223
    ## imp_cl=imp_cl_Positivo             -0.36192654 1.000456e-260

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

    ## Variable age_r is significantly associated with clim_origin with adjusted p-value: 0.0015086 
    ## Variable estrato is significantly associated with clim_origin with adjusted p-value: 0.01987455 
    ## Variable etnia is significantly associated with clim_origin with adjusted p-value: 0.01298036 
    ## Variable ideology is significantly associated with clim_origin with adjusted p-value: 0.004406685 
    ## Variable Televisión is significantly associated with clim_origin with adjusted p-value: 0.03790647 
    ## Variable Medios_Digitales is significantly associated with clim_origin with adjusted p-value: 1.910725e-08 
    ## Variable Redes_Sociales is significantly associated with clim_origin with adjusted p-value: 2.766643e-08 
    ## Variable med is significantly associated with clim_origin with adjusted p-value: 1.433817e-07 
    ## Variable trust_vote_inst is significantly associated with clim_origin with adjusted p-value: 6.603173e-06 
    ## Variable eco_anx is significantly associated with clim_origin with adjusted p-value: 1.156748e-05 
    ## Variable env_aso is significantly associated with clim_origin with adjusted p-value: 2.479615e-12 
    ## Variable imp_scien is significantly associated with clim_origin with adjusted p-value: 7.016403e-33 
    ## Variable imp_act is significantly associated with clim_origin with adjusted p-value: 1.433817e-07 
    ## Variable imp_rel is significantly associated with clim_origin with adjusted p-value: 4.589515e-20 
    ## Variable imp_pol is significantly associated with clim_origin with adjusted p-value: 2.279533e-25 
    ## Variable thoughts is significantly associated with clim_origin with adjusted p-value: 1.134844e-05 
    ## Variable imp_como is significantly associated with clim_origin with adjusted p-value: 2.124671e-32 
    ## Variable imp_cli is significantly associated with clim_origin with adjusted p-value: 1.943988e-57 
    ## Variable no_car is significantly associated with clim_origin with adjusted p-value: 8.104816e-33 
    ## Variable one_fw_ch is significantly associated with clim_origin with adjusted p-value: 8.864672e-23 
    ## Variable veg is significantly associated with clim_origin with adjusted p-value: 2.009854e-29 
    ## Variable only_bk_wk is significantly associated with clim_origin with adjusted p-value: 2.77674e-42 
    ## Variable cont_clim is significantly associated with clim_origin with adjusted p-value: 0.0001390823

## Tests para la variable emociones frente al cambio climático

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Warning in chisq.test(contingency_table): Chi-squared approximation may be
    ## incorrect

    ## Variable ideology is significantly associated with eco_anx with adjusted p-value: 0.001487809 
    ## Variable trust_vote_inst is significantly associated with eco_anx with adjusted p-value: 8.171824e-05 
    ## Variable env_aso is significantly associated with eco_anx with adjusted p-value: 0.0005499619 
    ## Variable imp_rel is significantly associated with eco_anx with adjusted p-value: 0.04104589 
    ## Variable thoughts is significantly associated with eco_anx with adjusted p-value: 9.118397e-49 
    ## Variable imp_como is significantly associated with eco_anx with adjusted p-value: 0.009758262 
    ## Variable one_fw_ch is significantly associated with eco_anx with adjusted p-value: 0.03495092 
    ## Variable veg is significantly associated with eco_anx with adjusted p-value: 0.008396798 
    ## Variable clim_origin is significantly associated with eco_anx with adjusted p-value: 8.171824e-05

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
    ## $kids
    ## [1] 0.02139138
    ## 
    ## $ideology
    ## [1] 0.06574526
    ## 
    ## $Televisión
    ## [1] 0.04191224
    ## 
    ## $Radio
    ## [1] 0
    ## 
    ## $Prensa_Impresa
    ## [1] 0
    ## 
    ## $Medios_Digitales
    ## [1] 0.1220826
    ## 
    ## $Redes_Sociales
    ## [1] 0.1203153
    ## 
    ## $med
    ## [1] 0.1181543
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
    ## $kids
    ## [1] 0.03570624
    ## 
    ## $ideology
    ## [1] 0.06273595
    ## 
    ## $Televisión
    ## [1] 0
    ## 
    ## $Radio
    ## [1] 0.04863106
    ## 
    ## $Prensa_Impresa
    ## [1] 0.02402613
    ## 
    ## $Medios_Digitales
    ## [1] 0.0309989
    ## 
    ## $Redes_Sociales
    ## [1] 0.02774519
    ## 
    ## $med
    ## [1] 0.02504835
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
