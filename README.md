# R Data and Code: Park, Yun, Interis, and Yu (CJAE 2026)

This repository provides the R data and code used to replicate Table 2 reported in Park et al. (CJAE, 2026). With appropriate adjustments to the code, all results presented in Park et al. (2026) can be reproduced.

GitHub Repository maintained by: Seong Yun\
Department of Agricultural Economics\
Mississippi State University\
**<seong.yun@msstate.edu>**\
**<https://sites.google.com/site/yunsd2004/>**\
*Last updated: Mar. 5, 2026*

------------------------------------------------------------------------
R data and code used to replicate the main results reported in Park et al. (CJAE, 2026). With appropriate adjustments to the code, all results presented in Park et al. (2026) can be reproduced.

1 Citation
====================================
Please cite the following publication when using this repository:

```r
To cite Park et al. (2026) in publications, please use:

  Park, Yunsun, Seong D. Yun, Matthew G. Interis, and T. Edward Yu, 2026, 
  "Interplay of Crop Diversity and Agricultural Area in Agroecosystem Services: 
  Analytical and Empirical Study on Local Water Quality,"
  Canadian Journal of Agricultural Economics (forthcoming)

A BibTeX entry for LaTeX users is

  @article{,
    title = {Interplay of Crop Diversity and Agricultural Area in Agroecosystem Services: Analytical and Empirical Study on Local Water Quality},
    author = {Yunsun Park, Seong D. Yun, Matthew G. Interis and T. Edward Yu},
    year = {2026},
    journal = {Canadian Journal of Agricultural Economics},
  }
```

2 Getting started:
==================

Download the R file from this repository to your working directory.

``` r
    ## In R
    download.file("https://raw.github.com/ysd2004/cropDiversityCJAE/main/table2.R", "table2.R")
```
In *table2.R*, you can download the regression dataset and reproduce the regression results reported in Park et al. (2026).

To download all data files and *table2.R* directly:

3 Data Description
==================

*data_county.rda* includes the following variables.

| Column No. | Variable Name     | Description                                               |
|:----------:|:-----------------:|-----------------------------------------------------------|
| 1          | year              | year                                                      | 
| 2          | county            | County FIPS code                                          | 
| 3          | st                | State FIPS code                                           | 
| 4          | ihhi              | Crop Diversity Index (Inverse Herfindahl-Hirschman Index) |
| 5          | sw                | Crop Diversity Index (Shannon-Wiener Index)               | 
| 6          | sdepth            | Secchi Disk Depth (meter)                                 |
| 7          | sdepth_lag        | Lagged Secchi Disk Depth (t-1)                            |
| 8          | agratio           | Ratio of Agricultural land (%)                            |
| 9          | ppt               | Precipitation (mm)                                        |
| 10         | pptsq             | Ppt squared (ppt x ppt)                                   |
| 11         | temp              | Temperature (Celsius)                                     |
| 12         | tempsq            | Temp squared (temp x temp)                                |
| 13         | cattle            | Number of cattle (million head)                           |
| 14         | manu              | Ratio of Manufacturing GDP (%)                            |
| 15         | popden            | Population density (people/acre)                          |
| 16         | eqip              | Environment Quality Incentive Program payments ($)        |
| 17         | crp               | Conservation Reserve Program (1,000 acres)                |

*data_huc8.rda* includes the following variables.

| Column No. | Variable Name     | Description                                               |
|:----------:|:-----------------:|-----------------------------------------------------------|
| 1          | year              | year                                                      | 
| 2          | huc8              | HUC8 watershed code                                       | 
| 3          | huc2              | HUC2 watershed code                                       | 
| 4-7        | ihhi - sdepth_lag | Same variable definitions as in pdata_county              |
| 8          | sdepth_up         | Upstream Secchi Disk Depth (meter)                        | 
| 9-18       | agratio - crp     | Same variable definitions as in pdata_county              |

*data_fdm.rda* includes the following variables.

| Column No. | Variable Name     | Description                                               |
|:----------:|:-----------------:|-----------------------------------------------------------|
| 1-6        | year - sdepth     | Same variable definitions as in pdata_huc8                | 
| 7-16       | agratio - crp     | Same variable definitions as in pdata_county              | 
| 17         | huc8_stream       | HUC8 watershed code by stream direction                   | 
| 18         | stream            | Stream direction indicator (upstream or downstream)       |

