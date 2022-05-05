class Objective
{
  //members///////////////////////
  float x, y;
  PImage imgMinion = loadImage ("minion.png");//load minion image
  ArrayList<PImage>minionDieList = new ArrayList();//loads images for purple cloud anim
  PImage imgMinionDie;
  int imgCounter = 0;
  /////////////////////////////////


  Objective(float x, float y)
  {
    this.x = x;
    this.y = y;
    imgMinion.resize(25, 25);
    imageMode(CENTER);

    for (int i=1; i<=6; i++)//Loads images for purple cloud
    {
      imgMinionDie = loadImage("minionDie" + i + ".png");
      minionDieList.add(imgMinionDie);
    }//forUP
  }//constructor

  void update()
  {
    render();
  }//update

  void render()
  {
    image(imgMinion, x, y);
  }//render

  //Draws the animation for the purple cloud
  void minionDie(float x, float y)
  {
    int imageNumber = imgCounter/4;
    PImage currentImage = minionDieList.get(imageNumber);
    image(currentImage, x, y);
    imageMode(CENTER);
    imgMinionDie.resize(15, 15);
    imgCounter++;
    if (imgCounter == 24)
    {
      imgCounter = 0;
    }//if
  }//minionDie
  ////////////////////////////////////////
}//class Objective
