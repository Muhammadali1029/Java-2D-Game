class Collect
{
  //members//////
  float x, y;
  int size;
  ///////////////

  Collect(float x, float y, int size)
  {
    this.x = x;
    this.y = y;
    this.size = size;
  }//constructor

  //Collision detection for heal item
  void collisionNasus()
  {
    float distance = dist(nasus.x, nasus.y, this.x, this.y);
    if (distance <= 15)
    {
      x = -1000;
    }//if
  }//collisionNasus
}//class Collect
