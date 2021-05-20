require(rjson)
dir <-choose.dir(default = "", caption = "Select folder")
files <- list.files(dir,pattern="*.mrk.json", full.names=T, recursive=TRUE)
for (i in 1:length(files)){
  jsonfile<-fromJSON(file=files[i])
  jsonfilelandmarks1<-jsonfile$markups[[1]]$controlPoints[[1]]$position
  jsonfilelandmarks2<-jsonfile$markups[[1]]$controlPoints[[2]]$position
  jsonfilelandmarks3<-jsonfile$markups[[1]]$controlPoints[[3]]$position
  jsonfilelandmarks4<-jsonfile$markups[[1]]$controlPoints[[4]]$position
  jsonfilelandmarks5<-jsonfile$markups[[1]]$controlPoints[[5]]$position
  jsonfilelandmarks6<-jsonfile$markups[[1]]$controlPoints[[6]]$position
  jsonfilelandmarks7<-jsonfile$markups[[1]]$controlPoints[[7]]$position
  jsonfilelandmarks8<-jsonfile$markups[[1]]$controlPoints[[8]]$position
  jsonfilelandmarks9<-jsonfile$markups[[1]]$controlPoints[[9]]$position
  jsonfilelandmarks10<-jsonfile$markups[[1]]$controlPoints[[10]]$position
  jsonfilelandmarkscombined<-rbind(jsonfilelandmarks1,jsonfilelandmarks2,jsonfilelandmarks3,jsonfilelandmarks4,jsonfilelandmarks5,jsonfilelandmarks6,jsonfilelandmarks7,jsonfilelandmarks8,jsonfilelandmarks9,jsonfilelandmarks10)
  filename = substr(files[i],-5,(nchar(files[i])-5))
  #write.csv(jsonfilelandmarkscombined,file=paste(filename,".txt",sep=""),col.names = FALSE#,sep=",",row.names = FALSE)
  write.csv(jsonfilelandmarkscombined,file=paste(filename,".csv",sep=""),col.names = FALSE,sep=",",row.names = FALSE)
}