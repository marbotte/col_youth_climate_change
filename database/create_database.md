Creating the PostgreSQL database for the survey from the Colombian youth
observatory (Universidad del Rosario)
================
Marius BottinJuan Sebastian Cely

- <a href="#1-reading-and-first-formating-of-the-excel-data"
  id="toc-1-reading-and-first-formating-of-the-excel-data">1 Reading and
  first formating of the excel data</a>
- <a href="#4-extracting-the-info-to-send-to-the-database"
  id="toc-4-extracting-the-info-to-send-to-the-database">4 Extracting the
  info to send to the database</a>
- <a href="#5-pushing-the-tables-in-the-database"
  id="toc-5-pushing-the-tables-in-the-database">5 Pushing the tables in
  the database</a>
- <a href="#6-preparing-the-table-structure-in-the-main-schema"
  id="toc-6-preparing-the-table-structure-in-the-main-schema">6 Preparing
  the table structure in the “main” schema</a>
- <a href="#7-description-of-the-structure-of-the-database"
  id="toc-7-description-of-the-structure-of-the-database">7 Description of
  the structure of the database</a>

``` r
stopifnot(require(openxlsx), require(kableExtra), require(RPostgreSQL), require(rpostgis), require(geodata), require(sp), require(knitr))
```

    ## Loading required package: openxlsx

    ## Loading required package: kableExtra

    ## Loading required package: RPostgreSQL

    ## Loading required package: DBI

    ## Loading required package: rpostgis

    ## Loading required package: geodata

    ## Loading required package: terra

    ## terra 1.6.47

    ## Loading required package: sp

    ## Loading required package: knitr

    ## 
    ## Attaching package: 'knitr'

    ## The following object is masked from 'package:terra':
    ## 
    ##     spin

``` r
opts_chunk$set(cache=T,fig.path="./Fig/",tidy=T,tidy.opts=list(width.cutoff=70),cache.rebuild = F, formatSQL = TRUE)
options(knitr.kable.NA = '--')
```

# 1 Reading and first formating of the excel data

We first read the data and codebook (dictionary) from the file “020-22
Base de Datos Anonimizada V4 (1).xlsx”, which is located outside of the
git repository (I strongly advocates against sharing Excel files in
GitHub, but if we want to give open access of the data, there are other
solution), in a folder called “Data_Document”.

``` r
wb <- loadWorkbook("../../Data_Document/020-22 Base de Datos Anonimizada V4 (1).xlsx")
names(wb)
```

    ## [1] "020-22  Base de Datos Anonimiza" "Libro de codigos"

``` r
data1 <- readWorkbook(wb, sheet = 1)
codeBook1 <- readWorkbook(wb, sheet = 2, skipEmptyRows = F)
emptyRows <- which(apply(codeBook1, 1, function(x) all(is.na(x))))
```

Reading the codebook (dictionary of data):

``` r
beg <- c(0, emptyRows) + 1
end <- c(emptyRows - 1, nrow(codeBook1))
titles <- codeBook1[beg, 1]
position <- codeBook1[beg + 2, 3]
etiqueta <- codeBook1[beg + 3, 3]
tipo <- codeBook1[beg + 4, 3]
medicion <- codeBook1[beg + 5, 3]
noVal <- (beg + 5 == end)
# tipo[noVal] tipo[!noVal]
```

In the codebook, the potential values for all the columns of the data
sheet are encoded in various small tables, here goes the code to extract
this value encoding:

``` r
listVal <- vector(mode = "list", length = length(beg))
for (i in 1:length(beg)) {
    if (noVal[i]) {
        listVal[[i]] <- NULL
    } else {
        listVal[[i]] <- codeBook1[(beg[i] + 6):(end[i]), 2:3]
    }

}
descr <- data.frame(title = titles, position = position, question = etiqueta,
    type = tipo, measurement = medicion)
descr[1, "title"] = "@_id"
```

The description of the variables goes in a table structured as follows:

``` r
kable(head(descr, 25), caption = "Description table for the variables extracted from the codebook (dictionary)")
```

<table>
<caption>

Description table for the variables extracted from the codebook
(dictionary)

</caption>
<thead>
<tr>
<th style="text-align:left;">

title

</th>
<th style="text-align:left;">

position

</th>
<th style="text-align:left;">

question

</th>
<th style="text-align:left;">

type

</th>
<th style="text-align:left;">

measurement

</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">

@\_id

</td>
<td style="text-align:left;">

\_id

</td>
<td style="text-align:left;">

Numérico

</td>
<td style="text-align:left;">

Escala

</td>
<td style="text-align:left;">

| `{=html} </td>` |
|:----------------|
| `{=html} </td>` |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
</tr>
<tr>
<td style="text-align:right;">

2

</td>
<td style="text-align:left;width: 5cm; ">

PONDERADOR

</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">

numeric

</td>
<td style="text-align:right;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:right;">` |
|----------------------------------------------------------|
| `{=html} </td>`                                          |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
<td style="text-align:right;">

| `{=html} </td>` |
|:----------------|
| `{=html} </td>` |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
</tr>
<tr>
<td style="text-align:right;">

5

</td>
<td style="text-align:left;width: 5cm; ">

Municipio

</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">

Choice (1-n)

</td>
<td style="text-align:right;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:right;">` |
|----------------------------------------------------------|
| `{=html} </td>`                                          |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
<td style="text-align:right;">

| `{=html} </td>` |
|:----------------|
| `{=html} </td>` |

</td>
<td style="text-align:left;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
</tr>
<tr>
<td style="text-align:right;">

8

</td>
<td style="text-align:left;width: 5cm; ">

CODANE

</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">

Choice (1-n)

</td>
<td style="text-align:right;">

| `{=html} </td>` `{=html} <td style="text-align:left;">` |
|---------------------------------------------------------|
| `{=html} </td>`                                         |

</td>
<td style="text-align:left;">

