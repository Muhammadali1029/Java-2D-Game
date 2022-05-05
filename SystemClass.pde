class System
{

  //members///////////
  int qStacks = 0;
  int health = 200;
  int damage = 1;
  ////////////////////

  //Declaring and loading all the images
  PImage imgQStack = loadImage("QStack.png");
  PImage imgBackground = loadImage("background.jpg");
  PImage imgStartScreen = loadImage("Start Screen.png");
  PImage imgInstructions = loadImage("HowTo.png");


  void update()
  {
    render();
    enemyAndPlayer();
  }//render

  void render()
  {
    textSize(50);

    //Draws the Stacks
    image(imgQStack, width*0.04, height*0.92);
    imgQStack.resize(30, 30);
    fill(0, 0, 200);
    textSize(25);
    text(qStacks, width*0.08, height*0.947);

    //Draws the Health 
    fill(0, 200, 0);
    rect(width*0.3, height*0.93, health, height*0.025); //Makes Health Bar
    fill(0);
    textSize(15);
    text("Health:", width*0.41, height*0.99); //Prints Health
    text(health, width*0.52, height*0.99);
  }//render


  void enemyAndPlayer()
  {
    //Decreases Nasus's health if Garen damages untill dead
    if (garen.garenDamage())
    {
      numbers.health -= numbers.damage;//Decreases health if nasus recieves damage
      if (health > 0)
      {
        nasus.nasusGetHit();//Runs anim for nasus taking damage while he is alive
      }//if

      if (numbers.health == 0)
      {
        gameMode = FINISHED;
        numbers.damage = 0; //Stops health bar from going below zero
        fill(0);
        textSize(75);
        text("YOU DIED!", width*0.2, height/2);
      }//if
    }//if

    //Kills Garen if stacks are more than 75
    if (numbers.qStacks >= 30)
    {
      garen.moveSpeed = 0;//stops garen from moving
      fill(250, 0, 0);
      text("KILL GAREN!!!", width*0.35, height*0.1); 

      if (nasus.imageCounterUlt < 50)//Stops Ult animations from looping
      {
        nasus.nasusUlt();
      }//if
      if (garen.killGaren())
      {
        garen.x = -10000;//Removes garen from screen
      }//if
    }//if

    //Displays WIN message
    if (garen.x < 0)
    {
      fill(200, 0, 0);
      textSize(50);
      text("YOU WIN!", width*0.2, height/2);
    }//if
  }//enemyandplayer

  void background()
  {
    image(imgBackground, width/2, height/2);//Draws background
    imgBackground.resize(width, height); //resising to fit screen
  }//background

  void startScreen()
  {
    image(imgStartScreen, width/2, height/2); //Draws startscreen depending on gameMode
    imgStartScreen.resize(width, height);
  }//startScreen

  void instructions()
  {
    image(imgInstructions, width/2, height/2); //Draws instructions screen depending on gameMode
    imgInstructions.resize(width, height);
  }//instructions
}//class Numbers
