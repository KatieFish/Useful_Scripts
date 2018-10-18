#Load the W303_Position_File from Scripts_for_R folder on lab computer. 
#Import mutation calls dataframe - dataframe must include a column called "Position" and one called "Chromosome" with the 
#postion of each called variant. All other columns are optional. 

#Running SNPeff with the W303 GFF file will annotate tRNA mutations as intergenic. This 
#script will annotate them but not change the "modifier" annotation. 

  Annotate_Intergenic<-function (Calls, Ref){
    #first add empty columns in the calls file to put the data in 
  Calls$"Annotations"<- ""
  #use outer loop scans through call positions 
  for (j in 1:length(Calls$Position)){
    #innter loop scans through Reference positions 
    for (i in 1:nrow(Ref)){
      if (Calls$Chromosome[j] == Ref$Chromosome[i]){
        if (Calls$Position[j]<= Ref$End[i]) {
          if (Calls$Position[j] >= Ref$Begin[i]){
            #annotate calls by filling in empty columns 
            Calls$Annotations[j] = Ref$Feature[i]
            break
    }
    }
    }
  }
}
return(Calls)
}