|               |
|---------------|
| \`\`\`{=html} |
|               |
| \`\`\`        |
| \`\`\`{=html} |
|               |
| \`\`\`        |

</td>
</tr>
<tr>
<td style="text-align:right;">

10

</td>
<td style="text-align:left;width: 5cm; ">

A1

</td>
<td style="text-align:left;">

1.  Sexo `{=html}     </td>` `{=html}     <td style="text-align:left;">`
    Choice (1-2) `{=html}     </td>`
    `{=html}     <td style="text-align:right;">` – `{=html}     </td>`
    `{=html}     <td style="text-align:left;">` – `{=html}     </td>`
    `{=html}     <td style="text-align:left;">` – `{=html}     </td>`
    `{=html}     <td style="text-align:left;">` – `{=html}     </td>`
    `{=html}     <td style="text-align:right;">` – `{=html}     </td>`
    `{=html}     </tr>` `{=html}     <tr>`
    `{=html}     <td style="text-align:right;">` 11 `{=html}     </td>`
    `{=html}     <td style="text-align:left;width: 5cm; ">` A2
    `{=html}     </td>` `{=html}     <td style="text-align:left;">`
    2.  ¿Cuántos años tiene? `{=html}     </td>`
        `{=html}     <td style="text-align:left;">` numeric
        `{=html}     </td>` `{=html}     <td style="text-align:right;">`
        – `{=html}     </td>`
        `{=html}     <td style="text-align:left;">` –
        `{=html}     </td>` `{=html}     <td style="text-align:left;">`
        – `{=html}     </td>`
        `{=html}     <td style="text-align:left;">` –
        `{=html}     </td>` `{=html}     <td style="text-align:right;">`
        – `{=html}     </td>` `{=html}     </tr>` `{=html}     <tr>`
        `{=html}     <td style="text-align:right;">` 13
        `{=html}     </td>`
        `{=html}     <td style="text-align:left;width: 5cm; ">` A3
        `{=html}     </td>` `{=html}     <td style="text-align:left;">`
        3.  En el recibo de la luz de su domicilio, ¿qué estrato sale
            reportado? `{=html}     </td>`
            `{=html}     <td style="text-align:left;">` Choice (1-6)
            `{=html}     </td>`
            `{=html}     <td style="text-align:right;">` –
            `{=html}     </td>`
            `{=html}     <td style="text-align:left;">` –
            `{=html}     </td>`
            `{=html}     <td style="text-align:left;">` –
            `{=html}     </td>`
            `{=html}     <td style="text-align:left;">` –
            `{=html}     </td>`
            `{=html}     <td style="text-align:right;">` –
            `{=html}     </td>` `{=html}     </tr>` `{=html}     <tr>`
            `{=html}     <td style="text-align:right;">` 15
            `{=html}     </td>`
            `{=html}     <td style="text-align:left;width: 5cm; ">` A4
            `{=html}     </td>`
            `{=html}     <td style="text-align:left;">`
            4.  ¿Qué hace usted principalmente? `{=html}     </td>`
                `{=html}     <td style="text-align:left;">` Choice (1-6)
                `{=html}     </td>`
                `{=html}     <td style="text-align:right;">` –
                `{=html}     </td>`
                `{=html}     <td style="text-align:left;">` –
                `{=html}     </td>`
                `{=html}     <td style="text-align:left;">` –
                `{=html}     </td>`
                `{=html}     <td style="text-align:left;">` TRUE
                `{=html}     </td>`
                `{=html}     <td style="text-align:right;">` –
                `{=html}     </td>` `{=html}     </tr>`
                `{=html}     <tr>`
                `{=html}     <td style="text-align:right;">` 17
                `{=html}     </td>`
                `{=html}     <td style="text-align:left;width: 5cm; ">`
                A5 `{=html}     </td>`
                `{=html}     <td style="text-align:left;">`
                5.  De acuerdo con su cultura, etnia o rasgos físicos,
                    ¿usted se reconoce como:…? `{=html}     </td>`
                    `{=html}     <td style="text-align:left;">` Choice
                    (1-6) `{=html}     </td>`
                    `{=html}     <td style="text-align:right;">` –
                    `{=html}     </td>`
                    `{=html}     <td style="text-align:left;">` –
                    `{=html}     </td>`
                    `{=html}     <td style="text-align:left;">` –
                    `{=html}     </td>`
                    `{=html}     <td style="text-align:left;">` –
                    `{=html}     </td>`
                    `{=html}     <td style="text-align:right;">` –
                    `{=html}     </td>` `{=html}     </tr>`
                    `{=html}     <tr>`
                    `{=html}     <td style="text-align:right;">` 18
                    `{=html}     </td>`
                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                    A6 `{=html}     </td>`
                    `{=html}     <td style="text-align:left;">`
                    6.  ¿Cuál es el nivel educativo más alto alcanzado
                        por usted? `{=html}     </td>`
                        `{=html}     <td style="text-align:left;">`
                        Choice (1-6) `{=html}     </td>`
                        `{=html}     <td style="text-align:right;">` –
                        `{=html}     </td>`
                        `{=html}     <td style="text-align:left;">` –
                        `{=html}     </td>`
                        `{=html}     <td style="text-align:left;">` –
                        `{=html}     </td>`
                        `{=html}     <td style="text-align:left;">` –
                        `{=html}     </td>`
                        `{=html}     <td style="text-align:right;">` –
                        `{=html}     </td>` `{=html}     </tr>`
                        `{=html}     <tr>`
                        `{=html}     <td style="text-align:right;">` 19
                        `{=html}     </td>`
                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                        A7 `{=html}     </td>`
                        `{=html}     <td style="text-align:left;">`
                        7.  ¿Usted vive en un hogar:…?
                            `{=html}     </td>`
                            `{=html}     <td style="text-align:left;">`
                            Choice (1-2) `{=html}     </td>`
                            `{=html}     <td style="text-align:right;">`
                            – `{=html}     </td>`
                            `{=html}     <td style="text-align:left;">`
                            – `{=html}     </td>`
                            `{=html}     <td style="text-align:left;">`
                            – `{=html}     </td>`
                            `{=html}     <td style="text-align:left;">`
                            – `{=html}     </td>`
                            `{=html}     <td style="text-align:right;">`
                            – `{=html}     </td>` `{=html}     </tr>`
                            `{=html}     <tr>`
                            `{=html}     <td style="text-align:right;">`
                            20 `{=html}     </td>`
                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                            A8 `{=html}     </td>`
                            `{=html}     <td style="text-align:left;">`
                            8.  ¿Cuál es su parentesco con el jefe o
                                jefa de su hogar? `{=html}     </td>`
                                `{=html}     <td style="text-align:left;">`
                                Choice (1-6) `{=html}     </td>`
                                `{=html}     <td style="text-align:right;">`
                                – `{=html}     </td>`
                                `{=html}     <td style="text-align:left;">`
                                – `{=html}     </td>`
                                `{=html}     <td style="text-align:left;">`
                                – `{=html}     </td>`
                                `{=html}     <td style="text-align:left;">`
                                – `{=html}     </td>`
                                `{=html}     <td style="text-align:right;">`
                                – `{=html}     </td>`
                                `{=html}     </tr>` `{=html}     <tr>`
                                `{=html}     <td style="text-align:right;">`
                                21 `{=html}     </td>`
                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                A9 `{=html}     </td>`
                                `{=html}     <td style="text-align:left;">`
                                9.  ¿Usted tiene hijos?
                                    `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;">`
                                    Yes/No `{=html}     </td>`
                                    `{=html}     <td style="text-align:right;">`
                                    – `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;">`
                                    – `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;">`
                                    – `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;">`
                                    – `{=html}     </td>`
                                    `{=html}     <td style="text-align:right;">`
                                    – `{=html}     </td>`
                                    `{=html}     </tr>`
                                    `{=html}     <tr>`
                                    `{=html}     <td style="text-align:right;">`
                                    22 `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                    A10 `{=html}     </td>`
                                    `{=html}     <td style="text-align:left;">`
                                    10. ¿Usted tiene mascotas?
                                        `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;">`
                                        Yes/No `{=html}     </td>`
                                        `{=html}     <td style="text-align:right;">`
                                        – `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;">`
                                        – `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;">`
                                        – `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;">`
                                        – `{=html}     </td>`
                                        `{=html}     <td style="text-align:right;">`
                                        – `{=html}     </td>`
                                        `{=html}     </tr>`
                                        `{=html}     <tr>`
                                        `{=html}     <td style="text-align:right;">`
                                        23 `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                        A11 `{=html}     </td>`
                                        `{=html}     <td style="text-align:left;">`
                                        11. Ubique su posición
                                            ideológica, en una escala de
                                            1 a 6 donde 1 es una
                                            posición de izquierda y 6 es
                                            una posición de derecha
                                            `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;">`
                                            Scale (6)
                                            `{=html}     </td>`
                                            `{=html}     <td style="text-align:right;">`
                                            – `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;">`
                                            – `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;">`
                                            – `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;">`
                                            – `{=html}     </td>`
                                            `{=html}     <td style="text-align:right;">`
                                            – `{=html}     </td>`
                                            `{=html}     </tr>`
                                            `{=html}     <tr>`
                                            `{=html}     <td style="text-align:right;">`
                                            25 `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                            B12 `{=html}     </td>`
                                            `{=html}     <td style="text-align:left;">`
                                            12. ¿Cómo se informa usted
                                                de los temas del país?
                                                `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;">`
                                                Choice (5-5)
                                                `{=html}     </td>`
                                                `{=html}     <td style="text-align:right;">`
                                                – `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;">`
                                                – `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;">`
                                                – `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;">`
                                                TRUE `{=html}     </td>`
                                                `{=html}     <td style="text-align:right;">`
                                                – `{=html}     </td>`
                                                `{=html}     </tr>`
                                                `{=html}     <tr>`
                                                `{=html}     <td style="text-align:right;">`
                                                34 `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                B13 `{=html}     </td>`
                                                `{=html}     <td style="text-align:left;">`
                                                13. De la siguiente
                                                    lista ¿cuáles son
                                                    los cinco
                                                    PRINCIPALES
                                                    problemas que más lo
                                                    afectan a USTED?
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;">`
                                                    Choice (5-15)
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:right;">`
                                                    –
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;">`
                                                    –
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;">`
                                                    –
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;">`
                                                    TRUE
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:right;">`
                                                    –
                                                    `{=html}     </td>`
                                                    `{=html}     </tr>`
                                                    `{=html}     <tr>`
                                                    `{=html}     <td style="text-align:right;">`
                                                    52
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                    B14
                                                    `{=html}     </td>`
                                                    `{=html}     <td style="text-align:left;">`
                                                    14. De las emociones
                                                        que le voy a
                                                        mencionar a
                                                        continuación,
                                                        ¿cuáles son las
                                                        DOS MÁS
                                                        DOMINANTES en su
                                                        vida HOY?
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;">`
                                                        Choice (2-6)
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:right;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:right;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     </tr>`
                                                        `{=html}     <tr>`
                                                        `{=html}     <td style="text-align:right;">`
                                                        –
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                        B15
                                                        `{=html}     </td>`
                                                        `{=html}     <td style="text-align:left;">`
                                                        15. De las
                                                            emociones
                                                            seleccionadas,
                                                            en una
                                                            escala de 1
                                                            a 6 donde 1
                                                            es POCO y 6
                                                            MUCHO, ¿qué
                                                            tanto siente
                                                            esta
                                                            emoción?
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;">`
                                                            Scale (6)
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:right;">`
                                                            6
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;">`
                                                            –
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;">`
                                                            –
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;">`
                                                            –
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:right;">`
                                                            –
                                                            `{=html}     </td>`
                                                            `{=html}     </tr>`
                                                            `{=html}     <tr>`
                                                            `{=html}     <td style="text-align:right;">`
                                                            67
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                            B16
                                                            `{=html}     </td>`
                                                            `{=html}     <td style="text-align:left;">`
                                                            16. De las
                                                                emociones
                                                                que le
                                                                voy a
                                                                mencionar
                                                                a
                                                                continuación,
                                                                ¿cuáles
                                                                son las
                                                                DOS MÁS
                                                                DOMINANTES
                                                                que le
                                                                generan
                                                                los
                                                                candidatos
                                                                presidenciales
                                                                actuales?
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;">`
                                                                Choice
                                                                (2-12)
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:right;">`
                                                                –
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;">`
                                                                –
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;">`
                                                                –
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;">`
                                                                TRUE
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:right;">`
                                                                –
                                                                `{=html}     </td>`
                                                                `{=html}     </tr>`
                                                                `{=html}     <tr>`
                                                                `{=html}     <td style="text-align:right;">`
                                                                –
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                C17
                                                                `{=html}     </td>`
                                                                `{=html}     <td style="text-align:left;">`
                                                                17. De
                                                                    las
                                                                    siguientes
                                                                    instituciones
                                                                    y
                                                                    figuras,
                                                                    ¿en
                                                                    cuáles
                                                                    confía?
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;">`
                                                                    Choice
                                                                    (1-3)
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:right;">`
                                                                    22
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;">`
                                                                    –
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;">`
                                                                    –
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;">`
                                                                    –
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:right;">`
                                                                    –
                                                                    `{=html}     </td>`
                                                                    `{=html}     </tr>`
                                                                    `{=html}     <tr>`
                                                                    `{=html}     <td style="text-align:right;">`
                                                                    –
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                    C18
                                                                    `{=html}     </td>`
                                                                    `{=html}     <td style="text-align:left;">`
                                                                    18. ¿Usted
                                                                        qué
                                                                        está
                                                                        dispuesto
                                                                        a
                                                                        hacer
                                                                        para
                                                                        aportar/solucionar
                                                                        los
                                                                        problemas
                                                                        del
                                                                        país?
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;">`
                                                                        Yes/No
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:right;">`
                                                                        12
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;">`
                                                                        –
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;">`
                                                                        –
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;">`
                                                                        –
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:right;">`
                                                                        –
                                                                        `{=html}     </td>`
                                                                        `{=html}     </tr>`
                                                                        `{=html}     <tr>`
                                                                        `{=html}     <td style="text-align:right;">`
                                                                        116
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                        C19
                                                                        `{=html}     </td>`
                                                                        `{=html}     <td style="text-align:left;">`
                                                                        19. ¿Usted
                                                                            cree
                                                                            que
                                                                            votar
                                                                            es
                                                                            una
                                                                            forma
                                                                            de
                                                                            ayudar
                                                                            a
                                                                            transformar
                                                                            y
                                                                            solucionar
                                                                            los
                                                                            problemas
                                                                            del
                                                                            país?
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;">`
                                                                            Yes/No
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:right;">`
                                                                            –
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;">`
                                                                            –
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;">`
                                                                            –
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;">`
                                                                            –
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:right;">`
                                                                            –
                                                                            `{=html}     </td>`
                                                                            `{=html}     </tr>`
                                                                            `{=html}     <tr>`
                                                                            `{=html}     <td style="text-align:right;">`
                                                                            117
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                            C20
                                                                            `{=html}     </td>`
                                                                            `{=html}     <td style="text-align:left;">`
                                                                            20. ¿Usted
                                                                                ha
                                                                                votado
                                                                                alguna
                                                                                vez?
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;">`
                                                                                Yes/No
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:right;">`
                                                                                –
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;">`
                                                                                –
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;">`
                                                                                –
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;">`
                                                                                –
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:right;">`
                                                                                –
                                                                                `{=html}     </td>`
                                                                                `{=html}     </tr>`
                                                                                `{=html}     <tr>`
                                                                                `{=html}     <td style="text-align:right;">`
                                                                                118
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                C21
                                                                                `{=html}     </td>`
                                                                                `{=html}     <td style="text-align:left;">`
                                                                                21. ¿Usted
                                                                                    votó
                                                                                    en
                                                                                    las
                                                                                    elecciones
                                                                                    para
                                                                                    consulta
                                                                                    interpartidista
                                                                                    realizadas
                                                                                    el
                                                                                    pasado
                                                                                    13
                                                                                    de
                                                                                    marzo?
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                    Choice
                                                                                    (1-3)
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                    –
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                    –
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                    –
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                    –
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                    –
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     </tr>`
                                                                                    `{=html}     <tr>`
                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                    119
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                    C22
                                                                                    `{=html}     </td>`
                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                    22. ¿El
                                                                                        candidato
                                                                                        por
                                                                                        el
                                                                                        que
                                                                                        usted
                                                                                        votó
                                                                                        en
                                                                                        las
                                                                                        consultas
                                                                                        ganó?
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                        Yes/No
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                        –
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                        –
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                        –
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                        –
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                        –
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     </tr>`
                                                                                        `{=html}     <tr>`
                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                        120
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                        C23
                                                                                        `{=html}     </td>`
                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                        23. ¿Usted
                                                                                            va
                                                                                            a
                                                                                            votar
                                                                                            por
                                                                                            el
                                                                                            candidato
                                                                                            que
                                                                                            ganó
                                                                                            en
                                                                                            la
                                                                                            consulta
                                                                                            en
                                                                                            la
                                                                                            que
                                                                                            usted
                                                                                            participó,
                                                                                            en
                                                                                            primera
                                                                                            vuelta
                                                                                            presidencial?
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                            Yes/No
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                            –
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                            –
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                            –
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                            –
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                            –
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     </tr>`
                                                                                            `{=html}     <tr>`
                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                            121
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                            C24
                                                                                            `{=html}     </td>`
                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                            24. En
                                                                                                las
                                                                                                elecciones
                                                                                                del
                                                                                                pasado
                                                                                                13
                                                                                                de
                                                                                                marzo
                                                                                                de
                                                                                                consultas
                                                                                                y
                                                                                                congreso,
                                                                                                ¿alguien
                                                                                                se
                                                                                                le
                                                                                                acercó
                                                                                                para
                                                                                                comprar
                                                                                                su
                                                                                                voto?
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                Yes/No
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                –
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                –
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                –
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                –
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                –
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     </tr>`
                                                                                                `{=html}     <tr>`
                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                122
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                C25
                                                                                                `{=html}     </td>`
                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                25. ¿Usted
                                                                                                    presenció
                                                                                                    alguna
                                                                                                    irregularidad
                                                                                                    en
                                                                                                    las
                                                                                                    elecciones
                                                                                                    del
                                                                                                    pasado
                                                                                                    13
                                                                                                    de
                                                                                                    marzo?
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                    Yes/No
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                    –
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                    –
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                    –
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                    –
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                    –
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     </tr>`
                                                                                                    `{=html}     <tr>`
                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                    123
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                    C26
                                                                                                    `{=html}     </td>`
                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                    26. ¿Usted
                                                                                                        reportó
                                                                                                        la
                                                                                                        situación?
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        Yes/No
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     </tr>`
                                                                                                        `{=html}     <tr>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        124
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                        C26_Otro
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        ¿Donde?
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        Free
                                                                                                        text
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        –
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     </tr>`
                                                                                                        `{=html}     <tr>`
                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                        125
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                        C27
                                                                                                        `{=html}     </td>`
                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                        27. ¿Usted
                                                                                                            se
                                                                                                            siente
                                                                                                            representado
                                                                                                            por
                                                                                                            los
                                                                                                            candidatos
                                                                                                            presidenciales
                                                                                                            de
                                                                                                            primera
                                                                                                            vuelta?
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                            Yes/No
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                            –
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                            –
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                            –
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                            –
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                            –
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     </tr>`
                                                                                                            `{=html}     <tr>`
                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                            126
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                            C28
                                                                                                            `{=html}     </td>`
                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                            28. ¿Usted
                                                                                                                piensa
                                                                                                                salir
                                                                                                                a
                                                                                                                votar
                                                                                                                en
                                                                                                                primera
                                                                                                                vuelta
                                                                                                                presidencial
                                                                                                                de
                                                                                                                2022?
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                Yes/No
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                –
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                –
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                –
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                –
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                –
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     </tr>`
                                                                                                                `{=html}     <tr>`
                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                127
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                C29
                                                                                                                `{=html}     </td>`
                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                29. ¿Ya
                                                                                                                    decidió
                                                                                                                    por
                                                                                                                    quién
                                                                                                                    votar
                                                                                                                    en
                                                                                                                    primera
                                                                                                                    vuelta
                                                                                                                    presidencial
                                                                                                                    este
                                                                                                                    29
                                                                                                                    de
                                                                                                                    mayo?
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                    Yes/No
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                    –
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                    –
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                    –
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                    –
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                    –
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     </tr>`
                                                                                                                    `{=html}     <tr>`
                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                    128
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                    C30
                                                                                                                    `{=html}     </td>`
                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                    30. ¿Usted
                                                                                                                        tiene
                                                                                                                        clara
                                                                                                                        las
                                                                                                                        propuestas
                                                                                                                        de
                                                                                                                        su
                                                                                                                        candidato(a)?
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                        Yes/No
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                        –
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                        –
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                        –
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                        –
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                        –
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     </tr>`
                                                                                                                        `{=html}     <tr>`
                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                        129
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                        C31
                                                                                                                        `{=html}     </td>`
                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                        31. ¿Cuáles
                                                                                                                            son
                                                                                                                            los
                                                                                                                            temas
                                                                                                                            que
                                                                                                                            más
                                                                                                                            le
                                                                                                                            llaman
                                                                                                                            la
                                                                                                                            atención
                                                                                                                            de
                                                                                                                            su
                                                                                                                            candidato(a)
                                                                                                                            que
                                                                                                                            pueda
                                                                                                                            resumir
                                                                                                                            en
                                                                                                                            3
                                                                                                                            palabras?
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                            Free
                                                                                                                            text
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                            –
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                            –
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                            –
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                            –
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                            3
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     </tr>`
                                                                                                                            `{=html}     <tr>`
                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                            133
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                            C32
                                                                                                                            `{=html}     </td>`
                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                            32. Usted,
                                                                                                                                ¿qué
                                                                                                                                tiene
                                                                                                                                en
                                                                                                                                cuenta
                                                                                                                                a
                                                                                                                                la
                                                                                                                                hora
                                                                                                                                de
                                                                                                                                escoger
                                                                                                                                por
                                                                                                                                quién
                                                                                                                                votar?
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                Choice
                                                                                                                                (3-11)
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                –
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                –
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                –
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                TRUE
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                –
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     </tr>`
                                                                                                                                `{=html}     <tr>`
                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                147
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                C33
                                                                                                                                `{=html}     </td>`
                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                33. ¿Usted
                                                                                                                                    ve
                                                                                                                                    los
                                                                                                                                    debates
                                                                                                                                    presidenciales?
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    Yes/No
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     </tr>`
                                                                                                                                    `{=html}     <tr>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    148
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                    C33_1
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    33.1
                                                                                                                                    ¿Cuáles
                                                                                                                                    ve?
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    Free
                                                                                                                                    text
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     </tr>`
                                                                                                                                    `{=html}     <tr>`
                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                    –
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                    D34
                                                                                                                                    `{=html}     </td>`
                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                    34. En
                                                                                                                                        una
                                                                                                                                        escala
                                                                                                                                        de
                                                                                                                                        1
                                                                                                                                        a
                                                                                                                                        6,
                                                                                                                                        donde
                                                                                                                                        1
                                                                                                                                        es
                                                                                                                                        MUY
                                                                                                                                        POCO
                                                                                                                                        y
                                                                                                                                        6
                                                                                                                                        es
                                                                                                                                        MUY
                                                                                                                                        FUERTE,
                                                                                                                                        Cuando
                                                                                                                                        usted
                                                                                                                                        piensa
                                                                                                                                        en
                                                                                                                                        cómo
                                                                                                                                        el
                                                                                                                                        gobierno
                                                                                                                                        está
                                                                                                                                        respondiendo
                                                                                                                                        al
                                                                                                                                        cambio
                                                                                                                                        climático
                                                                                                                                        se
                                                                                                                                        siente:

                                                                                                                                            </td>
                                                                                                                                            ```
                                                                                                                                        ```{=html}
                                                                                                                                            <td style="text-align:left;">
                                                                                                                                            ```
                                                                                                                                        Scale
                                                                                                                                        (6)
                                                                                                                                        ```{=html}
                                                                                                                                        </td>
                                                                                                                                        <td style="text-align:right;">

                                                                                                                                        10

                                                                                                                                        </td>
                                                                                                                                        <td style="text-align:left;">

                                                                                                                                        | `{=html} </td>` `{=html} <td style="text-align:left;">` |
                                                                                                                                        |---------------------------------------------------------|
                                                                                                                                        | `{=html} </td>`                                         |

                                                                                                                                        </td>
                                                                                                                                        <td style="text-align:right;">

                                                                                                                                        |               |
                                                                                                                                        |---------------|
                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                        |               |
                                                                                                                                        | \`\`\`        |
                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                        |               |
                                                                                                                                        | \`\`\`        |
                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                        |               |
                                                                                                                                        | \`\`\`        |
                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                        |               |
                                                                                                                                        | \`\`\`        |

                                                                                                                                        </td>
                                                                                                                                        <td style="text-align:left;width: 5cm; ">

                                                                                                                                        D35

                                                                                                                                        </td>
                                                                                                                                        <td style="text-align:left;">

                                                                                                                                        35. En
                                                                                                                                            una
                                                                                                                                            escala
                                                                                                                                            de
                                                                                                                                            1
                                                                                                                                            a
                                                                                                                                            6,
                                                                                                                                            donde
                                                                                                                                            1
                                                                                                                                            es
                                                                                                                                            MUY
                                                                                                                                            NEGATIVO
                                                                                                                                            y
                                                                                                                                            6
                                                                                                                                            es
                                                                                                                                            MUY
                                                                                                                                            POSITIVO,
                                                                                                                                            ¿cómo
                                                                                                                                            cree
                                                                                                                                            usted
                                                                                                                                            que
                                                                                                                                            impactan
                                                                                                                                            los
                                                                                                                                            siguientes
                                                                                                                                            actores
                                                                                                                                            en
                                                                                                                                            el
                                                                                                                                            cambio
                                                                                                                                            climático?

                                                                                                                                                </td>
                                                                                                                                                ```
                                                                                                                                            ```{=html}
                                                                                                                                                <td style="text-align:left;">
                                                                                                                                                ```
                                                                                                                                            Scale
                                                                                                                                            (6)
                                                                                                                                            ```{=html}
                                                                                                                                            </td>
                                                                                                                                            <td style="text-align:right;">

                                                                                                                                            14

                                                                                                                                            </td>
                                                                                                                                            <td style="text-align:left;">

                                                                                                                                            | `{=html} </td>` `{=html} <td style="text-align:left;">` |
                                                                                                                                            |---------------------------------------------------------|
                                                                                                                                            | `{=html} </td>`                                         |

                                                                                                                                            </td>
                                                                                                                                            <td style="text-align:right;">

                                                                                                                                            –

                                                                                                                                            </td>
                                                                                                                                            </tr>
                                                                                                                                            <tr>
                                                                                                                                            <td style="text-align:right;">

                                                                                                                                            173

                                                                                                                                            </td>
                                                                                                                                            <td style="text-align:left;width: 5cm; ">

                                                                                                                                            C36

                                                                                                                                            </td>
                                                                                                                                            <td style="text-align:left;">

                                                                                                                                            36. ¿Cuáles
                                                                                                                                                son
                                                                                                                                                las
                                                                                                                                                DOS
                                                                                                                                                emociones
                                                                                                                                                que
                                                                                                                                                reflejen
                                                                                                                                                su
                                                                                                                                                forma
                                                                                                                                                de
                                                                                                                                                sentir
                                                                                                                                                cuando
                                                                                                                                                piensa
                                                                                                                                                en
                                                                                                                                                el
                                                                                                                                                cambio
                                                                                                                                                climático?
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                Choice
                                                                                                                                                (2-16)
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                –
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                –
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                –
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                –
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                –
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     </tr>`
                                                                                                                                                `{=html}     <tr>`
                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                190
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                C37
                                                                                                                                                `{=html}     </td>`
                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                37. De
                                                                                                                                                    las
                                                                                                                                                    siguientes
                                                                                                                                                    opciones,
                                                                                                                                                    el
                                                                                                                                                    cambio
                                                                                                                                                    climático
                                                                                                                                                    me
                                                                                                                                                    hace
                                                                                                                                                    pensar
                                                                                                                                                    que:
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                    Choice
                                                                                                                                                    (3-15)
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     </tr>`
                                                                                                                                                    `{=html}     <tr>`
                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                    –
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                    C38
                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                    38. En
                                                                                                                                                        una
                                                                                                                                                        escala
                                                                                                                                                        de
                                                                                                                                                        1
                                                                                                                                                        a
                                                                                                                                                        6,
                                                                                                                                                        donde
                                                                                                                                                        1
                                                                                                                                                        es
                                                                                                                                                        MUY
                                                                                                                                                        NEGATIVAMENTE
                                                                                                                                                        y
                                                                                                                                                        6
                                                                                                                                                        es
                                                                                                                                                        MUY
                                                                                                                                                        POSITVAMENTE,
                                                                                                                                                        ¿Cómo
                                                                                                                                                        cree
                                                                                                                                                        que
                                                                                                                                                        las
                                                                                                                                                        siguientes
                                                                                                                                                        acciones
                                                                                                                                                        afectarían
                                                                                                                                                        A
                                                                                                                                                        SU
                                                                                                                                                        COMODIDA?

                                                                                                                                                            </td>
                                                                                                                                                            ```
                                                                                                                                                        ```{=html}
                                                                                                                                                            <td style="text-align:left;">
                                                                                                                                                            ```
                                                                                                                                                        Scale
                                                                                                                                                        (6)
                                                                                                                                                        ```{=html}
                                                                                                                                                        </td>
                                                                                                                                                        <td style="text-align:right;">

                                                                                                                                                        10

                                                                                                                                                        </td>
                                                                                                                                                        <td style="text-align:left;">

                                                                                                                                                        | `{=html} </td>` `{=html} <td style="text-align:left;">` |
                                                                                                                                                        |---------------------------------------------------------|
                                                                                                                                                        | `{=html} </td>`                                         |

                                                                                                                                                        </td>
                                                                                                                                                        <td style="text-align:right;">

                                                                                                                                                        |               |
                                                                                                                                                        |---------------|
                                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                                        |               |
                                                                                                                                                        | \`\`\`        |
                                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                                        |               |
                                                                                                                                                        | \`\`\`        |
                                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                                        |               |
                                                                                                                                                        | \`\`\`        |
                                                                                                                                                        | \`\`\`{=html} |
                                                                                                                                                        |               |
                                                                                                                                                        | \`\`\`        |

                                                                                                                                                        </td>
                                                                                                                                                        <td style="text-align:left;width: 5cm; ">

                                                                                                                                                        C39

                                                                                                                                                        </td>
                                                                                                                                                        <td style="text-align:left;">

                                                                                                                                                        39. En
                                                                                                                                                            una
                                                                                                                                                            escala
                                                                                                                                                            de
                                                                                                                                                            1
                                                                                                                                                            a
                                                                                                                                                            6,
                                                                                                                                                            donde
                                                                                                                                                            1
                                                                                                                                                            es
                                                                                                                                                            MUY
                                                                                                                                                            NEGATIVAMENTE
                                                                                                                                                            y
                                                                                                                                                            6
                                                                                                                                                            es
                                                                                                                                                            MUY
                                                                                                                                                            POSITVAMENTE,
                                                                                                                                                            ¿Cómo
                                                                                                                                                            cree
                                                                                                                                                            que
                                                                                                                                                            las
                                                                                                                                                            siguientes
                                                                                                                                                            acciones
                                                                                                                                                            afectarían
                                                                                                                                                            AL
                                                                                                                                                            CAMBIO
                                                                                                                                                            CLIMÁTICO?

                                                                                                                                                                </td>
                                                                                                                                                                ```
                                                                                                                                                            ```{=html}
                                                                                                                                                                <td style="text-align:left;">
                                                                                                                                                                ```
                                                                                                                                                            Scale
                                                                                                                                                            (6)
                                                                                                                                                            ```{=html}
                                                                                                                                                            </td>
                                                                                                                                                            <td style="text-align:right;">

                                                                                                                                                            10

                                                                                                                                                            </td>
                                                                                                                                                            <td style="text-align:left;">

                                                                                                                                                            | `{=html} </td>` `{=html} <td style="text-align:left;">` |
                                                                                                                                                            |---------------------------------------------------------|
                                                                                                                                                            | `{=html} </td>`                                         |

                                                                                                                                                            </td>
                                                                                                                                                            <td style="text-align:right;">

                                                                                                                                                            –

                                                                                                                                                            </td>
                                                                                                                                                            </tr>
                                                                                                                                                            <tr>
                                                                                                                                                            <td style="text-align:right;">

                                                                                                                                                            226

                                                                                                                                                            </td>
                                                                                                                                                            <td style="text-align:left;width: 5cm; ">

                                                                                                                                                            C40

                                                                                                                                                            </td>
                                                                                                                                                            <td style="text-align:left;">

                                                                                                                                                            40. Indíqueme
                                                                                                                                                                su
                                                                                                                                                                apreciación
                                                                                                                                                                en
                                                                                                                                                                cuanto
                                                                                                                                                                al
                                                                                                                                                                origen
                                                                                                                                                                del
                                                                                                                                                                cambio
                                                                                                                                                                climático
                                                                                                                                                                actual,
                                                                                                                                                                en
                                                                                                                                                                una
                                                                                                                                                                escala
                                                                                                                                                                de
                                                                                                                                                                1
                                                                                                                                                                a
                                                                                                                                                                10,
                                                                                                                                                                donde
                                                                                                                                                                1
                                                                                                                                                                es
                                                                                                                                                                100%
                                                                                                                                                                debido
                                                                                                                                                                a
                                                                                                                                                                causas
                                                                                                                                                                naturales
                                                                                                                                                                y
                                                                                                                                                                10
                                                                                                                                                                es
                                                                                                                                                                100%
                                                                                                                                                                debido
                                                                                                                                                                a
                                                                                                                                                                actividades
                                                                                                                                                                humanas

                                                                                                                                                                    </td>
                                                                                                                                                                    ```
                                                                                                                                                                ```{=html}
                                                                                                                                                                    <td style="text-align:left;">
                                                                                                                                                                    ```
                                                                                                                                                                Scale
                                                                                                                                                                (10)
                                                                                                                                                                ```{=html}
                                                                                                                                                                </td>
                                                                                                                                                                <td style="text-align:right;">

                                                                                                                                                                | `{=html} </td>` `{=html} <td style="text-align:left;">` |
                                                                                                                                                                |---------------------------------------------------------|
                                                                                                                                                                | `{=html} </td>`                                         |

                                                                                                                                                                </td>
                                                                                                                                                                <td style="text-align:left;">

                                                                                                                                                                |               |
                                                                                                                                                                |---------------|
                                                                                                                                                                | \`\`\`{=html} |
                                                                                                                                                                |               |
                                                                                                                                                                | \`\`\`        |
                                                                                                                                                                | \`\`\`{=html} |
                                                                                                                                                                |               |
                                                                                                                                                                | \`\`\`        |

                                                                                                                                                                </td>
                                                                                                                                                                </tr>
                                                                                                                                                                <tr>
                                                                                                                                                                <td style="text-align:right;">

                                                                                                                                                                227

                                                                                                                                                                </td>
                                                                                                                                                                <td style="text-align:left;width: 5cm; ">

                                                                                                                                                                C41

                                                                                                                                                                </td>
                                                                                                                                                                <td style="text-align:left;">

                                                                                                                                                                41. En
                                                                                                                                                                    su
                                                                                                                                                                    opinión,
                                                                                                                                                                    ¿cuál
                                                                                                                                                                    de
                                                                                                                                                                    los
                                                                                                                                                                    siguientes
                                                                                                                                                                    factores
                                                                                                                                                                    a
                                                                                                                                                                    nivel
                                                                                                                                                                    global
                                                                                                                                                                    tiene
                                                                                                                                                                    la
                                                                                                                                                                    mayor
                                                                                                                                                                    contribución
                                                                                                                                                                    al
                                                                                                                                                                    cambio
                                                                                                                                                                    climático
                                                                                                                                                                    actualmente?
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                    Choice
                                                                                                                                                                    (1-4)
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                    –
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                    –
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                    –
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                    –
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                    –
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     </tr>`
                                                                                                                                                                    `{=html}     <tr>`
                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                    228
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                    D42
                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                    42. ¿Estaba
                                                                                                                                                                        usted
                                                                                                                                                                        matriculado
                                                                                                                                                                        realizando
                                                                                                                                                                        algún
                                                                                                                                                                        tipo
                                                                                                                                                                        de
                                                                                                                                                                        estudio
                                                                                                                                                                        cuando
                                                                                                                                                                        se
                                                                                                                                                                        decretó
                                                                                                                                                                        el
                                                                                                                                                                        aislamiento
                                                                                                                                                                        a
                                                                                                                                                                        causa
                                                                                                                                                                        del
                                                                                                                                                                        COVID-19?
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                        Yes/No
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                        –
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                        –
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                        –
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                        –
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                        –
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     </tr>`
                                                                                                                                                                        `{=html}     <tr>`
                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                        229
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                        D43
                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                        43. ¿En
                                                                                                                                                                            qué
                                                                                                                                                                            nivel
                                                                                                                                                                            se
                                                                                                                                                                            encontraba
                                                                                                                                                                            usted
                                                                                                                                                                            matriculado?
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                            Choice
                                                                                                                                                                            (1-7)
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                            –
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                            –
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                            –
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                            –
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                            –
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     </tr>`
                                                                                                                                                                            `{=html}     <tr>`
                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                            230
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                            D44
                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                            44. ¿Usted
                                                                                                                                                                                inició
                                                                                                                                                                                algún
                                                                                                                                                                                tipo
                                                                                                                                                                                de
                                                                                                                                                                                estudio
                                                                                                                                                                                después
                                                                                                                                                                                de
                                                                                                                                                                                que
                                                                                                                                                                                se
                                                                                                                                                                                decretó
                                                                                                                                                                                el
                                                                                                                                                                                aislamiento
                                                                                                                                                                                a
                                                                                                                                                                                causa
                                                                                                                                                                                del
                                                                                                                                                                                COVID-19?
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                Yes/No
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                –
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                –
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                –
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                –
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                –
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     </tr>`
                                                                                                                                                                                `{=html}     <tr>`
                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                231
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                D45
                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                45. ¿En
                                                                                                                                                                                    qué
                                                                                                                                                                                    nivel
                                                                                                                                                                                    se
                                                                                                                                                                                    matriculó
                                                                                                                                                                                    usted?
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                    Choice
                                                                                                                                                                                    (1-7)
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                    –
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                    –
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                    –
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                    –
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                    –
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     </tr>`
                                                                                                                                                                                    `{=html}     <tr>`
                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                    232
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                    D46
                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                    46. Durante
                                                                                                                                                                                        el
                                                                                                                                                                                        aislamiento
                                                                                                                                                                                        decretado
                                                                                                                                                                                        a
                                                                                                                                                                                        causa
                                                                                                                                                                                        del
                                                                                                                                                                                        COVID-19,
                                                                                                                                                                                        ¿pudo
                                                                                                                                                                                        usted
                                                                                                                                                                                        continuar
                                                                                                                                                                                        con
                                                                                                                                                                                        sus
                                                                                                                                                                                        estudios?
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                        Yes/No
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                        –
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                        –
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                        –
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                        –
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                        –
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     </tr>`
                                                                                                                                                                                        `{=html}     <tr>`
                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                        233
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                        D47
                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                        47. Durante
                                                                                                                                                                                            el
                                                                                                                                                                                            aislamiento
                                                                                                                                                                                            decretado
                                                                                                                                                                                            a
                                                                                                                                                                                            causa
                                                                                                                                                                                            del
                                                                                                                                                                                            COVID-19,
                                                                                                                                                                                            para
                                                                                                                                                                                            sus
                                                                                                                                                                                            actividades
                                                                                                                                                                                            escolares
                                                                                                                                                                                            virtuales
                                                                                                                                                                                            o
                                                                                                                                                                                            clases
                                                                                                                                                                                            remotas
                                                                                                                                                                                            utilizó.
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                            Choice
                                                                                                                                                                                            (7-7)
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                            –
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                            –
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                            –
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                            –
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                            –
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     </tr>`
                                                                                                                                                                                            `{=html}     <tr>`
                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                            241
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                            D48
                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                            48. Alguno
                                                                                                                                                                                                de
                                                                                                                                                                                                los
                                                                                                                                                                                                motivos
                                                                                                                                                                                                por
                                                                                                                                                                                                lo
                                                                                                                                                                                                que
                                                                                                                                                                                                no
                                                                                                                                                                                                continuó
                                                                                                                                                                                                con
                                                                                                                                                                                                sus
                                                                                                                                                                                                estudios
                                                                                                                                                                                                durante
                                                                                                                                                                                                el
                                                                                                                                                                                                aislamiento
                                                                                                                                                                                                decretado
                                                                                                                                                                                                a
                                                                                                                                                                                                causa
                                                                                                                                                                                                del
                                                                                                                                                                                                COVID-19
                                                                                                                                                                                                fue
                                                                                                                                                                                                porque…
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                Choice
                                                                                                                                                                                                (8-8)
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                –
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                –
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                –
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                TRUE
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                –
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     </tr>`
                                                                                                                                                                                                `{=html}     <tr>`
                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                252
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                D49
                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                49. Durante
                                                                                                                                                                                                    el
                                                                                                                                                                                                    aislamiento
                                                                                                                                                                                                    decretado
                                                                                                                                                                                                    a
                                                                                                                                                                                                    causa
                                                                                                                                                                                                    del
                                                                                                                                                                                                    COVID-19,
                                                                                                                                                                                                    para
                                                                                                                                                                                                    sus
                                                                                                                                                                                                    actividades
                                                                                                                                                                                                    escolares
                                                                                                                                                                                                    virtuales
                                                                                                                                                                                                    o
                                                                                                                                                                                                    clases
                                                                                                                                                                                                    remotas
                                                                                                                                                                                                    usted
                                                                                                                                                                                                    contaba
                                                                                                                                                                                                    con
                                                                                                                                                                                                    las
                                                                                                                                                                                                    siguientes
                                                                                                                                                                                                    conexiones
                                                                                                                                                                                                    en
                                                                                                                                                                                                    su
                                                                                                                                                                                                    lugar
                                                                                                                                                                                                    de
                                                                                                                                                                                                    residencia
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                    Choice
                                                                                                                                                                                                    (4-4)
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                    –
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                    –
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                    –
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                    –
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                    –
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     </tr>`
                                                                                                                                                                                                    `{=html}     <tr>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                    257
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                    D50
                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                    50. Cree
                                                                                                                                                                                                        usted
                                                                                                                                                                                                        que
                                                                                                                                                                                                        la
                                                                                                                                                                                                        calidad
                                                                                                                                                                                                        de
                                                                                                                                                                                                        la
                                                                                                                                                                                                        educación
                                                                                                                                                                                                        que
                                                                                                                                                                                                        usted
                                                                                                                                                                                                        recibió
                                                                                                                                                                                                        en
                                                                                                                                                                                                        modalidad
                                                                                                                                                                                                        remota
                                                                                                                                                                                                        respecto
                                                                                                                                                                                                        de
                                                                                                                                                                                                        la
                                                                                                                                                                                                        presencial
                                                                                                                                                                                                        es:
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                        Choice
                                                                                                                                                                                                        (1-3)
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                        –
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                        –
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                        –
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                        –
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                        –
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     </tr>`
                                                                                                                                                                                                        `{=html}     <tr>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                        258
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                        D51
                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                        51. En
                                                                                                                                                                                                            el
                                                                                                                                                                                                            marco
                                                                                                                                                                                                            de
                                                                                                                                                                                                            los
                                                                                                                                                                                                            estudios
                                                                                                                                                                                                            que
                                                                                                                                                                                                            estuvo
                                                                                                                                                                                                            realizando
                                                                                                                                                                                                            durante
                                                                                                                                                                                                            el
                                                                                                                                                                                                            aislamiento
                                                                                                                                                                                                            decretado
                                                                                                                                                                                                            a
                                                                                                                                                                                                            causa
                                                                                                                                                                                                            del
                                                                                                                                                                                                            COVID-19,
                                                                                                                                                                                                            ¿cómo
                                                                                                                                                                                                            califica
                                                                                                                                                                                                            su
                                                                                                                                                                                                            proceso
                                                                                                                                                                                                            de
                                                                                                                                                                                                            aprendizaje
                                                                                                                                                                                                            durante
                                                                                                                                                                                                            sus
                                                                                                                                                                                                            actividades
                                                                                                                                                                                                            escolares
                                                                                                                                                                                                            virtuales
                                                                                                                                                                                                            o
                                                                                                                                                                                                            clases
                                                                                                                                                                                                            remotas?
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                            Choice
                                                                                                                                                                                                            (1-4)
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                            –
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                            –
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                            –
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                            –
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                            –
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     </tr>`
                                                                                                                                                                                                            `{=html}     <tr>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                            259
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                            D52
                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                            52. En
                                                                                                                                                                                                                su
                                                                                                                                                                                                                opinión,
                                                                                                                                                                                                                ¿cuáles
                                                                                                                                                                                                                han
                                                                                                                                                                                                                sido
                                                                                                                                                                                                                las
                                                                                                                                                                                                                ventajas
                                                                                                                                                                                                                de
                                                                                                                                                                                                                las
                                                                                                                                                                                                                clases
                                                                                                                                                                                                                a
                                                                                                                                                                                                                distancia
                                                                                                                                                                                                                o
                                                                                                                                                                                                                virtuales?
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                Choice
                                                                                                                                                                                                                (7-7)
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                –
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                –
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                –
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                TRUE
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                –
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     </tr>`
                                                                                                                                                                                                                `{=html}     <tr>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                269
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                                D53
                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                53. En
                                                                                                                                                                                                                    su
                                                                                                                                                                                                                    opinión,
                                                                                                                                                                                                                    ¿cuáles
                                                                                                                                                                                                                    han
                                                                                                                                                                                                                    sido
                                                                                                                                                                                                                    las
                                                                                                                                                                                                                    desventajas
                                                                                                                                                                                                                    de
                                                                                                                                                                                                                    las
                                                                                                                                                                                                                    clases
                                                                                                                                                                                                                    a
                                                                                                                                                                                                                    distancia
                                                                                                                                                                                                                    o
                                                                                                                                                                                                                    virtuales?
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                    Choice
                                                                                                                                                                                                                    (8-8)
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                    –
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                    –
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                    –
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                    TRUE
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                    –
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     </tr>`
                                                                                                                                                                                                                    `{=html}     <tr>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                    280
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                                    D54
                                                                                                                                                                                                                    `{=html}     </td>`
                                                                                                                                                                                                                    `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                    54. Al
                                                                                                                                                                                                                        retornar
                                                                                                                                                                                                                        a
                                                                                                                                                                                                                        la
                                                                                                                                                                                                                        educación
                                                                                                                                                                                                                        presencial,
                                                                                                                                                                                                                        usted
                                                                                                                                                                                                                        se
                                                                                                                                                                                                                        ha
                                                                                                                                                                                                                        sentido:
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                        Choice
                                                                                                                                                                                                                        (6-6)
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                        –
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                        –
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                        –
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                        TRUE
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                        –
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     </tr>`
                                                                                                                                                                                                                        `{=html}     <tr>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                        289
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                                        D55
                                                                                                                                                                                                                        `{=html}     </td>`
                                                                                                                                                                                                                        `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                        55. En
                                                                                                                                                                                                                            su
                                                                                                                                                                                                                            opinión,
                                                                                                                                                                                                                            ¿cuáles
                                                                                                                                                                                                                            considera
                                                                                                                                                                                                                            usted
                                                                                                                                                                                                                            que
                                                                                                                                                                                                                            son
                                                                                                                                                                                                                            las
                                                                                                                                                                                                                            ventajas
                                                                                                                                                                                                                            del
                                                                                                                                                                                                                            regreso
                                                                                                                                                                                                                            a
                                                                                                                                                                                                                            la
                                                                                                                                                                                                                            educación
                                                                                                                                                                                                                            presencial?
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                            Choice
                                                                                                                                                                                                                            (5-5)
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                            –
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                            –
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                            –
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                            TRUE
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                            –
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     </tr>`
                                                                                                                                                                                                                            `{=html}     <tr>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                            297
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;width: 5cm; ">`
                                                                                                                                                                                                                            D56
                                                                                                                                                                                                                            `{=html}     </td>`
                                                                                                                                                                                                                            `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                            56. En
                                                                                                                                                                                                                                su
                                                                                                                                                                                                                                opinión,
                                                                                                                                                                                                                                ¿cuáles
                                                                                                                                                                                                                                considera
                                                                                                                                                                                                                                usted
                                                                                                                                                                                                                                que
                                                                                                                                                                                                                                son
                                                                                                                                                                                                                                las
                                                                                                                                                                                                                                desventajas
                                                                                                                                                                                                                                del
                                                                                                                                                                                                                                regreso
                                                                                                                                                                                                                                a
                                                                                                                                                                                                                                la
                                                                                                                                                                                                                                educación
                                                                                                                                                                                                                                presencial?
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                                Choice
                                                                                                                                                                                                                                (5-5)
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                                –
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                                –
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                                –
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:left;">`
                                                                                                                                                                                                                                TRUE
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     <td style="text-align:right;">`
                                                                                                                                                                                                                                –
                                                                                                                                                                                                                                `{=html}     </td>`
                                                                                                                                                                                                                                `{=html}     </tr>`
                                                                                                                                                                                                                                `{=html}     </tbody>`
                                                                                                                                                                                                                                `{=html}     </table>`

# 4 Extracting the info to send to the database

Here we use a regular expression to extract columns which describe
subquestions or categories for choices questions:

``` r
descr$title[grep("^[A-Z][0-9]{1,2}_[0-9]{1,2}", descr$title)]
```

    ##   [1] "B12_1"  "B12_2"  "B12_3"  "B12_4"  "B12_5"  "B12_89" "B13_1"  "B13_2" 
    ##   [9] "B13_3"  "B13_4"  "B13_5"  "B13_6"  "B13_7"  "B13_8"  "B13_9"  "B13_10"
    ##  [17] "B13_11" "B13_12" "B13_13" "B13_14" "B13_15" "B13_89" "B14_1"  "B14_2" 
    ##  [25] "B14_3"  "B14_4"  "B14_5"  "B14_6"  "B15_1"  "B15_2"  "B15_3"  "B15_4" 
    ##  [33] "B15_5"  "B15_6"  "B16_1"  "B16_2"  "B16_3"  "B16_4"  "B16_5"  "B16_6" 
    ##  [41] "B16_7"  "B16_8"  "B16_9"  "B16_10" "B16_11" "B16_12" "B16_89" "C17_1" 
    ##  [49] "C17_2"  "C17_3"  "C17_4"  "C17_5"  "C17_6"  "C17_7"  "C17_8"  "C17_9" 
    ##  [57] "C17_10" "C17_11" "C17_12" "C17_13" "C17_14" "C17_15" "C17_16" "C17_17"
    ##  [65] "C17_18" "C17_19" "C17_20" "C17_21" "C17_22" "C18_1"  "C18_2"  "C18_3" 
    ##  [73] "C18_4"  "C18_5"  "C18_6"  "C18_7"  "C18_8"  "C18_9"  "C18_10" "C18_11"
    ##  [81] "C18_12" "C32_1"  "C32_2"  "C32_3"  "C32_4"  "C32_5"  "C32_6"  "C32_7" 
    ##  [89] "C32_8"  "C32_9"  "C32_10" "C32_11" "C32_89" "C33_1"  "D34_1"  "D34_2" 
    ##  [97] "D34_3"  "D34_4"  "D34_5"  "D34_6"  "D34_7"  "D34_8"  "D34_9"  "D34_10"
    ## [105] "D35_1"  "D35_2"  "D35_3"  "D35_4"  "D35_5"  "D35_6"  "D35_7"  "D35_8" 
    ## [113] "D35_9"  "D35_10" "D35_11" "D35_12" "D35_13" "D35_14" "C36_1"  "C36_2" 
    ## [121] "C36_3"  "C36_4"  "C36_5"  "C36_6"  "C36_7"  "C36_8"  "C36_9"  "C36_10"
    ## [129] "C36_11" "C36_12" "C36_13" "C36_14" "C36_15" "C36_16" "C37_1"  "C37_2" 
    ## [137] "C37_3"  "C37_4"  "C37_5"  "C37_6"  "C37_7"  "C37_8"  "C37_9"  "C37_10"
    ## [145] "C37_11" "C37_12" "C37_13" "C37_14" "C37_15" "C38_1"  "C39_1"  "C38_2" 
    ## [153] "C39_2"  "C38_3"  "C39_3"  "C38_4"  "C39_4"  "C38_5"  "C39_5"  "C38_6" 
    ## [161] "C39_6"  "C38_7"  "C39_7"  "C38_8"  "C39_8"  "C38_9"  "C39_9"  "C38_10"
    ## [169] "C39_10" "D47_1"  "D47_2"  "D47_3"  "D47_4"  "D47_5"  "D47_6"  "D47_7" 
    ## [177] "D48_1"  "D48_2"  "D48_3"  "D48_4"  "D48_5"  "D48_6"  "D48_7"  "D48_8" 
    ## [185] "D48_89" "D49_1"  "D49_2"  "D49_3"  "D49_4"  "D52_1"  "D52_2"  "D52_3" 
    ## [193] "D52_4"  "D52_5"  "D52_6"  "D52_7"  "D52_89" "D53_1"  "D53_2"  "D53_3" 
    ## [201] "D53_4"  "D53_5"  "D53_6"  "D53_7"  "D53_8"  "D53_89" "D54_1"  "D54_2" 
    ## [209] "D54_3"  "D54_4"  "D54_5"  "D54_6"  "D54_89" "D55_1"  "D55_2"  "D55_3" 
    ## [217] "D55_4"  "D55_97" "D55_89" "D56_1"  "D56_2"  "D56_3"  "D56_4"  "D56_97"
    ## [225] "D56_89"

Here we look for the questions which correspond to categories or scales.

``` r
choice_scale <- grepl("Choice", infoTab$type) | grepl("Scale", infoTab$type)
```

Then we extract the labels for the subquestions:

``` r
# Searching subquestion
title_subQues <- infoTab$title[!is.na(infoTab$subquestion_nb_rep)]
regex_title_subQues <- paste0("^", title_subQues, "_[0-9]+$")
det_which_tsQ <- sapply(descr$title, function(t, rts, ts) {
    w <- which(sapply(rts, function(a, b) grepl(a, b), b = t))
    ts[w]
}, rts = regex_title_subQues, ts = title_subQues)
subquestions <- data.frame(questionTitle = unlist(det_which_tsQ), number = gsub("^[A-Z][0-9]{1,2}_([0-9]{1,2})$",
    "\\1", names(det_which_tsQ)[sapply(det_which_tsQ, function(x) length(x) ==
        1)]), category = descr[match(names(det_which_tsQ)[sapply(det_which_tsQ,
    function(x) length(x) == 1)], descr$title), "question"])
