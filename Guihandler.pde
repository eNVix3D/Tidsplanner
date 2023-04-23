class GUIHandler {

  ArrayList<component> GeneralGUI = new ArrayList<component>();
  ArrayList<component> DatesGUI = new ArrayList<component>();
  ArrayList<component> HoursGUI = new ArrayList<component>();
  ArrayList<component> HeadingsGUI = new ArrayList<component>();
  ArrayList<component> WeightsGUI = new ArrayList<component>();



  //for loops for displaying the different GUIs


  void displayGeneral() {
    for (component G : GeneralGUI) {
      G.display();
    }
  }
  
  //date functions
  void displayDates() {
    for (component D : DatesGUI) {
      D.display();
    }
  }
  
  void detectDates() {
    for (component D : DatesGUI) {
      D.detect();
    }
  }
  
  void keyDetectDates() {
    for (component D : DatesGUI) {
      D.keyDetect();
    }
  }
  
  //hour functions
  void displayHours() {
    for (component Ho : HoursGUI) {
      Ho.display();
    }
  }
  
  void detectHours() {
    for (component Ho : HoursGUI) {
      Ho.detect();
    }
  }
  
  void keyDetectHours() {
    for (component Ho : HoursGUI) {
      Ho.keyDetect();
    }
  }
  
  //heading functions
  void displayHeadings() {
    for (component He : HeadingsGUI) {
      He.display();
    }
  }
  
  void detectHeadings() {
    for (component He : HeadingsGUI) {
      He.detect();
    }
  }
  
  void keyDetectHeadings() {
    for (component He : HeadingsGUI) {
      He.keyDetect();
    }
  }
  
  //weight functions
  void displayWeights() {
    for (component W : WeightsGUI) {
      W.display();
    }
  }
  
  void detectWeights() {
    for (component W : WeightsGUI) {
      W.detect();
    }
  }
  
  void keyDetectWeights() {
    for (component W : WeightsGUI) {
      W.keyDetect();
    }
  }

//loadweight
  float[] loadWeight(int tempCount) {
    float[] tempWeight = new float[tempCount];
    int i = 0;
    for (component u : WeightsGUI) {
      tempWeight[i]=float(u.TextLine);
      i++;
    }
    return tempWeight;
  }
  
  //loadheading and loadweight is needed when excel sheet is not in use - loadweight and loadheading missing
String[] loadHeading(int tempCount) {
  String[] tempHeadings = new String[tempCount];
  int i = 0;
  for (component g : HeadingsGUI) {
    tempHeadings[i]=g.TextLine;
    i++;
  }
  return tempHeadings;
}


//work on this next time, just add like three more, dates, headings, hours, weight.
String[] loadDates(int tempDays) {
  String[] tempDates = new String[tempDays];
  int i = 0;
  for (component k : DatesGUI) {
    tempDates[i]=k.TextLine;
    i++;
  }
  return tempDates;
}

float[] loadHours(int tempDays) {
  float[] tempHours = new float[tempDays];
  int i = 0;
  for (component k : HoursGUI) {
    tempHours[i]=float(k.TextLine);
    i++;
  }
  return tempHours;
}
  
// creating the clickbutton in the
ClickButton createClickButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve, int type) {
  ClickButton cb = new ClickButton(tempx, tempy, tempxWidth, tempyWidth, tempText, tempCurve, type);
  if ( type == 1) {
    GeneralGUI.add(cb);
  } else if ( type == 2) {
    DatesGUI.add(cb);
  } else if ( type == 3) {
    HoursGUI.add(cb);
  } else if ( type == 4) {
    WeightsGUI.add(cb);
  } else {
    HeadingsGUI.add(cb);
  }
  return cb;
}

ClickButton createClickButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve) {
  ClickButton cb = new ClickButton(tempx, tempy, tempxWidth, tempyWidth, tempText, tempCurve);
return cb;
}

ToggleButton createToggleButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve, int type) {
  ToggleButton tb = new ToggleButton(tempx, tempy, tempxWidth, tempyWidth, tempText, tempCurve, type);
  if ( type == 1) {
    GeneralGUI.add(tb);
  } else if ( type == 2) {
    DatesGUI.add(tb);
  } else if ( type == 3) {
    HoursGUI.add(tb);
  } else if ( type == 4) {
    WeightsGUI.add(tb);
  } else {
    HeadingsGUI.add(tb);
  }
  return tb;
}


TextField createTextField(int tempx, int tempy, int tempxWidth, int tempyWidth, int type) {
  TextField tf = new TextField(tempx, tempy, tempxWidth, tempyWidth, type);

  if ( type == 1) {
    GeneralGUI.add(tf);
  } else if ( type == 2) {
    DatesGUI.add(tf);
  } else if ( type == 3) {
    HoursGUI.add(tf);
  } else if ( type == 4) {
    WeightsGUI.add(tf);
  } else {
    HeadingsGUI.add(tf);
  }
  return tf;
}

TextField createTextField(int tempx, int tempy, int tempxWidth, int tempyWidth) {
  TextField tf = new TextField(tempx, tempy, tempxWidth, tempyWidth);
  return tf;
}

}
