float _boxSize = 350;
float _rot;
float wallz, wallDirection;
Mover m[];

void setup()
{
  size(1280, 720, P3D);
  frameRate(30);
  smooth();
  
  _rot = 90;
  wallz = 0;
  wallDirection = 2;
  m = new Mover[512];
  for(int i = 0; i < m.length; i++)
  {
    m[i] = new Mover(i);
  }
}

void draw()
{
  background(255);
  lights();
 
  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(_rot);
  noFill();
  stroke(128);
  box(_boxSize + 5);
  popMatrix();

  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(_rot);
  translate(0, 0, wallz);
  fill(255, 128);
  rect(-_boxSize / 2, -_boxSize / 2, _boxSize, _boxSize);
  popMatrix();
  
  if(frameCount % 15 == 1)
  {
    // Mover new_m = new Mover(frameCount / 15);
    // m = (Mover[])append(m, new_m);
  }
  
  for(int i = 0; i < m.length; i++)
  {
    m[i].drawMe();
  }

  if(wallz > 130 || wallz < -130)
  {
    wallDirection *= -1;
  }
  wallz += wallDirection;
  
  _rot += 0.01;
  
  // saveFrame("screen-#####.png");  
  // println(frameCount);
  
  if(frameCount > 1800)
  {
    exit();
  }
}