```

Then we extract the categories for the choice questions:

``` r
# Categories and scales
positionCategories <- infoTab[choice_scale, "Pos"]
positionCategories[is.na(positionCategories)] <- match(paste0(infoTab[choice_scale,
    "title"][is.na(positionCategories)], "_1"), descr$title)
valuesList <- listVal[positionCategories]
names(valuesList) <- infoTab[choice_scale, "title"]
missingCat <- names(valuesList)[sapply(valuesList, is.null)]
regex_title_categ <- paste0("^", missingCat, "_[0-9]{1,2}")
det_which_tCatMis <- sapply(descr$title, function(t, rts, ts) {
    w <- which(sapply(rts, function(a, b) grepl(a, b), b = t))
    ts[w]
}, rts = regex_title_categ, ts = missingCat)
missingCatTab <- data.frame(questionTitle = unlist(det_which_tCatMis),
    number = gsub("^[A-Z][0-9]{1,2}_([0-9]{1,2})$", "\\1", names(det_which_tCatMis)[sapply(det_which_tCatMis,
        function(x) length(x) == 1)]), category = descr[match(names(det_which_tCatMis)[sapply(det_which_tCatMis,
        function(x) length(x) == 1)], descr$title), "question"])
valuesList_notNull <- valuesList[!sapply(valuesList, is.null)]
catTab <- data.frame(questionTitle = rep(names(valuesList_notNull), sapply(valuesList_notNull,
    nrow)), number = unlist(lapply(valuesList_notNull, function(x) x[,
    1])), category = unlist(lapply(valuesList_notNull, function(x) x[,
    2])))

