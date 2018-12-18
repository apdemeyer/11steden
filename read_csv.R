rm(list = ls()) #schone dataset
gc() #garbage clean



library(readr)
library(tidyverse)
library(ggplot2)



DeBiltfull <- read_csv("DeBilt.csv", 
col_types = cols(STN = col_integer(), 
		DDVEC = col_integer(), 
		YYYYMMDD = col_date(format = "%Y%m%d"),
    FHVEC = col_integer(), FG = col_integer(), 
    FHX = col_integer(), FHXH = col_integer(), FHN = col_integer(), FHNH = col_integer(), 
    FXX = col_integer(), FXXH = col_integer(), TG = col_integer(), TN = col_integer(), 
    TNH = col_integer(), TX = col_integer(), TXH = col_integer(), 
    T10N = col_integer(), T10NH = col_integer(), SQ = col_integer(), SP = col_integer(), 
    Q = col_integer(), DR = col_integer(), RH = col_integer(), RHX = col_integer(), RHXH = col_integer(), 
    PG = col_integer(), PX = col_integer(), PXH = col_integer(), PN = col_integer(), PNH = col_integer(), 
    VVN = col_integer(), VVNH = col_integer(), VVX = col_integer(), VVXH = col_integer(), 
    NG = col_integer(), UG = col_integer(), UX = col_integer(), UXH = col_integer(), UN = col_integer(), 
    UNH = col_integer(), EV24 = col_integer()
     ))

DeKooyfull <- read_csv("DeKooy.csv", 
                       col_types = cols(STN = col_integer(), 
                                        DDVEC = col_integer(), 
                                        YYYYMMDD = col_date(format = "%Y%m%d"),
                                        FHVEC = col_integer(), FG = col_integer(), 
                                        FHX = col_integer(), FHXH = col_integer(), FHN = col_integer(), FHNH = col_integer(), 
                                        FXX = col_integer(), FXXH = col_integer(), TG = col_integer(), TN = col_integer(), 
                                        TNH = col_integer(), TX = col_integer(), TXH = col_integer(), 
                                        T10N = col_integer(), T10NH = col_integer(), SQ = col_integer(), SP = col_integer(), 
                                        Q = col_integer(), DR = col_integer(), RH = col_integer(), RHX = col_integer(), RHXH = col_integer(), 
                                        PG = col_integer(), PX = col_integer(), PXH = col_integer(), PN = col_integer(), PNH = col_integer(), 
                                        VVN = col_integer(), VVNH = col_integer(), VVX = col_integer(), VVXH = col_integer(), 
                                        NG = col_integer(), UG = col_integer(), UX = col_integer(), UXH = col_integer(), UN = col_integer(), 
                                        UNH = col_integer(), EV24 = col_integer()
                       ))

Eeldefull <- read_csv("Eelde.csv", 
                       col_types = cols(STN = col_integer(), 
                                        DDVEC = col_integer(), 
                                        YYYYMMDD = col_date(format = "%Y%m%d"),
                                        FHVEC = col_integer(), FG = col_integer(), 
                                        FHX = col_integer(), FHXH = col_integer(), FHN = col_integer(), FHNH = col_integer(), 
                                        FXX = col_integer(), FXXH = col_integer(), TG = col_integer(), TN = col_integer(), 
                                        TNH = col_integer(), TX = col_integer(), TXH = col_integer(), 
                                        T10N = col_integer(), T10NH = col_integer(), SQ = col_integer(), SP = col_integer(), 
                                        Q = col_integer(), DR = col_integer(), RH = col_integer(), RHX = col_integer(), RHXH = col_integer(), 
                                        PG = col_integer(), PX = col_integer(), PXH = col_integer(), PN = col_integer(), PNH = col_integer(), 
                                        VVN = col_integer(), VVNH = col_integer(), VVX = col_integer(), VVXH = col_integer(), 
                                        NG = col_integer(), UG = col_integer(), UX = col_integer(), UXH = col_integer(), UN = col_integer(), 
                                        UNH = col_integer(), EV24 = col_integer()
                       ))

Leeuwardenfull <- read_csv("Leeuwarden.csv", 
                      col_types = cols(STN = col_integer(), 
                                       DDVEC = col_integer(), 
                                       YYYYMMDD = col_date(format = "%Y%m%d"),
                                       FHVEC = col_integer(), FG = col_integer(), 
                                       FHX = col_integer(), FHXH = col_integer(), FHN = col_integer(), FHNH = col_integer(), 
                                       FXX = col_integer(), FXXH = col_integer(), TG = col_integer(), TN = col_integer(), 
                                       TNH = col_integer(), TX = col_integer(), TXH = col_integer(), 
                                       T10N = col_integer(), T10NH = col_integer(), SQ = col_integer(), SP = col_integer(), 
                                       Q = col_integer(), DR = col_integer(), RH = col_integer(), RHX = col_integer(), RHXH = col_integer(), 
                                       PG = col_integer(), PX = col_integer(), PXH = col_integer(), PN = col_integer(), PNH = col_integer(), 
                                       VVN = col_integer(), VVNH = col_integer(), VVX = col_integer(), VVXH = col_integer(), 
                                       NG = col_integer(), UG = col_integer(), UX = col_integer(), UXH = col_integer(), UN = col_integer(), 
                                       UNH = col_integer(), EV24 = col_integer()
                      ))


ElfSteden <- read_csv("11stedendatums.csv", 
                       col_types = cols(YYYYMMDD = col_date(format = "%Y%m%d"),
                                        TG = col_integer()
                       ))


as_tibble(DeBiltfull)
DeBilt <- DeBiltfull[,c(5,12,13,15,19,23)]

DeBiltts <-ts(DeBilt, start=c(1901,1),frequency=365.25)




