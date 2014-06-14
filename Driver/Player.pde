public class Player{
    private int score;
    private boolean side; //true = L, false = R
    priave boolean myWin; // keeps track of if the player won
    
    public Player(boolean side){
      score=0;
      this.side = side;
    }
    
    public boolean getSide(){
      return side;
    }
    
    public void setSide(boolean bool){
      side = bool;
    }
    
    public int getScore(){
      return score;
    }
    public void addScore(int num){
      score += num;
    }
    
    public boolean myWin(){
       return myWin; 
    }
    
    public void sow(Pit p){     // changed from Pit input to int    
      //sowing
      int s = p.empty();
      Pit exclude = p;
      while(s>0){                                        
        p = p.getNext();
        if(!p.equals(exclude)){
          p.addSeed();
          s--;    
        }                                               
      }
           
    //capturing
      while(p.getSide() != side && (p.getSeeds() == 2 || p.getSeeds() == 3)){        
        score += p.empty();
        p = p.getPrev();
    }
    if(score > 24)
      myWin == true;
  
  }
 
  
    
}
