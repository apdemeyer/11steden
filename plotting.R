library(rgl)



head(DeBiltfull)

#max 10 kolommen in TS voor plot
DeBilt <- DeBiltfull[,c(5,12,13,15,19,23)]

DeBiltts <-ts(DeBilt, start=c(1901,1),frequency=365.25)
plot(DeBiltts)


ggplot(data = DeBiltfull, aes(x=YYYYMMDD, y=TG))+geom_line(color = 'red')

p = ggplot() + geom_line(data = Leeuwardenfull,aes(x=YYYYMMDD, y=TG),color = 'yellow') +
  geom_line(data = DeKooyfull, aes(x=YYYYMMDD, y=TG, z =),color = 'blue') +
  geom_line(data = Eeldefull, aes(x=YYYYMMDD, y=TG, z =),color = 'green') + 
  geom_point(data = ElfSteden, aes(x=YYYYMMDD, y=TG, z =),color = 'red') +
  xlab('Temp')+
  ylab('Date')

ggsave("Friesland.pdf",width = 400,height = 10, limitsize = FALSE )

print(p)

#gemiddelde voor Frieslanddata.
library(data.table)
EeldeKooyMean <- rbindlist(list(Eeldefull,DeKooyfull))[, lapply(.SD, mean, na.rm = TRUE), by = YYYYMMDD]

FrieslandMean <- rbindlist(list(Eeldefull,DeKooyfull,Leeuwardenfull))[, lapply(.SD, mean, na.rm = TRUE), by = YYYYMMDD]
head(FrieslandMean)

View(DeKooyfull)
View(Eeldefull)
View(Leeuwardenfull)
View(ElfSteden)
View(FrieslandMean)
View(EeldeKooyMean)

