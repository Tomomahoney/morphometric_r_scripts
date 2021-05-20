##This creates a function which will reliably(!) read in your .mrk.json files. 
##Run this section first

jsonlandmarks<-function(file=NULL){
  if (!require(jsonlite)) {
    print("installing jsonlite")
    install.packages('jsonlite')
    library(jsonlite)
    
  }
  dat = fromJSON(file, flatten=T)
  n=length(dat$markups$controlPoints[[1]]$position)
  labels = dat$markups$controlPoints[[1]]$label
  temp = array(dim = c(n, 3), dimnames=list(labels, c("X", "Y", "Z")))
  for (i in 1:n) temp[i,] = dat$markups$controlPoints[[1]]$position[[i]]
  return(temp)
}

##now run this section for all your folders. ##
#Choose the top level folder and it will run through all of them.## 
##(e.g. choose 'Blackgate' and it will go through all your specimen folders).##

dir <-choose.dir(default = "", caption = "Select folder")
data_files <- list.files(dir,pattern="*.json", full.names=T, recursive=TRUE)
for(i in 1:length(data_files)) {    
  jsonfile<-jsonlandmarks(file=data_files[i])
  filename = substr(data_files[i],-5,(nchar(data_files[i])-5))
  write.csv(jsonfile,file=paste(filename,".csv",sep=""),col.names = FALSE,sep=",",row.names = FALSE)
}
#you now have all your.json files as csv. Great! 
