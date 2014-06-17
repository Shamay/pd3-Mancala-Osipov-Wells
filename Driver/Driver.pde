final int stateWelcomeScreenDisplay=0;
final int stateShowInstructions= 1;
final int stateGame=2;
final int stateGameOver=3;
int stateOfProgram = stateWelcomeScreenDisplay;

PImage bgMenu, bgGame, bgIns, gbGameOver, bSeed, ySeed, pSeed, oSeed;
PFont f,f2; 
Game instance;
Rows rows;
boolean AI;

//saves properties of seeds
ArrayList<Integer> xcors,ycors;
ArrayList<PImage> colors;

void setup(){
  size(842, 550);
  bgMenu = loadImage("Menu.png");
  bgGame = loadImage("OwareBoard.png");
  bgIns = loadImage("Instructions.jpg");
  bgGameOver = loadImage("GameOver.jpg");
  bSeed = loadImage("blueSeed.png");
  ySeed = loadImage("yellowSeed.png");
  pSeed = loadImage("pinkSeed.png");
  oSeed = loadImage("orangeSeed.png");

  xcors = new ArrayList<Integer>();
  ycors = new ArrayList<Integer>();
  for(int x = 0; x < 48; x++){
    xcors.add((int) random(62));
    ycors.add((int) random(55));
  }
  colors = new ArrayList<PImage>();
  for(int x = 0; x < 48; x++){
    if((int) random(4) == 0){
     colors.add(bSeed); 
   }else if((int) random(3) == 0){
     colors.add(ySeed);
   }else if((int) random(2) == 0){
     colors.add(oSeed);
   }else{
     colors.add(pSeed);
   } 
  }
  if(AI)
    instance = new Game(true);
  else
    instance = new Game(false);
  rows = instance.getRows();
  f = createFont("Arial",16,true); 
  f2 = createFont("Arial Bold",16,true);
}

void draw() {
  switch(stateOfProgram) {
    case stateWelcomeScreenDisplay: 
      stateWelcomeScreenDisplay();  
      break;  
    case stateShowInstructions: 
      stateShowInstructions();  
      break;  
    case stateGame: 
      stateGame();
      break;    
    case stateGameOver: 
      stateGameOver(); 
      break; 
  }  
}

void mouseReleased(){
  switch(stateOfProgram) {
    case stateWelcomeScreenDisplay: 
      stateWelcomeScreenDisplayMouse();  
      break;  
    case stateShowInstructions: 
      stateShowInstructionsMouse();  
      break;  
    case stateGame: 
      stateGameMouse();
      break;    
    case stateGameOver: 
      stateGameOverMouse(); 
      break; 
  }  
}

private void stateWelcomeScreenDisplay(){
 background(bgMenu);
}
private void stateShowInstructions(){
 background(bgIns);
}
private void stateGame(){
  background(bgGame);
  
  // winning mechanism
  //if(!checkGame())
  //    break;
 
  int count = 0;
  for(int x = 1; x < 13;x++){
    Pit p = rows.getPit(x);
    int num = p.getNum();
    int seeds = p.getSeeds();
    for(int y = 0; y < seeds; y++){
      float xcor,ycor;
      if(num <= 6){
         xcor = ((num - 1) * 140) + 21 + xcors.get(count);
         ycor = 306 + ycors.get(count);
      }else{
         xcor = ((num - 7) * -140) + 721 + xcors.get(count);
         ycor = 166 + ycors.get(count);
      }
      image(colors.get(count),xcor,ycor);
      count++;   
    }
  }
     
  textFont(f,24);                 
  fill(0);
  for(int x = 1; x < 7; x++){                            
    text(""+rows.getPit(x).getSeeds(), 65 + (140*(x-1)),441);  
  }
  for(int x = 7; x < 13; x++){
    text(""+rows.getPit(x).getSeeds(), 765 - (140*(x-7)),127);
  }
  
  textFont(f2,36);
  fill(255);
  text("Player 2",50,55);
  text("Player 1",50,515);
  text("Score: " + instance.getPlayer2().getScore(),650,55);
  text("Score: " + instance.getPlayer1().getScore(),650,515);  
}
private void stateGameOver(){
  background(bgGameOver);
}

private void stateWelcomeScreenDisplayMouse(){
if(mouseX > 290 && mouseX < 570){
   if(mouseY > 253 && mouseY < 308){
   //single player
   AI = true;   
   stateOfProgram = stateGame; 
   }else if(mouseY > 329 && mouseY < 380){
   //two players 
   AI = false;    
   stateOfProgram = stateGame; 
   }else if(mouseY > 402 && mouseY < 453){
   //instructions  
   stateOfProgram = stateShowInstructions;
   }
}
}
private void stateShowInstructionsMouse(){
  stateOfProgram = stateWelcomeScreenDisplay;
}
private void stateGameMouse(){
if((mouseX % 140) > 5 && (mouseX % 140) < 135 ){    
    if(mouseY > 280 && mouseY < 402){
      int pit = 1 + mouseX / 140;
     if(instance.validMove(pit) && rows.getPit(pit).getSeeds()>0){
       instance.getCurrentPlayer().sow(rows.getPit(pit));
       instance.nextTurn();
       if(AI){
         println(AI);
         instance.nextTurn();
       } 
     }
    }
    if(mouseY > 140 && mouseY < 264){
     int pit = 12 - (mouseX / 140);
     if(instance.validMove(pit) && rows.getPit(pit).getSeeds()>0){
       instance.getCurrentPlayer().sow(rows.getPit(pit));
       instance.nextTurn();
       if(AI){
         println(AI);
         ((Opponent)instance.getPlayer2()).makeMove();
         instance.nextTurn();
       } 
     }
    }
  }
}
private void stateGameOverMouse(){
  stateOfProgram = stateGameOver;
}



