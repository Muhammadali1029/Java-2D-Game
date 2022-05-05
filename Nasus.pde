//i tried my best :)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////  NNNNNNN      NNN   AAAAAAAA    SSSSSSSSS   UUU   UUU   SSSSSSSSS ////////////////////////////////////
//////////////////  NNN   NNN    NNN   AAA    AAA   SSSSS       UUU   UUU   SSSSS     //////////////////////////////////////
////////////////// NNN     NNN  NNN   AAAAAAAAAAAA     SSSSS    UUU   UUU      SSSSS  ///////////////////////////////////
///////////////// NNN       NNNNNN   AAAA       AAA SSSSSSSSS   UUUUUUUUU   SSSSSSSSS ///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////classes///////////
Player nasus;
Objective minions;
Enemy garen;
System numbers;
Heal healing;
Countdown timer;
///////////////////////

ArrayList<Objective> minionsList = new ArrayList(); //ArrayList for the minions (placing all the minion related stuff in the objectives tab was causing
//too much lag at the start of the program so I had to put it here) 


//declaring different gameMode states/////
final int PLAYING = 1;
final int FINISHED = 0;
final int STARTSCREEN = 2;
final int INSTRUCTIONS = 3;
int gameMode = STARTSCREEN;
/////////////////////////////////////////


/////S    E    T   U   P////////////////////////////////////////////////////
void setup()
{
  size(500, 375);//size of screen
  
  /////Adding minions to the minions ArrayList/////////////////////////
  for (int i=0; i<15; i++)//15 minions
  {
    minionsList.add(new Objective(random(50, width), random(50, height-100)));
  }//for
  ///////////////////////////////////////////////////////////////////////

  nasus = new Player(width/2, height/2, 2.5);//Spawns nasus in the middle of the screen
  garen = new Enemy(width/10, height/5);//spawns garen at location
  minions = new Objective(random(50, width-50), random(50, height-100));//Spawning minions at random locations on the screen
  numbers = new System();//Runs all the code for the health, stacks and other stuff
  healing = new Heal(width*0.9, height*0.93, 25);//Heal
  timer = new Countdown(60); //call CountDown constructor – 60 secs
}//setup
///////////////////////////////////////////////////////////////////////////////


///////D   R   A   W///////////////////////////////////////////////
void draw()
{
  ///////////////////////////////////////////
  if (gameMode == STARTSCREEN)
  {
    numbers.startScreen();//Draws start screen
  }//ifGameModeStartScreen
  //////////////////////////////////////////
  if (gameMode == INSTRUCTIONS)
  {
    numbers.instructions();//Draws instructions screen
  }//ifGameModeInstructions
  /////////////////////////////////////////
  if (gameMode == PLAYING)
  {
    numbers.background();
    timer.update();//Draws timer
    minionsUpdate();//Runs code to Draw minions in the minions arraylist
    numbers.update();//Draws other stuff on the screen
    healing.update();//Draws heal item
    nasus.update();//Draws nasus 
    garen.update();//Draws garen
  }//ifGameModePlaying
  /////////////////////////////////////////
  if (gameMode == FINISHED)
  {
    nasus.nasusDie();//Draws nasus death anim
  }
  /////////////////////////////////////////
}//draw
////////////////////////////////////////////////////////////////////


/////Creating and removing minions from the arraylist/////////////////////////////////////
//(Could not keep this in the Objectives class beacause it was causing too much lag at the start of the program)
void minionsUpdate()
{
  for (int i=0; i<minionsList.size(); i++)//Runs the code for how many minions remain in the arraylist
  {
    Objective currentMinion = minionsList.get(i); //Creating a refeerence not a new minion object
    currentMinion.update();//Draws the minions

    //CODE TO KILL A MINION//////////////////////////////////////////////////////////////////////////////////////////////
    float distance = dist(nasus.x, nasus.y, currentMinion.x, currentMinion.y);//Calculates distance between nasus and minion
    if (distance < 20)//if distance is less than 100 between nasus and minion
    {
      if (keyPressed)
      {
        if (key == ' ')//Spacebar to kill
        {
          minionsList.remove(i);//Removes the minions from the arraylist if it is killed
          numbers.qStacks += 3;//Increases stacks value by 3
          minions.minionDie(currentMinion.x, currentMinion.y);//Creates the purple cloud and minion's death location(dont know why it doesnt work sometimes ingame)
        }//Spacebar
      }//keyPressed
    }//if
  }//for
}//minionsUpdate


///Keys for nasus and for changing gameMode states////////////////////////
void keyPressed()
{
  if (gameMode == PLAYING)
  {
    if (key == CODED)
    {
      if (keyCode == UP)
      {
        nasus.y -= nasus.moveSpeed;
      }//UP
      if (keyCode == DOWN)
      {
        nasus.y += nasus.moveSpeed;
      }//DOWN
      if (keyCode == RIGHT)
      {
        nasus.x += nasus.moveSpeed;
      }//RIGHT
      if (keyCode == LEFT)
      {
        nasus.x -= nasus.moveSpeed;
      }//LEFT
    }//CODED
  }//if

  if (key == ENTER)
  {
    if (gameMode == STARTSCREEN || gameMode == FINISHED)
    {
      gameMode = PLAYING;
    }//if
  }//ENTER

  if (keyCode == 'H')
  {
    if (gameMode == STARTSCREEN)
    {
      gameMode = INSTRUCTIONS;
    }//if
  }//SHIFT

  if (key == BACKSPACE)
  {
    if (gameMode == INSTRUCTIONS)
    {
      gameMode = STARTSCREEN;
    }//if
  }//BACKSPACE
}//keyPressed
///////////////////////////////////////////////////////////
