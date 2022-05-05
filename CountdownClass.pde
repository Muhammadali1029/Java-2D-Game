class Countdown
{
  int durationSeconds;

  Countdown(int duration)
  {
    this.durationSeconds = duration;
  }//constructor

  int getRemainingTime() //return the seconds left on the timer or 0
  { //millis() processing command, returns time in 1000ths sec since program started
    return max(0, durationSeconds - millis()/1000) ;
  }//getRemainingTime

  void update()
  {
    render();
    timeRunsOut();
  }//update

  void render()
  {
    if (garen.x > 0)
    {
      textSize(15);
      text(getRemainingTime(), 20, 30); //display seconds remaining top left
      text("seconds", 40, 30);
    }//if
  }//render

  //Prints lose message if time runs out and stacks are not enoough
  void timeRunsOut()
  {
    if (numbers.qStacks < 30)
    {
      if (getRemainingTime() <= 0)
      {
        gameMode = FINISHED;
        fill(200, 0, 0);
        textSize(75);
        text("YOU LOSE!", width*0.2, height/2);
        textSize(18);
        text("YOU RAN OUT OF TIME", width*0.3, height*0.54);
      }//if
    }//if
  }//timeRunsOut
}//class CountDown
