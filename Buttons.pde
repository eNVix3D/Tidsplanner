// super class component for all of GUI
class component {

  int x;
  int y;
  int xWidth;
  int yWidth;
  String Text;
  int Curve;
  int t;
  boolean Power;
  color BoxFill = 255;
  String TextLine ="";

  void display() {
    fill(BoxFill);
    rect(x, y, xWidth, yWidth, Curve);

    pushMatrix();
    fill(0);
    textAlign(CENTER);
    textSize(20);
    text(Text, x+xWidth/2, y+yWidth/2+5);
    popMatrix();
  }
  
  void keyDetect(){}
  
  boolean detect(){
    return Power;
  }
  
}

//makes the normal button that you click once for putting in use
class ClickButton extends component {

  ClickButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve, int type) {
    x = tempx;
    y = tempy;
    xWidth = tempxWidth;
    yWidth = tempyWidth;
    Text = tempText;
    Curve = tempCurve;
    t = type;
  }
  ClickButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve) {
    x = tempx;
    y = tempy;
    xWidth = tempxWidth;
    yWidth = tempyWidth;
    Text = tempText;
    Curve = tempCurve;
  }

  boolean detect() {
    if (mouseX >= x && mouseX <= x+xWidth && mouseY >= y && mouseY <= y+yWidth) {
      return true;
    } else return false;
  }
}

// Makes the textField class for use om the front end
class TextField extends component {

  boolean Power = false;

  TextField(int tempx, int tempy, int tempxWidth, int tempyWidth, int type) {
    x = tempx;
    y = tempy;
    xWidth = tempxWidth;
    yWidth = tempyWidth;
    t = type;
  }
  TextField(int tempx, int tempy, int tempxWidth, int tempyWidth) {
    x = tempx;
    y = tempy;
    xWidth = tempxWidth;
    yWidth = tempyWidth;
  }

  boolean detect() {
    if (!Power && mouseX >= x && mouseX <= x+xWidth && mouseY >= y && mouseY <= y+yWidth) {
      Power = true;
    } else {
      Power = false;
    }
    return Power;
  }

  void keyDetect() {
    if (Power) {
      if (keyCode != 8 && keyCode != 20 && keyCode != 16 && keyCode != 17) {
        TextLine += key;
      } else if (TextLine.length()!=0 && keyCode == 8) {
        TextLine = TextLine.substring(0, TextLine.length()-1);
      }
    }
  }

  void display() {
    fill(BoxFill);
    rect(x, y, xWidth, yWidth);
    if (Power) {
      fill(0);
      // this bitch er linjen under, idk really knwo how to make this work for all of them without 
      rect(x+10, y+30, xWidth-20, 2);
    }
    fill(0);
    textAlign(CENTER);
    text(TextLine, x+(xWidth/2), y+(yWidth/2));
  }
}

class ToggleButton extends component {

  ToggleButton(int tempx, int tempy, int tempxWidth, int tempyWidth, String tempText, int tempCurve, int type) {
    x = tempx;
    y = tempy;
    xWidth = tempxWidth;
    yWidth = tempyWidth;
    Text = tempText;
    Curve = tempCurve;
    t = type;
  }

  boolean detect() {
    if (mouseX >= x && mouseX <= x+xWidth && mouseY >= y && mouseY <= y+yWidth && !Power) {
      BoxFill = 160;
      Power = true;
      return true;
    } else if (mouseX >= x && mouseX <= x+xWidth && mouseY >= y && mouseY <= y+yWidth && Power) {
      BoxFill = 255;
      Power = false;
      return false;
    } else if (Power) {
      return true;
    } else if (!Power) {
      return false;
    } else {
      println("error");
      return false;
    }
  }
}
