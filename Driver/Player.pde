public class Player{
    private ArrayList<Seed> seeds;
    private int score;
    private boolean side; //true = L, false = R
    
    public Player(boolean side, ArrayList<Seed> seeds){
      score=0;
      this.side = side;
      this.seeds = seeds;
    }
    
    //public ArrayList<Seed> getSeedList(){
    //  return seeds; 
    //}
    
    public boolean getSide(){
      return side;
    }
    
    public void setSide(boolean bool){
      side = bool;
    }
    
    public int getScore(){
      return score;
    }
    public void setScore(int num){
      score += num;
    }
    
    public void sow(int pit){     // changed from Pit input to int    
      //sowing
      /*int s = p.getSeeds();
      p.setSeeds(0);
      Pit exclude = p;
      while(s>0){                                        
        p = p.getNext();
        if(!p.equals(exclude)){
          p.addSeed();
          s--;    
        }                                               
      }*/
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
  
    //capturing
    //while(p.getSide() != side && (p.getPrev().getSeeds() == 2 || p.getPrev().getSeeds() == 3)){
    //    p = p.getPrev();
    //    score += p.empty();
    //}
  
  }
  
  
    
}
