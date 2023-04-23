// GUI for all inputs
class boxes extends component {

  boxes(int tempX, int tempY, int tempXWitdh, int tempYWitdh, String tempText) {
    x= tempX;
    y=tempY;
    xWidth = tempXWitdh;
    yWidth = tempYWitdh;
    Text = tempText;
  }
}


// shows the static part of general GUI
void displayGeneralGUI() {
  Heading_heading_box.display();
  Heading_weight_box.display();
  Heading_amountHeading_box.display();
  scaleBox.display();
  
  GUIHandler.displayGeneral();
    GUIHandler.displayHeadings();
  GUIHandler.displayWeights();
}

// showing simple GUI
void displaySimpleGUI() {
  DaysText.display();
  HoursText.display();
  Heading_days_box.display();
  Heading_hours_box.display();
}

// showing advanced GUI
void displayAdvancedGUI() {
  GUIHandler.displayDates();
  GUIHandler.displayHours();
  GUIHandler.displayHeadings();
  GUIHandler.displayWeights();
  AmountDays.display();
  DaysCheckButton.display();

  Heading_hours_box.display();
  Heading_dates_box.display();
  Heading_amountDays_box.display();
  
    GUIHandler.displayHours();  
  GUIHandler.displayDates();
}

void CreateHeadings() {
  adHeadings = parseInt(AmountHeadings.TextLine);
  for (int i = 0; i<adHeadings; i ++) {
    GUIHandler.createTextField(1150, 280+i*40, 350, 40, 5);
    GUIHandler.createTextField(1500, 280+i*40, 150, 40, 4);
  }
}

void CreateDates() {
  adDays = parseInt(AmountDays.TextLine);
  for (int i = 0; i<adDays; i ++) {
    GUIHandler.createTextField(150, 280+i*40, 100, 40, 2);
    GUIHandler.createTextField(250, 280+i*40, 100, 40, 3);
  }
}
