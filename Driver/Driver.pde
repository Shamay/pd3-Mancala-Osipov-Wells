PImage bg, bSeed, ySeed, pSeed, oSeed;
ArrayList<Seed> seeds;
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
  
  seeds = new ArrayList<Seed>();
  for(int x = 0 ; x < 4 ; x++){
    seeds.add(new Seed(1));
    seeds.add(new Seed(2));
    seeds.add(new Seed(3));
    seeds.add(new Seed(4));
    seeds.add(new Seed(5));
    seeds.add(new Seed(6));
    seeds.add(new Seed(7));
    seeds.add(new Seed(8));
    seeds.add(new Seed(9));
    seeds.add(new Seed(10));
    seeds.add(new Seed(11));
    seeds.add(new Seed(12));
  }
}

void draw() {
  background(bg);
  for(Seed s: seeds){
    s.display();
  }  
}

void mouseReleased(){
  if((mouseX % 140) > 5 && (mouseX % 140) < 135 ){    
    if(mouseY > 280 && mouseY < 402){
      int pit = 1 + mouseX / 140;
     if(instance.validMove(pit)){
       instance.getCurrentPlayer().sow(rows.getPit(pit));
       visualSow(pit);
     }
    }else if(mouseY > 140 && mouseY < 264){
     int pit = 12 - (mouseX / 140);
     if(instance.validMove(pit)){
       instance.getCurrentPlayer().sow(rows.getPit(pit));
       visualSow(pit);
     }
    }
  }
}

void visualSow(int pit){
  int count = 1;
  for(Seed s: seeds){
   if(s.getPit() == pit){
      for(int x = 0; x < count; x++){
        s.nextPit();
      }
      for(int x = -1; x < count / 12;x++){
      count++;
      }
   }
  }
}
