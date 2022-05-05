class Enemy
{
  //memebers//////////
  float x, y; 
  float speedX = 0;
  float speedY = 0;
  float moveSpeed = 0.5;
  int animSize = 75;
  ///////////////////

  ArrayList<PImage>garenList = new ArrayList();//ArrayList for Garen's animations
  int imageCounterGaren = 0;//used in garenAnim Code


  //Constructor///////////////////
  Enemy(float x, float y)
  {
    this.x = x;
    this.y = y;

    ////Loading all the images for the animation///////////
    PImage imgGaren;
    for (int imgNum=1; imgNum<=7; imgNum++)
    {
      imgGaren = loadImage("garen" + imgNum + ".png");
      imgGaren.resize(animSize, animSize);
      garenList.add(imgGaren);//adding animations to the arraylist
    }//forUP
    //////////////////////////////////////////////////////
  }//EnemyConstructor

  void update()
  {
    render();
    move();
  }//update

  ///Draws all the animation/////////////////////////
  void render()
  {
    int imageNumber = imageCounterGaren/4;//to slow down the animation
    PImage currentImage = garenList.get(imageNumber);
    imageMode(CENTER);
    image(currentImage, x, y);
    imageCounterGaren++;
    if (imageCounterGaren == 28)//resetting imagecounter to avoid going outside of arraylist and causing error
    {
      imageCounterGaren = 0;
    }//if
  }//render
  ////////////////////////////////////////////////


  ///Procedure to chase nasus///////////////////////
  void move()
  {
    if (nasus.x > this.x)
    {
      speedX = moveSpeed;
    }//ifmore

    else if (nasus.x < this.x)
    {
      speedX = -moveSpeed;
    }//ifless

    if (nasus.y > this.y)
    {
      speedY = moveSpeed;
    }//ifmore

    else if (nasus.y < this.y)
    {
      speedY = -moveSpeed;
    }//ifless

    this.x = this.x + this.speedX;
    this.y = this.y + this.speedY;
  }//move
  ////////////////////////////////////////////////


  //Detects if Garen is doing damage to nasus depending on distance///////////////
  boolean garenDamage()
  {
    float distance = dist(nasus.x, nasus.y, garen.x, garen.y);
    if (distance <= 20)
    {
      if (numbers.qStacks < 30)
      {
        return true;
      }//ifif
    }//if
    return false;
  }//boolean
  /////////////////////////////////////////////////////////////////////////////


  ///Kills Garen if stacks are more than 75 and distance is less than 200
  boolean killGaren()
  {
    float distance = dist(nasus.x, nasus.y, garen.x, garen.y);
    if (distance <= 70)
    {
      if (keyPressed)
      {
        if (key == ' ')
        {
          return true;
        }//ifspacebar
      }//ifkeyPressed
    }//if
    return false;
  }//killGaren
  //////////////////////////////////////////////////////////////////////////
}//class Enemy
