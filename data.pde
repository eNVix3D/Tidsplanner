class data {

  String heading;
  float weight;
  boolean used = false;

  data(String tempHeading, float tempWeight) {
    heading=tempHeading;
    weight=tempWeight;
  }
}

class time {

  int days;
  float hours;
  String date;

  //create with simple settings
  time(int tempDays, float tempHours) {
    days=tempDays;
    hours=tempHours;
  }

  //create with advanced settings
  time(String tempDate, float tempHours) {
    date=tempDate;
    hours=tempHours;
  }
}

void createTimeplan(){
  
  scale=parseFloat(scaleField.TextLine);
  
  insertData();
  
  //REMOVE EXCLAMATION POINT IF LOADDATA STOPS WORKING AS INTENDED - BUG WITH PROCESSING, FINE ON OLDER VERSIONS
  if(!ExcelButton.Power){
  loadData();
  println("loadingData...");
  }

if(!Advanced_SimpleButton.Power){
  println("displaying simplePlan");
} else {
  println("displaying advancedPlan");
}

}

void displayTimeplan(){

if(!Advanced_SimpleButton.Power){
  displaySimplePlan();
} else {
  displayAdvancedPlan();
}
}
