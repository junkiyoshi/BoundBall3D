float rot;
float wallz, wallDirection;
Mover m[];

void setup()
{
  size(1280, 720, P3D);
  frameRate(30);
  smooth();
  
  rot = 90;
  wallz = 0;
  wallDirection = 1;
  m = new Mover[2];
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
  rotateY(rot);
  noFill();
  stroke(128);
  box(400, 400, 400);
  popMatrix();

  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(rot);
  translate(0, 0, wallz);
  fill(0, 0, 255, 128);
  rect(-200, -200, 400, 400);
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

  if(wallz > 190 || wallz < -190)
  {
    wallDirection *= -1;
  }
  wallz += wallDirection;
  
  rot += 0.01;
}