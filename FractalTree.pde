private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
private int myBranchLength = 15;
private int myX = 250;
private int myY = 300;
public void setup() 
{   
  size(500,500);    
} 
public void draw() 
{   
  background(#F0B73C,5);   
  stroke(#3C5AA5);
  drawBranches(myX,myY, myBranchLength, 3*Math.PI/2);
  if(mousePressed == true){
    drawBranches(myX,myY,myBranchLength, 3*Math.PI/2); 
  }else{
    augment();
  }
  drawBranches(myX,myY,myBranchLength,3*Math.PI/2);
} 

public void augment(){
  myBranchLength++;
  if(myBranchLength >= 75){
      myBranchLength = 15;
    }
}

public void keyPressed(){
  if(key == ' '){
    branchAngle += .02;
    if(branchAngle >= 1.2){
      myY = 250;
    }
    if(branchAngle >= 2){
      branchAngle = .2;
      myY = 300;
    }
  }
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1;
  double angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  branchLength *= fractionLength;
  int endX1, endY1, endX2, endY2;
  endX1 = (int)(branchLength*Math.cos(angle1) + x);
  endX2 = (int)(branchLength*Math.cos(angle2) + x);
  endY1 = (int)(branchLength*Math.sin(angle1) + y);
  endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y, endX1,endY1);
  line(x,y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
