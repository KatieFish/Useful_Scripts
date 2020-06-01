#KJF 3/31/20
#script calculates the probability of any given gene or intergenic region being mutated 
#n times, controlling for gene size. W303_Position_File.txt is required
#Input data should be in the form of a data frame with 2 columns. Ex. 
#Dataset  #Chromosome #Position


#upon annotating intergenic mutations, ORF position file can be replaced with position file

Calculate_Recurrence_Probability <- function (Observed_Data, W303_Position_File){
  refdf<- W303_Position_File
  refdf$FeatureID<-c(1:nrow(refdf))
  Observed_Data->df
  df$Feature<-NA
  df$FeatureID<-NA
  df$Size<-NA

  for (j in 1:nrow(df)){
    refrow<-which(refdf$Chromosome == df$Chromosome[j] &
                                   refdf$Begin<= df$Position[j] &
                                   refdf$End >= df$Position[j])
    df$Feature[j]<-as.character(refdf$Feature[refrow])
    df$FeatureID[j]<-refdf$FeatureID[refrow]
    df$Size[j]<-refdf$Size[refrow]
  }

#calculate genome size 
genome_size<-sum(na.omit(refdf$Size))
Nmutations<- nrow(df)

recurrence<-data.frame(table(df$FeatureID))
colnames(recurrence)<-c("FeatureID", "n")
df<-merge(df, recurrence, by="FeatureID")
z<-which(colnames(df)=="Position")
df<-df[-z]
df<-unique(df)

# add an empty column to observed counts dataframe to hold lambda
df$Lambda<-(df$Size/genome_size)*Nmutations 

df$"Psubn"<- ((((df$Lambda)^(df$n))/
  (factorial(df$n)))*exp(-(df$Lambda)))
#df$"logP{n}"<- log10(df$`P{n}`)
Result.df<- df[order(df$Psubn), ]
#Result.df$BF.adjusted<- p.adjust(Result.df$"P{n}", method="bonferroni")
Result.df$BH.adjusted<- p.adjust(Result.df$Psubn, method= "BH")
return(Result.df)
}