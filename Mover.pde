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
      location = new PVector(random(_boxSize) - _boxSize / 2, random(_boxSize) - _boxSize / 2, - 100);
    }else
    {
      location = new PVector(random(_boxSize) - _boxSize / 2, random(_boxSize) - _boxSize / 2, 100);
    }
    
    vectorization = new PVector(random(3, 5), random(3, 5), random(3, 5));
    
    if(index % 2 == 0)
    {
      bodyColor = color(random(128,255), random(128,255), random(128,255));
    }else
    {
      bodyColor = color(random(0,128), random(0,128), random(0,128));
    }
    
    bodySize = 20;
    
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
    location.add(vectorization);
   
    if(location.x > _boxSize / 2)
    {
      vectorization.x *= -1;
    }else if(location.x < -_boxSize / 2)
    {
      vectorization.x *= -1;
    }
     
    if(location.y > _boxSize / 2)
    {
      vectorization.y *= -1;
    }else if(location.y < -_boxSize / 2)
    {
      vectorization.y *= -1;
    }
    
    if(index % 2 == 0)
    {
      if(location.z > wallz - vectorization.z - bodySize)
      {
        vectorization.z *= -1;
      }else if(location.z < -_boxSize / 2 - vectorization.z + bodySize)
      {
        vectorization.z *= -1;
      }
    }else
    {
      if(location.z < wallz - vectorization.z + bodySize)
      {
        vectorization.z *= -1;
      }else if(location.z > _boxSize / 2 - vectorization.z - bodySize)
      {
        vectorization.z *= -1;
      }
    }
    
    /*
    if(index % 2 == 0)
    {
      location = new PVector(noise(noisex) * 400 - 200, noise(noisey) * 400 - 200, noise(noisez) * ((wallz - bodySize) - (-200)) + (-200));
    }else
    {
      location = new PVector(noise(noisex) * 400 - 200, noise(noisey) * 400 - 200, noise(noisez) * (200 - (wallz + bodySize)) + (wallz + bodySize));
    }
    noisex += 0.025;
    noisey += 0.025;
    noisez += 0.025;
    */
  }
  
  void display()
  {    
    pushMatrix();
    translate(width / 2, height /2, 0);
    rotateY(_rot);
    translate(location.x, location.y, location.z);
    rotateY(_rot * 5);
    noStroke();
    fill(bodyColor);
    box(bodySize);  
    popMatrix();
  }
}