#########################################################################################
## R code for Replicating Table 2 in Park, Yun, Interis, and Yu (2026, CJAE)
##
## Interplay Crop Diversity and Agricultural Area in Agroecosystem Services:
## Analytical and Empirical Study on Local Water Quality"
##
## With appropriate adjustments to the code, all results presented in 
## Park et al. (2026) can be reproduced.
##
## Written by Yunsun Park and Seong Yun
## seong.yun@msstate.edu
## Updated: Mar. 5, 2026
#########################################################################################
library(lmtest)
library(sandwich)

###############################
## (1) Aspatial Model - County level data / I-HHI(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_county.rda"))

cols <- setdiff(names(pdata_county), "sdepth_lag")
pdata_county <- pdata_county[complete.cases(pdata_county[cols]), ]

form <- as.formula(paste("sdepth ~", "agratio*ihhi + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(st)+factor(year)"))
model <- lm(form, data = pdata_county) 
Vcl1 <- vcovCL(model, cluster = ~ st, type = "HC1")
model_1 <- coeftest(model, vcov. = Vcl1)
model_1

###############################
## (2) Aspatial Model - County level data / S-W(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_county.rda"))

pdata_county <- pdata_county[complete.cases(pdata_county[cols]), ]

form <- as.formula(paste("sdepth ~", "agratio*sw + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(st)+factor(year)"))
model <- lm(form, data = pdata_county) 
Vcl1 <- vcovCL(model, cluster = ~ st, type = "HC1")
model_2 <- coeftest(model, vcov. = Vcl1)
model_2

###############################
## (3) Aspatial Model - HUC8 level data / I-HHI(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

cols <- setdiff(names(pdata_huc8), c("sdepth_lag", "sdepth_up"))
pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "agratio*ihhi + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_3 <- coeftest(model, vcov. = Vcl1)
model_3

###############################
## (4) Aspatial Model - HUC8 level data / S-W(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

cols <- setdiff(names(pdata_huc8), c("sdepth_lag", "sdepth_up"))
pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "agratio*sw + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_4 <- coeftest(model, vcov. = Vcl1)
model_4

###############################
## (5) Aspatial Model with Time Lag - HUC8 level data / I-HHI(CDI) / Secchi 
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

cols <- setdiff(names(pdata_huc8), "sdepth_up")
pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "sdepth_lag + agratio*ihhi + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_5 <- coeftest(model, vcov. = Vcl1)
model_5

###############################
## (6) Aspatial Model with Time Lag - HUC8 level data / S-W(CDI) / Secchi 
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "sdepth_lag + agratio*sw + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_6 <- coeftest(model, vcov. = Vcl1)
model_6

###############################
## (7) Spatial Model: Flow Direction Model - HUC8 level data / I-HHI(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_fdm.rda"))

form <- as.formula(paste("sdepth ~",
                         "agratio*ihhi + 
                          ifelse(stream=='down', eqip, 0) +
                          crp + ppt + pptsq + temp + tempsq + cattle + 
                          manu + popden +factor(huc2)+factor(year)"))

model <- lm(form, data = pdata_fdm) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_7 <- coeftest(model, vcov. = Vcl1)
model_7

###############################
## (8) Spatial Mode: Flow Direction Model - HUC8 level data / S-W(CDI) / Secchi 
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_fdm.rda"))

form <- as.formula(paste("sdepth ~",
                         "agratio*sw + 
                          ifelse(stream=='down', eqip, 0) +
                          crp + ppt + pptsq + temp + tempsq + cattle + 
                          manu + popden +factor(huc2)+factor(year)"))

model <- lm(form, data = pdata_fdm) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_8 <- coeftest(model, vcov. = Vcl1)
model_8

###############################
## (9) Spatial Model: Spatial Lag Model - HUC8 level data / I-HHI(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

cols <- setdiff(names(pdata_huc8), "sdepth_lag")
pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "sdepth_up + agratio*ihhi + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_9 <- coeftest(model, vcov. = Vcl1)
model_9

###############################
## (10) Spatial Model: Spatial Lag Model - HUC8 level data / S-W(CDI) / Secchi
###############################
load(url("https://raw.github.com/ysd2004/cropDiversityCJAE/main/data/data_huc8.rda"))

cols <- setdiff(names(pdata_huc8), "sdepth_lag")
pdata_huc8 <- pdata_huc8[complete.cases(pdata_huc8[cols]), ]

form <- as.formula(paste("sdepth ~", "sdepth_up + agratio*sw + eqip + crp + 
                          ppt + pptsq + temp + tempsq + cattle + manu + popden +factor(huc2)+factor(year)"))
model <- lm(form, data = pdata_huc8) 
Vcl1 <- vcovCL(model, cluster = ~ huc2, type = "HC1")
model_10 <- coeftest(model, vcov. = Vcl1)
model_10


