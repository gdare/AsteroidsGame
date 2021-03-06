private SpaceShip zeus;
private Star[] fireballs;
//public int lives = 3;
private ArrayList <Asteroids> numRocks = new ArrayList <Asteroids>();
private ArrayList <Bullet> shoot = new ArrayList <Bullet>();
public void setup(){
  size(500,500);
  zeus = new SpaceShip();
  fireballs = new Star[200];
  for(int s = 0; s < fireballs.length; s++){
    fireballs[s] = new Star();
  }
  for(int nr = 0; nr < 10; nr++){
    numRocks.add(new Asteroids());
  }
}
public void draw() 
{ 
  background(0);
  for(int s = 0; s < fireballs.length; s++){
    fireballs[s].show();
  }
  if(keyPressed == true){
    if (key == 'a'){
      zeus.rotate(-3);
    }
    if (key == 'd'){
      zeus.rotate(3);
    }
    if (key == 'w'){
      zeus.accelerate(0.075);
    }
    if (key == 's'){
      zeus.accelerate(-0.075);
    }
  }
  zeus.move();
  zeus.show();
  for(int nr = 0; nr < numRocks.size(); nr++){
    numRocks.get(nr).move();
    numRocks.get(nr).show();
  }
  for(int b = 0; b < shoot.size(); b++){
    shoot.get(b).move();
    shoot.get(b).show();
    for (int nr = 0; nr < numRocks.size(); nr++){
      numRocks.get(nr).getX();
      numRocks.get(nr).getY();
      if (dist(shoot.get(b).getX(), shoot.get(b).getY(), numRocks.get(nr).getX(), numRocks.get(nr).getY()) < 10){
        shoot.remove(b);
        numRocks.remove(nr);
        break;
      }
    }
   
  }
  for(int b = 0; b < shoot.size(); b++){
    if ((shoot.get(b).getX() > width - 10) || (shoot.get(b).getY() > height - 10) || (shoot.get(b).getX() < 10) || (shoot.get(b).getY() < 10)){
      shoot.remove(b);
      break;
    }
  }
}
void keyPressed(){
  if (key == 'f'){
      zeus.setX((int)(Math.random() * 500) + 1);
      zeus.setY((int)(Math.random() * 500) + 1);
      zeus.setDirectionX(0);
      zeus.setDirectionY(0);
    }
    if (key == ' '){
      shoot.add(new Bullet());
    }
}
class SpaceShip extends Floater {   
  SpaceShip(){
    corners = 4; 
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 16;   
    yCorners[0] = 0;
    xCorners[1] = -8;
    yCorners[1] = -8;
    xCorners[2] = -4;
    yCorners[2] = 0;
    xCorners[3] = -8;
    yCorners[3] = 8;
    myColor = color(255,0,0);   
    myCenterX = 250;
    myCenterY = 250;    
    myDirectionX = 0;
    myDirectionY = 0;   
    myPointDirection = 0;     
  }
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}  
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection = degrees;} 
  public double getPointDirection() {return myPointDirection;}
}
class Star{
  private int myxpos, myypos;
  public Star(){
    myxpos = (int)(Math.random()*500)+1;
    myypos = (int)(Math.random()*500)+1;
  }
  public void show(){
    stroke(255);
    fill(255);
    ellipse(myxpos, myypos, 3,3);
  }
}
class Asteroids extends Floater{
  int rotSpeed;
  Asteroids(){
    rotSpeed = (int)(Math.random()*5)+1;
    corners = 4; 
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 10;   
    yCorners[0] = 10;
    xCorners[1] = -10;
    yCorners[1] = 10;
    xCorners[2] = -10;
    yCorners[2] = -10;
    xCorners[3] = 10;
    yCorners[3] = -10;
    myColor = color(150);   
    myCenterX = (int)(Math.random()*500) + 1;
    myCenterY = (int)(Math.random()*500) + 1;    
    myDirectionX = (Math.random()*3)-1;
    myDirectionY = (Math.random()*3)-1;   
    myPointDirection = (Math.random()*360)+1;  
  }
  public void move(){
    rotate(rotSpeed);
    super.move();
  }
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}  
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection = degrees;} 
  public double getPointDirection() {return myPointDirection;}
}
class Bullet extends Floater{
  double dRadians;
  Bullet(){
    myColor = color(0,255,0);
    myCenterX = zeus.getX();
    myCenterY = zeus.getY();
    myPointDirection = zeus.getPointDirection();
    dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians);
    myDirectionY = 5 * Math.sin(dRadians);
  }
  public void show(){
    fill(0,255,0);
    noStroke();
    ellipse((int)myCenterX,(int)myCenterY, 5, 5);
  }
  public void setX(int x) {myCenterX = x;} 
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}  
  public int getY() {return (int)myCenterY;}   
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection = degrees;} 
  public double getPointDirection() {return myPointDirection;}
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

