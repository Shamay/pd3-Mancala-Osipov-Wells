public class Seed {
  int pit; //(1-12)
  PImage col;
  float xcor,ycor;
  //boolean inPlay;
  
  Seed(int pit){
   //inPlay = true;
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
    if(pit < 12){
      if(pit < 7){
        rows.getL(pit).subSeed();
        rows.getL(pit).getNext().addSeed();
      }else if(pit < 13){
        rows.getR(pit-6).subSeed();
        rows.getR(pit-6).getNext().addSeed();
      }
      this.pit++;
    }
    else{
      rows.getR(6).subSeed();
      rows.getL(1).addSeed();
      this.pit = 1;
    }
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
