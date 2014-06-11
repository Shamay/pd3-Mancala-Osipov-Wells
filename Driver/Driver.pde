PImage bg, bSeed, ySeed, pSeed, oSeed;
ArrayList<Seed> seeds;
void setup() {
  size(1200, 550);

  bg = loadImage("OwareBoard.jpg");
  bSeed = loadImage("blueSeed.png");
  ySeed = loadImage("yellowSeed.png");
  pSeed = loadImage("pinkSeed.png");
  oSeed = loadImage("orangeSeed.png");
  
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
  //for(Seed s: seeds){
  // s.display();
  //}   
  int oldxcor = (int) seeds.get(0).xcor;
  int oldycor = (int) seeds.get(0).ycor;
  seeds.get(0).nextPit();
  int newxcor = (int) seeds.get(0).xcor;
  int newycor = (int) seeds.get(0).ycor;
  
  int slope = (newycor - oldycor) / (newxcor - oldxcor);
  while(newycor - oldycor > 2 && newxcor - oldxcor > 2){
   seeds.get(0).xcor++;
   seeds.get(0).ycor+=slope;
   delay(50);
   seeds.get(0).display();
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
     xcor = ((pit - 1) * 140) + 200 + random(62);
     ycor = 300 + random(55);
    }else{
     xcor = ((pit - 7) * -140) + 900 + random(62);
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
     xcor = ((pit - 1) * 140) + 200 + random(62);
     ycor = 300 + random(55);
    }else{
     xcor = ((pit - 7) * -140) + 900 + random(62);
     ycor = 160 + random(55);
    }
  }

}
