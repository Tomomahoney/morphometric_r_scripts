##ONCE YOU'VE RENAMED YOUR COMBINED FILES AND PUT THEM INTO A NEW FOLDER##
#Choose the folder you have them in
landmarkdir<-choose.dir(default = "", caption = "Select folder")
#this will read all the landmarks in your folder of CSV files-change X to the number of landmarks
landmarksforgpa<-read.csv.folder(landmarkdir,x=1:3,y=1:X,pattern=".csv",header=TRUE)
gpalandmarks=procSym(landmarksforgpa$coords)
#read in your file which lists the names of the files and the groups they are in
#put in the file name and where it is in the line below
bonegroups=read.csv("XXX")
pca2d(gpalandmarks$pcscores[1:2,],groups=bonegroups[,2], legend = "bottomleft")
pcextremesplotPC1<-plotTangentSpace(gpalandmarks$rotated,axis1=1,axis2=1)
pcextremesplotPC2<-plotTangentSpace(gpalandmarks$rotated,axis1=2,axis2=2)
#TO DO
#Add regressing size over shapes
#add phenotypic trajectory analysis



