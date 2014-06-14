PImage bg, bSeed, ySeed, pSeed, oSeed;
PFont f; 
Game instance;
Rows rows;

//saves properties of seeds
ArrayList<Integer> xcors,ycors;
ArrayList<PImage> colors;

void setup(){
  size(842, 550);

  bg = loadImage("OwareBoard.jpg");
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

  instance = new Game();
  rows = instance.getRows();
  f = createFont("Arial",16,true); 
}

void draw() {
  background(bg);
  
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
         ycor = 300 + ycors.get(count);
      }else{
         xcor = ((num - 7) * -140) + 721 + xcors.get(count);
         ycor = 160 + ycors.get(count);
      }
      image(colors.get(count),xcor,ycor);
      count++;   
    }
  }
    
  textFont(f,16);                 
  fill(0);
  for(int x = 1; x < 7; x++){                            
    text(""+rows.getPit(x).getSeeds(), 65 + (140*(x-1)),435);  
  }
  for(int x = 7; x < 13; x++){
    text(""+rows.getPit(x).getSeeds(), 765 - (140*(x-7)),115);
  }
  text("Player 2",50,40);
  text("Player 1",50,500);
  text("Score: " + instance.getPlayer2().getScore(),650,40);
  text("Score: " + instance.getPlayer1().getScore(),650,500);
}

void mouseReleased(){
  if((mouseX % 140) > 5 && (mouseX % 140) < 135 ){    
    if(mouseY > 280 && mouseY < 402){
      int pit = 1 + mouseX / 140;
     if(instance.validMove(pit) && rows.getPit(pit).getSeeds()>0){
       instance.getCurrentPlayer().sow(rows.getPit(pit));
       instance.nextTurn();
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
}


