import processing.pdf.*;

GUIHandler GUIHandler = new GUIHandler();

int Counter = 0;
boolean recording = false;
int screen = 0;

PFont lightFont;
PFont boldFont;

ClickButton CreateButton;
ToggleButton Advanced_SimpleButton;
ToggleButton InOrderButton;
ToggleButton ExcelButton;
TextField TitleField;
TextField AmountHeadings;
ClickButton HeadingsCheckButton;
TextField DaysText;
TextField HoursText;
TextField AmountDays;
ClickButton DaysCheckButton;

TextField scaleField;

// static GUI
boxes Heading_heading_box;
boxes Heading_weight_box;
boxes Heading_amountHeading_box;
boxes Heading_amountDays_box;
boxes Heading_days_box;
boxes Heading_hours_box;
boxes Heading_dates_box;
boxes scaleBox;

//Timeplan UI buttons
ClickButton scrollUp;
ClickButton scrollDown;
ClickButton saveAs;

PGraphicsPDF pdf;

int u = 50;
int p = 20;

void setup() {
  size(1800, 900);
  
  //setup fonts
  lightFont = createFont("Roboto-Regular.ttf",30);
  boldFont = createFont("Roboto-Bold.ttf",30);
  textFont(lightFont);
  
  //general GUI components
  CreateButton = GUIHandler.createClickButton(1550, 800, 100, 40, "Create", 3, 1);
  InOrderButton = GUIHandler.createToggleButton(500-u, 800, 100, 40, "in order", 3, 1);
  ExcelButton = GUIHandler.createToggleButton(350-u, 800, 100, 40, "Excel", 3, 1);
  Advanced_SimpleButton = GUIHandler.createToggleButton(200-u, 800, 100, 40, "Simple", 3, 1);
  TitleField = GUIHandler.createTextField(500, 60, 800, 60, 1);
  scaleField = GUIHandler.createTextField(600,800,100,40,1);
  
  // AmountHeadings--- the textfield to write amount of headings in and the checkbutton.
  AmountHeadings = GUIHandler.createTextField(1320, 210, 60, 30, 1);
  HeadingsCheckButton = GUIHandler.createClickButton(1380, 210, 60, 30, "OK", 3, 1);
  //boxes
  Heading_heading_box = new boxes(1150,250,350,40,"Headings");
  Heading_weight_box = new boxes(1500,250,150,40,"Weighting");
  Heading_amountHeading_box = new boxes(1150,210,170,30,"Amount Headings");
  scaleBox = new boxes(600,760,100,40,"Scale");

  // SimplePlan---days og hours components
  Heading_days_box = new boxes (150,250,100,30, "Days");
  Heading_hours_box = new boxes(250,250,100,30,"Hours");
  DaysText =  GUIHandler.createTextField(150, 280, 100, 40);
  HoursText =  GUIHandler.createTextField(250, 280, 100, 40);
  
  // amount of days and checkbutton for Advanced plan
  Heading_amountDays_box = new boxes(150,210,100+p,30,"Amount Days");
  AmountDays = GUIHandler.createTextField(250+p, 210, 60, 30);
  DaysCheckButton = GUIHandler.createClickButton(310+p, 210, 50, 30, "OK", 3);
  Heading_dates_box = new boxes (150,250,100,30, "Dates");

//Timeplan UI buttons
scrollUp = GUIHandler.createClickButton(1400,400,80,80,"Up",3);
scrollDown = GUIHandler.createClickButton(1400,500,80,80,"Down",3);
saveAs = GUIHandler.createClickButton(1400-40,700,160,80,"Save As PDF",3);

//standard title name that shows when program is first run - can still be overwritten with user input
TitleField.TextLine="Tidsplanner";

  adDays = parseInt(AmountDays.TextLine);
  
  scaleField.TextLine="1";


}

void draw() {
  //clear();
  background(80);


//Switch between UI screens
switch(screen){
case 0:
//simple UI
  displaySimpleGUI();
  displayGeneralGUI();
  break;
  case 1:
  //advanced UI
  displayAdvancedGUI();
  displayGeneralGUI();
  break;
  case 2:
  //Timeplan Buttons
  scrollUp.display();
  scrollDown.display();
  saveAs.display();
  case 3:
  //Timeplan
  displayTimeplan();
  
  //change page if textY variable is still higher than the screens height
  if(recording&&(textY-900)>0){
  pdf.nextPage();
  scroll=scroll-height;
  } else if(recording){
    endRecord();
    screen=2;
    print("save complete!");
    recording=false;
  }
  break;
   
}

}
// remember to insert the different buttons here
void mousePressed() {
  
  //turns of button detection for when timeplan is being shown - else statement below is for showing buttons for scrolling and saving
  if(screen!=2){
  CreateButton.detect();
  scaleField.detect();
  GUIHandler.detectWeights();
  GUIHandler.detectHeadings();
  GUIHandler.detectDates();
  GUIHandler.detectHours();
  
  AmountHeadings.detect();
  AmountDays.detect();
  
  TitleField.detect();
  DaysText.detect();
  HoursText.detect();
  
  if (DaysCheckButton.detect()){
     print("yes"+adDays);
     CreateDates();
   }
   if (HeadingsCheckButton.detect()){
     print("no"+adHeadings);
     CreateHeadings();
   }
  
  if (Advanced_SimpleButton.detect() && screen!=2) {
    screen=1;
  } else if(screen!=2){
    screen=0;
  }

  ExcelButton.detect();

  
  //creates button and activates boolean telling display function to run in draw
    if(CreateButton.detect()){
  createTimeplan();
  screen=2;
  }
  
  
  InOrderButton.detect();
  } else {
    //scrolls everything up and down by changing a scroll value that certain components have in their height value
 if(scrollUp.detect()&&scroll<0) scroll=scroll+900;
 if(scrollDown.detect()&&(textY-900)>0) scroll=scroll-900;
 //start recording procedure
 if(saveAs.detect())  {pdf=(PGraphicsPDF)beginRecord(PDF,title+".pdf"); recording=true; screen=3; scroll=0; println("saving...");}
 }
} 

// for all the textfield to work
void keyPressed() {
  TitleField.keyDetect();
  AmountHeadings.keyDetect();
  AmountDays.keyDetect();
  DaysText.keyDetect();
  HoursText.keyDetect();
  scaleField.keyDetect();
  
  GUIHandler.keyDetectWeights();
  GUIHandler.keyDetectHeadings();
  GUIHandler.keyDetectDates();
  GUIHandler.keyDetectHours();
}
