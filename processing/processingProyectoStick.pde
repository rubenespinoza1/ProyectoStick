import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[0], 9600);
boolean painting;

int x; 
int y;
int b;

int pX;
int pY;

int centerX;
int centerY;

int pointerX;
int pointerY;
int minX;
int maxX;

PFont f;
String portName;
String val;



void setup()
{
  painting = false;
  size ( 512 , 512 ) ; 
  minX = 1000;
  maxX = 0;
  myPort.bufferUntil('\n'); 
  f = createFont("Arial", 16, true);
  textFont ( f, 16 ) ; 
  pX = 256;
  pY = 256;
  
  pointerX = 256;
  pointerY = 256;
background(0);
  //strokeWeight(8);
  //noLoop();
  //delay(500);
  
}


void draw()
{
  
  //clear();
  //text("x=" + x/2 + "y=" + y/2 , 10,10);
  fill(255) ;
  stroke(255);
  text("x=" + x/2 + "y=" + y/2 , 10,10);
  if (b == 1)
  {
    
    if (!painting){
      painting = true;
    }else{
      painting = false;
    }
    
  }
  
  if (x/2 > 270){
      pointerX++;
    }else if (x/2 < 250){
      pointerX--;
    }  
    if (y/2 > 264){
      pointerY++;
    }else if (y/2 < 244){
      pointerY--;
    }
  if (painting){
    
    
    
    
    
    
    //clear();
    //text("x=" + pointerX + "y=" + pointerY , 10,10);
    
    //line(pX,pY,pointerX,pointerY);
    ellipse(pointerX, pointerY, 10, 10);
    pX = pointerX;
    pY = pointerY;
  }else{
    clear();
    //stroke(0);
    fill(255);
    ellipse(pointerX, pointerY, 10, 10);
    //pointerX = x/2;
    //pointerY = y/2;
  }  
  
  //redraw();
}


void serialEvent( Serial myPort) 
{
  try{
  val = myPort.readStringUntil('\n');
  if (val != null)
  {
        val = trim(val);
    int[] vals = int(splitTokens(val, ","));
    x = vals[0];
    y = vals[1] ;
    b = vals[2];
    
    centerX = x/2;
    centerY = y/2;

  }
  }catch(RuntimeException e){
    e.printStackTrace();
  }
}
