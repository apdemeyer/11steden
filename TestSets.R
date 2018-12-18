#testset maken 
#variabelen in testset zijn van nu.
#variabelen aanmaken dmv metingen in het verleden.
#voorspellen vanaf een week van te voren is zinvol voor een elfstedentocht
# variabelen 1 jaar terug zelfde seizoen
# variabelen 1 week terug, 1 maand terug 1 jaar terug 2 jaar terug om nu te voorspellen
FrieslandMean

library(fpp)

#Kolom maanddag toevoegen
FrieslandMean$MMDD <- format(FrieslandMean[,"YYYYMMDD"],"%m%d")

Friesland<- FrieslandMean[,c(1,5,12,13,15,19,21,22,23,26,36)]
head(Friesland)
FrieslandWk <- Friesland
FrieslandWk$YYYYMMDD <- FrieslandWk$YYYYMMDD+7
Friesland2Wk <- Friesland
Friesland2Wk$YYYYMMDD <- Friesland2Wk$YYYYMMDD+14
FrieslandM <- Friesland
FrieslandM$YYYYMMDD <- FrieslandM$YYYYMMDD+30
Friesland6M <- Friesland
Friesland6M$YYYYMMDD <- Friesland6M$YYYYMMDD+183
Friesland12M <- Friesland
Friesland12M$YYYYMMDD <- Friesland12M$YYYYMMDD+365
names(FrieslandWk)<-c("YYYYMMDD","FGWk","TGWk","TNWk","TXWk","SQWk","QWk","DRWk","RHWk","PGWk","UGWk")
names(Friesland2Wk)<-c("YYYYMMDD","FG2Wk","TG2Wk","TN2Wk","TX2Wk","SQ2Wk","Q2Wk","DR2Wk","RH2Wk","PG2Wk","UG2Wk")
names(FrieslandM)<-c("YYYYMMDD","FGM","TGM","TNM","TXM","SQM","QM","DRM","RHM","PGM","UGM")
names(Friesland6M)<-c("YYYYMMDD","FG6M","TG6M","TN6M","TX6M","SQ6M","Q6M","DR6M","RH6M","PG6M","UG6M")
names(Friesland12M)<-c("YYYYMMDD","FG12M","TG12M","TN12M","TX12M","SQ12M","Q12M","DR12M","RH12M","PG12M","UG12M")
#Friesland$MMDD <- format(Friesland[,"YYYYMMDD"],"%m%d")


FrieslandVar1 <- merge(x=Friesland, y = FrieslandWk, by = "YYYYMMDD", all.x = TRUE)
FrieslandVar2 <- merge(x=FrieslandVar1, y = Friesland2Wk, by = "YYYYMMDD", all.x = TRUE)
FrieslandVar3 <- merge(x=FrieslandVar2, y = FrieslandM, by = "YYYYMMDD", all.x = TRUE)
FrieslandVar4 <- merge(x=FrieslandVar3, y = Friesland6M, by = "YYYYMMDD", all.x = TRUE)
FrieslandVar <- merge(x=FrieslandVar4, y = Friesland12M, by = "YYYYMMDD", all.x = TRUE)
FrieslandVar$MMDD <- format(FrieslandVar[,"YYYYMMDD"],"%m%d")


# FrieslandC<- FrieslandMean[,c(5,12,13,15,19,21,22,23,26,36)]
View(FrieslandVar)
#Testset werkt met data van een jaar geleden, dus eerste jaar weggooien
FrieslandSet<- subset(FrieslandVar,YYYYMMDD>"1906-12-31")
# Friesland <-ts(FrieslandC, start=c(1906,1),frequency=365.25)
# plot(Friesland)
# seasonplot(Friesland)

Friesland1932 <- subset(FrieslandSet,YYYYMMDD<"1933-01-01")
Friesland1940 <- subset(FrieslandSet,YYYYMMDD<"1941-01-01")
Friesland1954 <- subset(FrieslandSet,YYYYMMDD<"1955-01-01")
Friesland1962 <- subset(FrieslandSet,YYYYMMDD<"1963-01-01")
Friesland1980 <- subset(FrieslandSet,YYYYMMDD<"1981-01-01")
Friesland1995 <- subset(FrieslandSet,YYYYMMDD<"1996-01-01")


View(Friesland1932) 

plot(Friesland1932$TG, type = 'l')

linemodel <- lm(TG~ YYYYMMDD, data = FrieslandSet)

summary(linemodel)

p <- predict(linemodel)

plot(FrieslandSet$YYYYMMDD,FrieslandSet$TG, type = 'l', col = 'blue')

lines(FrieslandSet$YYYYMMDD, p, col='red')

p = ggplot() + geom_line(data = FrieslandSet,aes(x=YYYYMMDD, y=TG),color = 'blue') 
  



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

#Elfstedentochten
p = ggplot() + geom_line(data = FrieslandSet,aes(x=YYYYMMDD, y=TG),color = 'blue') +
   geom_point(data = ElfSteden, aes(x=YYYYMMDD, y=TG, size = 5000),color = 'red') + 
  xlab('Temp')+
  ylab('Date')+
  theme(legend.position = "none")

ggsave("Friesland.pdf",width = 70,height = 10, limitsize = FALSE )

print(p)

