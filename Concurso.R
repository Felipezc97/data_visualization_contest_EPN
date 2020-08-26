## CONCURSO VISUALIZACI�N DE DATOS
## Ricardo Mena, Felipe Zum�rraga

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
astroDT$V1[astroDT$V1==1]="Fot�n"
astroDT$V1[astroDT$V1==2]="Positr�n"
astroDT$V1[astroDT$V1==3]="Electr�n"
astroDT$V1[astroDT$V1==5]="Mu�n+"
astroDT$V1[astroDT$V1==6]="Mu�n-"
astroDT$V1[astroDT$V1==7]="Otra"

## Plot Energy per particle vs. Time
ggplot(astroDT, aes(x = V7, y = V8, color = V1)) + geom_line()+ ggtitle("Energ�a por part�cula vs Tiempo")+xlab("Tiempo [ns]")+ ylab("Energ�a total [GeV]") + labs(color = "Tipo")+ theme(plot.title = element_text(hjust = 0.5))+ theme(plot.title = element_text(face="bold.italic"))