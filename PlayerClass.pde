class Player
{
  //members//////////
  int x, y;
  float moveSpeed;
  int animSize = 100;
  ///////////////////

  ///ALL THE ARRAYLISTS FOR THE DIFFERENT NASUS ANIMATIONS//////
  //(I tried to put all the animations in one arraylist but did not work)
  //(Can not figure out polymorphism for these arraylists :( )
  ArrayList<PImage>nasusUpList = new ArrayList(); 
  ArrayList<PImage>nasusStandList = new ArrayList(); 
  ArrayList<PImage>nasusDownList = new ArrayList(); 
  ArrayList<PImage>nasusRightList = new ArrayList(); 
  ArrayList<PImage>nasusLeftList = new ArrayList(); 
  ArrayList<PImage>nasusHitList = new ArrayList(); 
  ArrayList<PImage>nasusGetHitList = new ArrayList();
  ArrayList<PImage>nasusDieList = new ArrayList();
  ArrayList<PImage>nasusUltList = new ArrayList();
  ///////////////////////////////////////////////////////////////

  PImage imgUP, imgStand, imgDown, imgRight, imgLeft, imgHit, imgGetHit, imgDie, imgUlt;//Declaring all images

  //Also members////////////////
  int imageCounterUp = 0;
  int imageCounterStand = 0;
  int imageCounterDown = 0;
  int imageCounterRight = 0;
  int imageCounterLeft = 0;
  int imageCounterHit = 0;
  int imageCounterGetHit = 0;
  int imageCounterDie = 0;
  int imageCounterUlt = 0;
  ///////////////////////////// 

  Player(int x, int y, float moveSpeed)
  {
    this.x = x;
    this.y = y;
    this.moveSpeed = moveSpeed;

    ////LOADING ALL THE IMAGES FOR THE DIFFERENT ANIMATIONS////////////////////
    for (int Up=1; Up<=17; Up++)
    {
      imgUP = loadImage("UP" + Up + ".png");
      nasusUpList.add(imgUP);
      imgUP.resize(animSize, animSize);
    }//forUP

    for (int standing=1; standing<=14; standing++)
    {
      imgStand = loadImage("St" + standing + ".png");
      nasusStandList.add(imgStand);
      imgStand.resize(animSize, animSize);
    }//forIDLE

    for (int down=1; down<=17; down++)
    {
      imgDown = loadImage("Down" + down + ".png");
      nasusDownList.add(imgDown);
      imgDown.resize(animSize, animSize);
    }//forDOWN

    for (int right=1; right<=17; right++)
    {
      imgRight = loadImage("Right" + right + ".png");
      nasusRightList.add(imgRight);
      imgRight.resize(animSize, animSize);
    }//forRIGHT

    for (int left=1; left<=17; left++)
    {
      imgLeft = loadImage("Left" + left + ".png");
      nasusLeftList.add(imgLeft);
      imgLeft.resize(animSize, animSize);
    }//forLEFT

    for (int hit=1; hit<=16; hit++)
    {
      imgHit = loadImage("Q" + hit + ".png");
      nasusHitList.add(imgHit);
      imgHit.resize(animSize, animSize);
    }//forHIT

    for (int getHit=1; getHit<=6; getHit++)
    {
      imgGetHit = loadImage("GetHit" + getHit + ".png");
      nasusGetHitList.add(imgGetHit);
      imgGetHit.resize(animSize, animSize);
    }//forGETHIT

    for (int die=1; die<=7; die++)
    {
      imgDie = loadImage("Die" + die + ".png");
      nasusDieList.add(imgDie);
      imgDie.resize(animSize, animSize);
    }//forDIE

    for (int ult=1; ult<=15; ult++)
    {
      imgUlt = loadImage("Ult" + ult + ".png");
      nasusUltList.add(imgUlt);
      imgUlt.resize(animSize, animSize);
    }//forULT
    //////////////////////////////////////////////////////////////////////////////////
  }//Consturctor

  void update()
  {
    render();
    nasusOnScreen();
  }//update


  //RUNNING THE ANIMATIONS DEPENDING ON WHICH KEY IS PRESSED AND IF NASUS IS STILL ALIVE////////
  void render()
  {
    if (keyPressed)
    {
      if (keyCode == UP && numbers.health > 0)
      {
        nasusUP();
      }//UP
      if (keyCode == DOWN && numbers.health > 0)
      {
        nasusDown();
      }//DOWN
      if (keyCode == RIGHT && numbers.health > 0)
      {
        nasusRight();
      }//RIGHT
      if (keyCode == LEFT && numbers.health > 0)
      {
        nasusLeft();
      }//LEFT
      if (key == ' ' && numbers.health > 0)
      {
        nasusHit();
      }//
    }//keyPressed

    //IF NO KEY PRESSED, GAREN STILL ALIVE AND NOT TAKING DAMAGE////////////////
    else
    {
      if (garen.garenDamage() == false && numbers.health > 0)
      {
        nasusStand();
      }//if
    }//else
  }//render
  //////////////////////////////////////////////////////////////////////////////////////


  ////////DIFFERENT PROCEDURES FOR DIFFERNT ANIMATIONS FOR NASUS//////////////////////////
  void nasusUP()
  {
    int imageNumber = imageCounterUp/2;
    PImage currentImage = nasusUpList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterUp++;
    if (imageCounterUp == 34)
    {
      imageCounterUp = 0;
    }//if
  }//nasusUP

  void nasusStand()
  {
    int imageNumber = imageCounterStand/2;
    PImage currentImage = nasusStandList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterStand++;
    if (imageCounterStand == 28)
    {
      imageCounterStand = 0;
    }//if
  }//nasusStand

  void nasusDown()
  {
    int imageNumber = imageCounterDown/2;
    PImage currentImage = nasusDownList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterDown++;
    if (imageCounterDown == 34)
    {
      imageCounterDown = 0;
    }//if
  }//nasusDown

  void nasusRight()
  {
    int imageNumber = imageCounterRight/2;
    PImage currentImage = nasusRightList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterRight++;
    if (imageCounterRight == 34)
    {
      imageCounterRight = 0;
    }//if
  }//nasusRight

  void nasusLeft()
  {
    int imageNumber = imageCounterLeft/2;
    PImage currentImage = nasusLeftList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterLeft++;
    if (imageCounterLeft == 34) 
    {
      imageCounterLeft = 0;
    }//if
  }//nasusLeft

  void nasusHit()
  {
    int imageNumber = imageCounterHit/2;
    PImage currentImage = nasusHitList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterHit++;
    if (imageCounterHit == 32)
    {
      imageCounterHit = 0;
    }//if
  }//nasusHit

  void nasusGetHit()
  {
    int imageNumber = imageCounterGetHit/4;
    PImage currentImage = nasusGetHitList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterGetHit++;
    if (imageCounterGetHit == 24)
    {
      imageCounterGetHit = 0;
    }//if
  }//nasusGetHit

  void nasusDie()
  {
    int imageNumber = imageCounterDie/6;
    PImage currentImage = nasusDieList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imageCounterDie++;
    if (imageCounterDie == 42)
    {
      imageCounterDie = 35;
    }//if
  }//nasusDie

  void nasusUlt()
  {
    int imageNumber = imageCounterUlt/4;
    PImage currentImage = nasusUltList.get(imageNumber);
    imageMode(CENTER);
    image(currentImage, x, y);
    imageCounterUlt++;
    if (imageCounterUlt == 60)
    {
      imageCounterUlt = 0;
    }//if
  }//nasusUlt
  //////////////////////////////////////////////////////////////////////////

  /////kEEPS NASUS ON-SCREEN/////////////////////////////////////////////////
  void nasusOnScreen()
  {
    if (x >= width)
    {
      x = width;
    }//ifWidth
    if (x <= 0)
    {
      x = 0;
    }//ifX0
    if (y >= height)
    {
      y = height;
    }//if
    if (y <= 0)
    {
      y = 0;
    }//ifY0
  }//nasusOnScreen
  /////////////////////////////////////////////////////////////////////////
}//class Player