catTab <- rbind(catTab, missingCatTab)
catTab$number <- as.integer(catTab$number)
```

Then we extract the categories for the variables which correspond to the
post-treatments.

``` r
# Post-treatment
post_treatment <- rbind(data.frame(question_nb = 31, post_treatment_id = 1,
    category_pt_id = listVal[[which(descr$title == "C31_COD1")]][, 1],
    category_pt_lb_es = listVal[[which(descr$title == "C31_COD1")]][, 2]),
    data.frame(question_nb = 31, post_treatment_id = 2, category_pt_id = listVal[[which(descr$title ==
        "C31_COD2")]][, 1], category_pt_lb_es = listVal[[which(descr$title ==
        "C31_COD2")]][, 2]), data.frame(question_nb = 31, post_treatment_id = 3,
        category_pt_id = listVal[[which(descr$title == "C31_COD3")]][,
            1], category_pt_lb_es = listVal[[which(descr$title == "C31_COD3")]][,
            2]))
```

# 5 Pushing the tables in the database

First we create the database, in linux it may be done in the shell:

``` bash
createdb cc_young
```

Then we create the schema “rawdata”, where we will send the raw tables
from R:

``` r
cc_y <- dbConnect(PostgreSQL(), dbname = "cc_young")
listSchema <- dbGetQuery(cc_y, "SELECT * FROM information_schema.schemata")$schema_name
if (!"rawdata" %in% listSchema) {
    dbSendStatement(cc_y, "CREATE SCHEMA rawdata")
}

