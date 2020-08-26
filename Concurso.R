## CONCURSO VISUALIZACIÓN DE DATOS
## Ricardo Mena, Felipe Zumárraga

## Load packages
packages <- c("data.table", "ggplot2")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

## Data Processing
astroDF <- read.table("muchosdatos.dat")
astroDT <- as.data.table(astroDF)

## Column names
colnames(astroDT)

## First entries of the dataTable
head(astroDT)

## Grouping other particle types into a single category
astroDT$V1[astroDT$V1>6]=7

## Naming the particles
astroDT$V1[astroDT$V1==1]="Fotón"
astroDT$V1[astroDT$V1==2]="Positrón"
astroDT$V1[astroDT$V1==3]="Electrón"
astroDT$V1[astroDT$V1==5]="Muón+"
astroDT$V1[astroDT$V1==6]="Muón-"
astroDT$V1[astroDT$V1==7]="Otra"

## Plot Energy per particle vs. Time
ggplot(astroDT, aes(x = V7, y = V8, color = V1)) + geom_line()+ ggtitle("Energía por partícula vs Tiempo")+xlab("Tiempo [ns]")+ ylab("Energía total [GeV]") + labs(color = "Tipo")+ theme(plot.title = element_text(hjust = 0.5))+ theme(plot.title = element_text(face="bold.italic"))
