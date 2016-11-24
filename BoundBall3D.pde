float rot;
Mover m[];

void setup()
{
  size(1280, 720, P3D);
  frameRate(30);
  smooth();
  
  rot = 0;
  m = new Mover[0];
  for(int i = 0; i < m.length; i++)
  {
    m[i] = new Mover();
  }
}

void draw()
{
  background(0);
  lights();
 
  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(rot);
  rotateY(rot);
  noFill();
  stroke(255);
  box(400, 400, 400);
  popMatrix();
      
  if(frameCount % 15 == 1)
  {
    Mover new_m = new Mover();
    m = (Mover[])append(m, new_m);
  }
  
  for(int i = 0; i < m.length; i++)
  {
    m[i].drawMe();
  }

  
  rot += 0.001;
}