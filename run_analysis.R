run_analysis<-function(){
  
  #1.Merges the training and the test sets to create one data set.
  test_set<-read.table("./test/X_test.txt") #Load values from test dataset
  train_set<-read.table("./train/X_train.txt") #Load values from train dataset
  data<-rbind(train_set,test_set) #Bind rows
  features<-read.table("./features.txt") #Load Features (column names)
  names(data)<-as.character(features$V2) #Add column names to dataset
  
  Data_1<-data #Data 1 contains the complete dataset
  #End task1. Now, I have the complete dataset (test+train sets with column names)
  
  #2.Extracts only the measurements on the mean and standard deviation for each measurement.
  position<-grep("mean|std",names(data)) #Index position of colomn names that contain the words "mean" or "std"
  data2<-data[position] #I extract the column that have names including "mean"or"std"
  
  Dataset_only_mean_std<-data2
  
  #3.Uses descriptive activity names to name the activities in the data set
  activity_train<-read.table("./train/y_train.txt") #Extract y_train,a file containing activities names
  activity_test<-read.table("./test/y_test.txt") # as above
  activity<-rbind(activity_train,activity_test) #Row bind (same order as with line num 6)
  activity<-as.numeric(activity$V1) #cast to numeric
  activity<-as.character(activity) #cast to character vectors
  activity<-factor(activity,labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")) #converts number into activity names
  activity<-as.character(activity) #cast to character
  data3<-cbind(data2,activity) #column binding
  DataWithActNames<-data3 #Point 3 completed
  
  #4.Appropriately labels the data set with descriptive variable names. 
  nam<-colnames(DataWithActNames) #assigns col names to c 
  f<-function(x){
    x<-gsub('-mean',' Mean ',x) #substitute mean with Mean 
    x<-gsub('-std',' Stand.Dev ',x) #std with SD
    if (length(grep("^t",x))>0) gsub('t','Time Domain - ',x) #Substitute t with Time Domain
    if (length(grep("^f",x))>0) gsub('f','Frequency Domain -',x) #Substitute f with Frequency Domain                 
  }
  nam<-f(nam)
  Correct_Names<-nam #assignments
  colnames(data3)<-Correct_Names
  DataSet_Correct_Names<-data3
  
  
  #5.From the data set in step 4, creates a second, 
  # independent tidy data set with the average of each variable 
  # for each activity and each subject.
  
  #I create a second dataset called "data4"
  data4<-DataSet_Correct_Names
  #Use dplyr
  library(data.table)
  sub_train<-read.table("./train/subject_train.txt") #load subj number from train dataset
  sub_test<-read.table("./test/subject_test.txt") #load subj from test dataset
  subjects<-rbind(sub_train,sub_test) #row bind
  names(subjects)<-c("subjects") #Put column name
  data4$activity<-as.character(data4$activity) #cast into character
  data4<-cbind(data4,subjects) #column bind
  data5<-data.table(data4)
  data5<-data5[, lapply(.SD, mean), by = list(subjects,activity)] #Calculate mean value for each column subsetting dataset according to subject and activity  
  data6<-data.frame(data5)
  BigDataSet<-data6 #Completed! :)  
}
