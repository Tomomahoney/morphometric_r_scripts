files <- list.files(dir,pattern="*.fcsv", full.names=T, recursive=TRUE)
for (i in 1:length(files)){
  #fcsvfile<-read.csv(files[i],header=FALSE,comment.char="#")
  fcsvfile <- read.csv(files[i], header=FALSE, comment.char="#")
  fc<-fcsvfile[,2:4]
  filename = substr(files[i],-5,(nchar(files[i])-5))
  write.csv(fc,file=paste(filename,".txt",sep=""),col.names = FALSE,sep=",",row.names = FALSE)
}
csvtomerge <- list.files(path=dir, pattern=".txt",full.names = TRUE)
myMergedData <- vroom(csvtomerge,delim=",",col_names =TRUE,col_types = )
#this gets your folder name for naming your combined file.
filename3 = basename(combine_dir)
#this writes all your files from your folder into the working directory-no rename of file needed!
write.csv(myMergedData,file=paste(filename3,"combined.csv",sep=""),sep=",",row.names = FALSE)
