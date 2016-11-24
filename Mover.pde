class Mover
{
  PVector location;
  PVector vectorization;
  color bodyColor;
  float bodySize;
  
  float noisex, noisey, noisez;
  
  Mover()
  {
    location = new PVector(0, 0, 0);
    vectorization = new PVector(random(3, 5), random(3, 5), random(3, 5));
    bodyColor = color(random(128,255), random(128,255), random(128,255));
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
    location = new PVector(noise(noisex) * 400 - 200, noise(noisey) * 400 - 200, noise(noisez) * 400 - 200);
    noisex += 0.01;
    noisey += 0.01;
    noisez += 0.01;
    
    /*
    location.add(vectorization);
    
    if(location.x > 200)
    {
      vectorization.x *= -1;
    }else if(location.x < -200)
    {
      vectorization.x *= -1;
    }
    
    if(location.y > 200)
    {
      vectorization.y *= -1;
    }else if(location.y < -200)
    {
      vectorization.y *= -1;
    }
    
    if(location.z > 200)
    {
      vectorization.z *= -1;
    }else if(location.z < -200)
    {
      vectorization.z *= -1;
    }
    */
  }
  
  void display()
  {    
    pushMatrix();
    translate(width / 2, height /2, 0);
    //rotateX(rot);
    rotateY(rot);
    
    translate(location.x, location.y, location.z);
    
    noStroke();
    fill(bodyColor);
    sphere(bodySize);
       
    popMatrix();
  }
}