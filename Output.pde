Table table;
ArrayList<data> dataList = new ArrayList<data>();
ArrayList<time> timeList = new ArrayList<time>();

//arrays for advanced time settings

//put this fucker in the code somewhere else
int adDays;
int adHeadings;

//Dont put this fucker somewhere else in the code, redefine it somewhere tho.
float scale = 1;

String title = "";

int scroll = 0;
float textY;

//must only be run if excel button has been toggled on  

void loadData() {
//loads headings and weights from both excel sheet and manually inserted inputs
  table=loadTable("timeSheet.csv", "header");

  //only run this part if excel sheet isnt null
  //create data lists for data class from excel sheet
  for (TableRow o : table.rows()) {
    String he = o.getString("Heading");
    float ho = o.getFloat("Weight");

    ho=ho*scale;
    dataList.add(new data(he, ho));
    } 
  }


//adDays is manually inserted number of days for advanced settings
//insert data must first be run when both coloums have been filled, both data and time class must get data
void insertData() {
  
  //add dates / day and hours, depends on setup type
  if(Advanced_SimpleButton.Power){
    
    //If code suddenly doesnt run try moving these to createTimeplan() and integrate them here through input
  //Create strings with given length using loadBlank function utilizing the amount of days chosen.
  String[] adDates = GUIHandler.loadDates(adDays);
  float[] adHours = GUIHandler.loadHours(adDays);
  
  for (int j = 0; j<adDays; j++) {
    timeList.add(new time(adDates[j], adHours[j]));
   }
  } else {
   timeList.add(new time(parseInt(DaysText.TextLine),float(HoursText.TextLine))); 
  }
  
  //add headings and weight, might have to be behind if statement if nothing is written 
  if(AmountHeadings.TextLine!=null){
    String[] tempTempHeadings = GUIHandler.loadHeading(parseInt(AmountHeadings.TextLine));
    float[] tempTempWeight = GUIHandler.loadWeight(parseInt(AmountHeadings.TextLine));
    for(int j = 0 ; j<tempTempHeadings.length ; j++){
      dataList.add(new data(tempTempHeadings[j],tempTempWeight[j]));
    }
  }
}


void displayAdvancedPlan() {

  //variable with daily hours left
  float DHL = 0;
  textY = 110+scroll;
  title=TitleField.TextLine;
  
  //reset used state
    for(data d : dataList){
     d.used=false;
    }
    
  textSize(30);
  textAlign(CENTER);
  textFont(boldFont);
  
  //create and display coloums with info
  stroke(50);
  fill(255);
  rect(width/2-315,0,630,900);
  fill(0);
  
  //Separator lines
  strokeWeight(2);
  if(scroll==0){
  line(width/2-315+100,50,width/2-315+100,height);
  line(width/2-315+160,50,width/2-315+160,height);
  line(width/2+255,50,width/2+255,height);
  } else {
  line(width/2-315+100,0,width/2-315+100,height);
  line(width/2-315+160,0,width/2-315+160,height);
  line(width/2+255,0,width/2+255,height);
  }

  //Title
  text(title,width/2,35+scroll);
  
  textFont(lightFont);
  
  line(width/2-315,50+scroll,width/2+315,50+scroll);
  line(width/2-315,80+scroll,width/2+315,80+scroll);
  
  textSize(20);
  text("Date",width/2-315+50,70+scroll);
  text("Hours",width/2-315+130,70+scroll);
  text("Heading",width/2+50,70+scroll);
  text("Weight",width/2+285,70+scroll);
  
  textSize(30);
  
  
  //loops through the amount of days and their hours
  //for (int i = 0; i < adDays; i++) {
    for(time t : timeList){
    //text(tAdDates[i],width/2-315+50, textY);
    //text(tAdHours[i]+"",width/2-315+130,textY);
    
    text(t.date,width/2-315+50, textY);
    text(t.hours+"",width/2-315+130,textY);
    
    //set DHL to the amount of hours for the current day
    DHL = t.hours;
    for (data d : dataList) {
      //checks if there is still time left for the next heading
      if (!d.used) {
        if (DHL-d.weight >= 0) {
          //checks if the heading has been used so it doesnt duplicate

          //check if heading is overskrift
          if (d.weight==0) {
            textFont(boldFont);
            text(d.heading,width/2+50, textY);
            textFont(lightFont);
          } else {
            textAlign(LEFT);
            text(d.heading,width/2-315+170, textY);
            textAlign(CENTER);
            text(d.weight+"",width/2+285, textY);
          }
          
          DHL = DHL - d.weight;
          textY=textY+35;
          d.used = true;
          
        } else if(!InOrderButton.detect()) {
          break;
        }
      }
      //if last heading in a day has a weight of 0, break loop before its used instead of after
    }
    line(width/2-315,textY-10,width/2+315,textY-10);
    textY=textY+35;
  }
}

void displaySimplePlan() {

  //variable with daily hours left
  float DHL = 0;
  textY = 110+scroll;
  title=TitleField.TextLine;
  
  //reset used state
    for(data d : dataList){
     d.used=false;
    }
    
  textSize(30);
  textAlign(CENTER);
  textFont(boldFont);
  
  //create and display coloums with info
  stroke(50);
  fill(255);
  rect(width/2-315,0,630,900);
  fill(0);
  
  //Separator lines
  strokeWeight(2);
  if(scroll==0){
  line(width/2-315+100,50,width/2-315+100,height);
  line(width/2-315+160,50,width/2-315+160,height);
  line(width/2+255,50,width/2+255,height);
  } else {
  line(width/2-315+100,0,width/2-315+100,height);
  line(width/2-315+160,0,width/2-315+160,height);
  line(width/2+255,0,width/2+255,height);
  }

  //Title
  text(title,width/2,35+scroll);
  
  textFont(lightFont);
  
  line(width/2-315,50+scroll,width/2+315,50+scroll);
  line(width/2-315,80+scroll,width/2+315,80+scroll);
  
  textSize(20);
  text("Day",width/2-315+50,70+scroll);
  text("Hours",width/2-315+130,70+scroll);
  text("Heading",width/2+50,70+scroll);
  text("Weight",width/2+285,70+scroll);
  
  textSize(30);
  
  
  //loops through the amount of days and their hours
  //advanced for loop is used so time object variabls can be called
    for(time t : timeList){
      //this for loop actually loops through the days
     for(int i=0;i<t.days;i++){
    text((i+1)+"",width/2-315+50, textY);
    text(t.hours+"",width/2-315+130,textY);
    
    //set DHL to the amount of hours for the current day
    DHL = t.hours;
    for (data d : dataList) {
      //checks if there is still time left for the next heading
      if (!d.used) {
        if (DHL-d.weight >= 0) {
          //checks if the heading has been used so it doesnt duplicate

          //check if heading is overskrift
          if (d.weight==0) {
            textFont(boldFont);
            text(d.heading,width/2+50, textY);
            textFont(lightFont);
          } else {
            textAlign(LEFT);
            text(d.heading,width/2-315+170, textY);
            textAlign(CENTER);
            text(d.weight+"",width/2+285, textY);
          }
          
          DHL = DHL - d.weight;
          textY=textY+35;
          d.used = true;

          
          //only works chronologically - maybe a button in the future with else if
        } else if(!InOrderButton.detect()) {
          break;
        }
      }
      //if last heading in a day has a weight of 0, break loop before its used instead of after
    }
    line(width/2-315,textY-10,width/2+315,textY-10);
    textY=textY+35;
  }
    }
}