# Insert raw general information
dbWriteTable(cc_y, c("rawdata", "main_info"), infoTab, overwrite = T)
```

    ## [1] TRUE

``` r
# Insert raw categories
dbWriteTable(cc_y, c("rawdata", "categories"), catTab, overwrite = T)
```

    ## [1] TRUE

``` r
# Insert raw subquestions
dbWriteTable(cc_y, c("rawdata", "subquestions"), subquestions, overwrite = T)
```

    ## [1] TRUE

``` r
# Insert raw data
dbWriteTable(cc_y, c("rawdata", "data"), data1, overwrite = T)
```

    ## [1] TRUE

``` r
# Insert post treatment categories

dbWriteTable(cc_y, c("rawdata", "post_treatment"), post_treatment, overwrite = T)
```

    ## [1] TRUE

``` r
# Insert administrative limits of municipalities (we download it from
# gadm to get the )
pgPostGIS(cc_y)
```

    ## PostGIS extension version 3.1.8 installed.

    ## [1] TRUE

``` r
municipios <- as(gadm("Colombia", level = 2, path = tempdir()), "Spatial")
unique(data1$Departamento[!tolower(data1$Departamento) %in% tolower(municipios$NAME_1)])
```

    ## [1] "Bogotá, D.C."

``` r
unique(data1$Municipio[!tolower(data1$Municipio) %in% tolower(municipios$NAME_2)])
```

    ## [1] "Cúcuta"        "Bogotá, D.C."  "Sauza"         "Cali"         
    ## [5] "Pasto"         "Silos"         "Bolívar valle"

``` r
pgInsert(cc_y, c("rawdata", "municipios"), municipios, geom = "the_geom",
    overwrite = T)
