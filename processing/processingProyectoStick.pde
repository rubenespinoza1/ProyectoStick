import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[0], 9600);
boolean painting;

int x; 
int y;
int b;

int pX;
int pY;
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
  background(102);
  strokeWeight(8);
  //noLoop();
  //delay(500);
}


void draw()
{
  
  fill(255) ;
  if (b == 1)
  {
    
    if (!painting){
      painting = true;
    }else{
      painting = false;
    }
    
  }
  
  if (painting){
    //text("AnalogX="+(1023-x)+" AnalogY="+(1023-y)+ " minX="+minX + " maxX="+maxX,10,20);
    /*if((|x-pX|)>20){
      x++
    }*/
    
    stroke(153);
    line(pX,pY,x/2,y/2);
    ellipse(x/2, y/2, 4, 4);
    pX = x/2;
    pY = y/2;
  }else{
    clear();
    ellipse(x/2, y/2, 20, 20);
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

  }
  }catch(RuntimeException e){
    e.printStackTrace();
  }
}
