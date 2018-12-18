modelFriesland <- lm(TG~YYYYMMDD+
                       FGWk  + TGWk  + TNWk  + TXWk  + SQWk  +  PGWk  + UGWk +
                       FG2Wk  + TG2Wk  + TN2Wk  + TX2Wk  + SQ2Wk + PG2Wk  +UG2Wk +
                       FGM  + TGM  + TNM  + TXM  + SQM  + PGM  +UGM +
                       FG6M  + TG6M  + TN6M  + TX6M  + SQ6M + PG6M  +UG6M +
                       FG12M  + TG12M  + TN12M  + TX12M  + SQ12M  + PG12M  +UG12M
                     ,
                     data = Friesland1932)

# FGWk  + TGWk  + TNWk  + TXWk  + SQWk  +  PGWk  +UGWk +
#   FG2Wk  + TG2Wk  + TN2Wk  + TX2Wk  + SQ2Wk    + PG2Wk  +UG2Wk +
#   FGM  + TGM  + TNM  + TXM  + SQM  + PGM  +UGM +
#   FG6M  + TG6M  + TN6M  + TX6M  + SQ6M + PG6M  +UG6M +
#   FG12M  + TG12M  + TN12M  + TX12M  + SQ12M  + PG12M  +UG12M,

modelFriesland <- lm(TG~YYYYMMDD+
                        TGWk  + TNWk   + UGWk +
                       FG2Wk  + TG2Wk  + TN2Wk  + TX2Wk  + UG2Wk +
                       SQM  +
                       FG6M  + TG6M  + TN6M  + TX6M  + SQ6M   +UG6M +
                       FG12M  + TG12M  + TN12M  + TX12M  + PG12M  +UG12M
                     ,
                     data = Friesland1932)


modelFriesland <- lm(TG~YYYYMMDD+
                       FGM  + TGM   + TXM  + SQM   +UGM +
                       FG6M  + TG6M  + TN6M  + TX6M  + SQ6M   +UG6M +
                       FG12M  + TG12M  + TN12M  + TX12M  + PG12M  +UG12M
                     ,
                     data = Friesland1932)

modelFriesland <- lm(TG~YYYYMMDD+
                       FG12M  + TG12M  + TN12M  + TX12M  + PG12M  +UG12M
                     ,
                     data = Friesland1932)


summary(modelFriesland)

p <- predict(modelFriesland, newdata = Friesland1932)

plot(Friesland1932$YYYYMMDD,Friesland1932$TG, type = 'l')
lines(Friesland1932$YYYYMMDD, p, col='red')

p <- predict(modelFriesland, newdata = Friesland1954)

plot(Friesland1954$YYYYMMDD,Friesland1954$TG, type = 'l')
lines(Friesland1954$YYYYMMDD, p, col='red')

p <- predict(modelFriesland, newdata = Friesland1980)

plot(Friesland1980$YYYYMMDD,Friesland1980$TG, type = 'l')
lines(Friesland1980$YYYYMMDD, p, col='red')

p <- predict(modelFriesland, newdata = FrieslandSet)

plot(FrieslandSet$YYYYMMDD,FrieslandSet$TG, type = 'l')
lines(FrieslandSet$YYYYMMDD, p, col='red')






