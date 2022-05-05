class Heal extends Collect //inheritance
{
  PImage imgHeal = loadImage("health.png");

  Heal(float x, float y, int size)
  {
    super(x, y, size);
  }//constructor

  void update()
  {
    render();
    collisionNasus();
  }//update

  void render()
  {
    image(imgHeal, x, y);
    imgHeal.resize(size, size);
  }//render

  void collisionNasus() //polymorphism
  {
    if (numbers.health < 800)
    {
      super.collisionNasus();
      if (x < 0)
      {
        numbers.health = 200;
      }//ifif
    }//if
  }//collisionNasus
}//class Heal extends Collect