```

    ## Using writeWKT from rgeos package...

    ## Query executed:

    ## DROP TABLE IF EXISTS "rawdata"."municipios";

    ## Data inserted into table "rawdata"."municipios"

    ## [1] TRUE

Now the data is available in the database! We just have to organize it
with the right structure.

# 6 Preparing the table structure in the “main” schema

Deleting the schema main in case it already exists:

``` r
if ("main" %in% dbGetQuery(cc_y, "SELECT schema_name FROM information_schema.schemata")$schema_name) {
    dbSendStatement(cc_y, "DROP SCHEMA main CASCADE")
}
```

    ## <PostgreSQLResult>

``` sql
CREATE SCHEMA main;

CREATE TABLE main.module
(
    module_id CHAR(1) PRIMARY KEY,
    module_desc_es TEXT
);


CREATE TABLE main.question
(
    question_id smallserial PRIMARY KEY,
    module_id CHAR(1) REFERENCES main.module(module_id),
    question_nb smallint NOT NULL,
    question_subnb varchar(10),
    question text NOT NULL UNIQUE,
    question_type varchar(10),
    nb_to_pick smallint,
    nb_cat smallint,
    nb_subquestion smallint NOT NULL,
    other_option boolean,
    post_treatment smallint,
    CHECK (question_type IN ('choice','free text','scale','numeric','yes/no')),
    CHECK ((question_type != 'choice') OR (nb_to_pick IS NOT NULL)),
    CHECK ((question_type NOT IN ( 'choice','scale')) OR (nb_cat IS NOT NULL)),
    UNIQUE(question_nb,question_subnb)
);

