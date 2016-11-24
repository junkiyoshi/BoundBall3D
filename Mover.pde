class Mover
{
  PVector location;
  PVector vectorization;
  color bodyColor;
  float bodySize;
  
  Mover()
  {
    location = new PVector(0, 0, 0);
    vectorization = new PVector(random(-5,5), random(-5,5), random(-5,5));
    bodyColor = color(random(128,255), random(128,255), random(128,255));
    bodySize = 10;
  }
  
  void drawMe()
  {
    update();
    display();
  }
  
  void update()
  {
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
  }
  
  void display()
  {    
    pushMatrix();
    translate(width / 2, height /2, 0);
    rotateX(rot);
    rotateY(rot);
    
    translate(location.x, location.y, location.z);
    
    noStroke();
    fill(bodyColor);
    sphere(bodySize);
    
    popMatrix();
  }
}