// DRIVER CLASS
// Displays all visuals and animations, handles mouse events, and ties togethere the other classes

import java.util.*;
import java.io.*;

// Different display screens for different parts of the program
private final int stateWelcomeScreenDisplay=0;
private final int stateShowInstructions= 1;
private final int stateGame=2;
private final int stateGameOver=3;
private final int stateShowLevels = 4;
private int stateOfProgram = stateWelcomeScreenDisplay;

private PImage bgMenu, bgGame, bgIns, bgGameOver, bgLevels, seed;
private PFont f,f2; 

private Game instance;
private Rows rows;

private boolean AI; // true for single player, false for two player
private boolean difficulty; //true for hard, false for easy

//saves coordinates of seeds
private ArrayList<Integer> xcors,ycors;
private ArrayList<PImage> colors;

public void setup(){
  noLoop();
  size(842, 550);
  bgMenu = loadImage("Menu.png");
  bgGame = loadImage("OwareBoard.png");
  bgIns = loadImage("Instructions.jpg");
  bgGameOver = loadImage("GameOver.jpg");
  bgLevels = loadImage("AI.jpg");
  seed = loadImage("yellowSeed.png");

  //randomly generates the coordinates of seeds
  xcors = new ArrayList<Integer>();
  ycors = new ArrayList<Integer>();
  for(int x = 0; x < 48; x++){
    xcors.add((int) random(62));
    ycors.add((int) random(55));
  }
  //instantiates all the classes through the Game class
  instance = new Game();
  rows = instance.getRows();
  
  f = createFont("Arial",16,true); 
  f2 = createFont("Arial Bold",16,true);
}

public void draw() { 
  // displays a different display screen depending on stateOfProgram var
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
    case stateShowLevels:
      stateShowLevels();
      break; 
  } 
}

public void mouseReleased(){
  // allows for different mouse functionality depending on current display screen
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
    case stateShowLevels:
      stateShowLevelsMouse();
      break; 
  }  
  
}

// SCREEN DISPLAY FUNCTIONS
private void stateWelcomeScreenDisplay(){
 background(bgMenu);
}
private void stateShowLevels(){
 background(bgLevels);
}
private void stateShowInstructions(){
 background(bgIns);
}
private void stateGame(){  
  background(bgGame);
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
      image(seed,xcor,ycor);
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
  if(AI)
    text("Computer",50,55);
  else
    text("Player 2",50,55);
  text("Player 1",50,515);
  text("Score: " + instance.getPlayer2().getScore(),650,55);
  text("Score: " + instance.getPlayer1().getScore(),650,515); 
  
}
private void stateGameOver(){
  background(bgGameOver);
  textFont(f,32);                 
  fill(255);
  if(AI){
  if(instance.player1.myWin()){
    text("Player Wins",300,300);
  }else if(instance.player2.myWin()){
    text("Computer Wins",300,300);
  }else if(!instance.validMovesLeft()){
    if(instance.getPlayer1().getScore() > instance.getPlayer2().getScore()){
      text("Player Wins",300,300);
    }else{
      text("Computer Wins",300,300);
    }
  }    
  text("Player's Score: " + instance.getPlayer1().getScore(),280,350);
  text("Computer's Score: " + instance.getPlayer2().getScore(),280,400);
  }else{
  if(instance.player1.myWin()){
    text("Player 1 Wins",300,300);
  }else if(instance.player2.myWin()){
    text("Player 2 Wins",300,300);
  }else if(!instance.validMovesLeft()){
    if(instance.getPlayer1().getScore() > instance.getPlayer2().getScore()){
      text("Player 1 Wins",300,300);
    }else{
      text("Player 2 Wins",300,300);
    }
  }
  text("Player 1's Score: " + instance.getPlayer1().getScore(),280,350);
  text("Player 2's Score: " + instance.getPlayer2().getScore(),280,400); 
  }
}

// ASSOCIATED MOUSE FUNCTIONS
private void stateWelcomeScreenDisplayMouse(){
if(mouseX > 290 && mouseX < 570){
   if(mouseY > 253 && mouseY < 308){
   //single player
   AI = true;   
   stateOfProgram = stateShowLevels; 
   }else if(mouseY > 329 && mouseY < 380){
   //two players 
   AI = false;    
   stateOfProgram = stateGame; 
   }else if(mouseY > 402 && mouseY < 453){
   //instructions  
   stateOfProgram = stateShowInstructions;
   }
}
redraw();
}
private void stateShowInstructionsMouse(){
  stateOfProgram = stateWelcomeScreenDisplay;
  redraw();
}
private void stateGameMouse(){

if((mouseX % 140) > 5 && (mouseX % 140) < 135 ){    
    if(mouseY > 280 && mouseY < 402){
     int pit = 1 + mouseX / 140;
     if(instance.validMove(pit) && rows.getPit(pit).getSeeds()>0){
       instance.getPlayer1().sow(rows.getPit(pit));
       instance.nextTurn(); 
       if(!instance.checkGame()){
          stateOfProgram = stateGameOver;     
       }
       redraw();      
       if(AI){
        if(difficulty){
          instance.getPlayer2().makeMove(instance);
          instance.nextTurn();           
        }else{  
          delay(1000);          
          int randomPit = (int) random(6) + 7;
          while(rows.getPit(randomPit).getSeeds() == 0){
             randomPit = (int) random(6) + 7;
          } 
          instance.getPlayer2().sow(rows.getPit(randomPit));
          instance.nextTurn();           
        } 
       }
     }
    }
    if(mouseY > 140 && mouseY < 264){
     int pit = 12 - (mouseX / 140);
     if(instance.validMove(pit) && rows.getPit(pit).getSeeds()>0){       
        instance.getCurrentPlayer().sow(rows.getPit(pit));
        instance.nextTurn();             
     }
    }
  }
  
  // winning mechanism
  if(!instance.checkGame()){
      stateOfProgram = stateGameOver;     
  }
  redraw();
  
}

private void stateGameOverMouse(){
  instance = new Game();
  rows = instance.getRows();
  stateOfProgram = stateWelcomeScreenDisplay;
  redraw();
}

private void stateShowLevelsMouse(){
  if(mouseY > 300 && mouseY < 390){
   if(mouseX > 145 && mouseX < 314){
   //EASY MODE
   difficulty = false;  
   stateOfProgram = stateGame; 
   }else if(mouseX > 538 && mouseX < 708){
   //HARD MODE
   difficulty = true;    
   stateOfProgram = stateGame; 
   }
  }
  redraw();
}