CREATE TABLE main.mpio
(
    mpio_id smallserial PRIMARY KEY,
    region varchar(20),
    dept text NOT NULL,
    mpio text NOT NULL,
    mpio_syno TEXT[]
);
SELECT AddGeometryColumn ('main','mpio','the_geom',4326,'MULTIPOLYGON',2);

CREATE TABLE main.basic_info
(
    person_id int PRIMARY KEY,
    mpio_id smallint REFERENCES main.mpio (mpio_id),
    zona text,
    ponderador double precision,
    n_cuestionario int
);

CREATE TABLE main.categories
(
    question_id smallint REFERENCES main.question(question_id),
    category_id smallint,
    category_lb_es text,
    PRIMARY KEY(question_id,category_id),
    UNIQUE(question_id,category_lb_es)
);

CREATE TABLE main.subquestions
(
    question_id smallint REFERENCES main.question(question_id),
    subquestion_id smallint,
    subquestion_lb_es text,
    PRIMARY KEY (question_id, subquestion_id),
    UNIQUE(question_id,subquestion_lb_es)
);

CREATE TABLE main.answer_subq_yesno
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    answer boolean NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions(question_id, subquestion_id),
    UNIQUE (person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_subq_scale
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    answer smallint NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions(question_id,subquestion_id),
    UNIQUE(person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_subq_cat_uniq
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    subquestion_id smallint NOT NULL,
    category_id smallint NOT NULL,
    FOREIGN KEY (question_id, subquestion_id) REFERENCES main.subquestions (question_id, subquestion_id),
    FOREIGN KEY (question_id, category_id) REFERENCES main.categories (question_id,category_id),
    UNIQUE (person_id, question_id, subquestion_id)
);

CREATE TABLE main.answer_yesno
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer boolean NOT NULL,
    UNIQUE(person_id, question_id)
);

