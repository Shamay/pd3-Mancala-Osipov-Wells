PImage bg, bSeed, ySeed, pSeed, oSeed;
ArrayList<Seed> seeds;
PFont f; 
Game instance;
Rows rows;

void setup(){
  size(842, 550);

  bg = loadImage("OwareBoard.jpg");
  bSeed = loadImage("blueSeed.png");
  ySeed = loadImage("yellowSeed.png");
  pSeed = loadImage("pinkSeed.png");
  oSeed = loadImage("orangeSeed.png");

  instance = new Game();
  rows = instance.getRows();
  seeds = instance.getSeedList();
  f = createFont("Arial",16,true); 
}

void draw() {
  background(bg);
  for(Seed s: seeds){
    s.display();
  }
  
  textFont(f,16);                 
  fill(0);
  for(int x = 1; x < 7; x++){                            
    text(""+rows.getPit(x).getSeeds(), 65 + (140*(x-1)),435);  
  }
  for(int x = 7; x < 13; x++){
    text(""+rows.getPit(x).getSeeds(), 765 - (140*(x-7)),115);
  }
}

void mouseReleased(){
  if((mouseX % 140) > 5 && (mouseX % 140) < 135 ){    
    if(mouseY > 280 && mouseY < 402){
      int pit = 1 + mouseX / 140;
     if(instance.validMove(pit)){
       instance.getCurrentPlayer().sow(pit);
       instance.nextTurn();
     }
    }
    if(mouseY > 140 && mouseY < 264){
     int pit = 12 - (mouseX / 140);
     if(instance.validMove(pit)){
       instance.getCurrentPlayer().sow(pit);
       instance.nextTurn();
     }
    }
  }
  
}

void visualSow(int pit){
  
}
