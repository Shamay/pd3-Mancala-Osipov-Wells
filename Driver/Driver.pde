PImage bg, bSeed, ySeed, pSeed, oSeed;
ArrayList<Seed> seeds;
//Game instance;

void setup() {
  size(842, 550);

  bg = loadImage("OwareBoard.jpg");
  bSeed = loadImage("blueSeed.png");
  ySeed = loadImage("yellowSeed.png");
  pSeed = loadImage("pinkSeed.png");
  oSeed = loadImage("orangeSeed.png");

  //instance = new Game();
  
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
    //s.nextPit();
    s.display();
  }  
}

class Seed {
  int pit; //(1-12)
  PImage col;
  float xcor,ycor;
  boolean inPlay;
  
  Seed(int pit){
   inPlay = true;
   this.pit = pit;
   
   if(pit <= 6){
     xcor = ((pit - 1) * 140) + 21 + random(62);
     ycor = 300 + random(55);
    }else{
     xcor = ((pit - 7) * -140) + 721 + random(62);
     ycor = 160 + random(55);
    }
   
   if((int) random(4) == 0){
    col = bSeed; 
   }else if((int) random(3) == 0){
     col = ySeed;
   }else if((int) random(2) == 0){
     col = oSeed;
   }else{
     col = pSeed;
   }
  }
  void display(){
    image(col,xcor,ycor);
  }  
  
  int getPit(){
    return pit; 
  }
  
  void nextPit(){
    if(pit < 12)
    this.pit++;
    else
    this.pit = 1;
    resetCors(); 
  }
  
  void resetCors(){
    if(pit <= 6){
     xcor = ((pit - 1) * 140) + 21 + random(62);
     ycor = 300 + random(55);
    }else{
     xcor = ((pit - 7) * -140) + 721 + random(62);
     ycor = 160 + random(55);
    }
  }

}
