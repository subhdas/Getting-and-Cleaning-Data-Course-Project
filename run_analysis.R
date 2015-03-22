
library(plyr)
library(dplyr)
# read the data from the data folder in the working directory
dTest1<-read.table(file = "./data/test/subject_test.txt", header =FALSE)
dTest2<-read.table(file = "./data/test/X_test.txt", header =FALSE)
dTest3<-read.table(file = "./data/test/y_test.txt", header =FALSE)

dTrain1<-read.table(file = "./data/train/subject_train.txt", header =FALSE)
dTrain2<-read.table(file = "./data/train/X_train.txt", header =FALSE)
dTrain3<-read.table(file = "./data/train/y_train.txt", header =FALSE)

features<-read.table(file = "./data/features.txt", header =FALSE)



# bind the test and train data files, including subject id and activity name
bind1<-rbind(dTest2,dTrain2)
bindMid1<-rbind(dTest1,dTrain1)
bind2<-cbind(bind1,bindMid1)
bindMid2<-rbind(dTest3,dTrain3)
bind3<-cbind(bind2,bindMid2)

#naming variables
subFeat<-features[,2]
names(bind3)<-features[,2]
names(bind3)[562]<-"Subject ID"
names(bind3)[563]<-"Activity Name:"

#cleaning labels
names(bind3)<-sub("tBodyGyroJerkMean,gravityMean","GyrMean",names(bind3))
names(bind3)<-sub("Z,gravityMean","ZMean",names(bind3))
names(bind3)<-sub("Y,gravityMean","YMean",names(bind3))
names(bind3)<-sub("X,gravityMean","XMean",names(bind3))

#extracting mean and std data values
meanstdList<- grep("[m][e][a][n][(][)]|[s][t][d][(][)]", names(bind3))
extBind3<-bind3[,meanstdList]
extBind4<-cbind(extBind3,bind3[,562:563])

#Naming the activities
extBind4[,68]<-sub("1","WALKING",extBind4[,68])
extBind4[,68]<-sub("2","WALKING UPSTAIRS",extBind4[,68])
extBind4[,68]<-sub("3","WALKING DOWNSTAIRS",extBind4[,68])
extBind4[,68]<-sub("4","SITTING",extBind4[,68])
extBind4[,68]<-sub("5","STANDING",extBind4[,68])
extBind4[,68]<-sub("6","LAYING",extBind4[,68])

#average the data  
avgData <- ddply(extBind4, .(extBind4[,67], extBind4[,68]), function(x) colMeans(x[, 1:66]))
names(avgData)[1:2]<-c("Subject ID","Activity")

#write the table file as txt file
write.table(avgData, "Avg Tidy Data.txt", row.name=TRUE)


