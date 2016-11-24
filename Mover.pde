class Mover
{
  int index;
  PVector location;
  PVector vectorization;
  color bodyColor;
  float bodySize;
  
  float noisex, noisey, noisez;
  
  Mover(int i)
  {
    index = i;
    if(index % 2 == 0)
    {
      location = new PVector(0, 0, -100);
    }else
    {
      location = new PVector(0, 0, 100);
    }
    vectorization = new PVector(random(3, 5), random(3, 5), random(3, 5));
    
    if(index % 2 == 0)
    {
      bodyColor = color(0, 0, random(255));
    }else
    {
      bodyColor = color(random(255), 0, 0);
    }
    bodySize = 10;
    
    noisex = random(10);
    noisey = random(10);
    noisez = random(10);
  }
  
  void drawMe()
  {
    update();
    display();
  }
  
  void update()
  {
    if(index % 2 == 0)
    {
      location = new PVector(noise(noisex) * 400 - 200, noise(noisey) * 400 - 200, noise(noisez) * (wallz - (-200 + bodySize)) + (-200 + bodySize));
    }else
    {
      location = new PVector(noise(noisex) * 400 - 200, noise(noisey) * 400 - 200, noise(noisez) * (200 - (wallz + bodySize)) + (wallz + bodySize));
    }
    noisex += 0.025;
    noisey += 0.025;
    noisez += 0.025;
  }
  
  void display()
  {    
    pushMatrix();
    translate(width / 2, height /2, 0);
    rotateY(rot);
    translate(location.x, location.y, location.z);
    noStroke();
    fill(bodyColor);
    sphere(bodySize);  
    popMatrix();
  }
}