##Now you want to combine all the files in each folder into one file per folder 
#and pop them into your working directory
##This first bit makes sure you have the 'Vroom' package installed and loaded
if (!require(vroom)) {
  print("installing vroom")
  install.packages('vroom')
  library(vroom)
}
require(vroom)
#now it asks you where your  folder of landmarks is. Do each specimen at a time.
combine_dir<-choose.dir(default = "", caption = "Select folder")
csvtomerge <- list.files(path=dir, pattern=".csv",full.names = TRUE)
myMergedData <- vroom(csvtomerge,delim=",",col_names =TRUE,col_types = )
filename2 = basename(combine_dir)
#this writes all your files from your folder into the working directory-no rename of file needed!
write.csv(myMergedData,file=paste(filename2,"combined.csv",sep=""),sep=",",row.names = FALSE)