CREATE TABLE main.answer_scale
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer smallint NOT NULL,
    UNIQUE(person_id, question_id)
);

CREATE TABLE main.answer_numeric
(
    person_id int REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer smallint NOT NULL,
    UNIQUE(person_id, question_id)
);


CREATE TABLE main.answer_freetext
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES main.question(question_id),
    answer text NOT NULL,
    UNIQUE(person_id,question_id)
);

CREATE TABLE main.answer_other
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL REFERENCES  main.question(question_id),
    answer text,
    UNIQUE(person_id,question_id, answer)
);

CREATE TABLE main.answer_cat_uniq
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    category_id smallint NOT NULL,
    FOREIGN KEY (question_id, category_id) REFERENCES main.categories(question_id, category_id),
    UNIQUE (person_id, question_id)
);

CREATE TABLE main.answer_cat_multi
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint REFERENCES main.question(question_id),
    category_id smallint NOT NULL,
    FOREIGN KEY  (question_id,category_id) REFERENCES main.categories (question_id, category_id),
    UNIQUE(person_id,question_id,category_id)
);

CREATE TABLE main.categories_post_treatment
(
    question_id smallint,
    post_treatment_id smallint,
    category_pt_id smallint,
    category_pt_lb_es text NOT NULL,
    PRIMARY KEY(question_id,post_treatment_id,category_pt_id),
    UNIQUE(question_id, post_treatment_id,category_pt_id)
);

CREATE TABLE main.answer_post_treatment
(
    person_id int NOT NULL REFERENCES main.basic_info(person_id),
    question_id smallint NOT NULL,
    post_treatment_id smallint NOT NULL,
    category_pt_id smallint NOT NULL,
    FOREIGN KEY (question_id,post_treatment_id,category_pt_id) REFERENCES main.categories_post_treatment (question_id, post_treatment_id, category_pt_id)
);
```

# 7 Description of the structure of the database

``` r
dbDisconnect(cc_y)
```

    ## [1] TRUE
