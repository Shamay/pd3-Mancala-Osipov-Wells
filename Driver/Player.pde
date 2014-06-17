import java.util.*;
import java.io.*;
//Allows the game to hold distinct scores and move capabilities
//for each player. 
public class Player{
    private int score;
    private boolean side; //true = L, false = R
    private boolean myWin; // keeps track of if the player won
    
    public Player(){
      score = 0;
      side = true;
    }
    public Player(boolean side){
      score=0;
      this.side = side;
    }
    public Player(boolean side, int score){
      this.score=score;
      this.side = side;
    }
    public Player clone(){ //Duplicates player for AI purposes
      return new Player(side, score);
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
    
    public void sow(Pit p){ //A player's basic move in Oware    
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
      myWin = true;
  
  }
  public void makeMove(Game game){ //This is the bulk of the hard AI code
    int[][] results = new int[rows.LENGTH][rows.LENGTH];
    //forms a 2d array to keep track of possible results of next 2 turns
    for(int r = 0;r<results.length;r++){
      if(rows.getR(r).getSeeds() == 0){ //Disallows sowing from empty pits
        for(int i : results[r])
          i = -100;
      } else {
        for(int c = 0;c<results.length;c++){
          Game temp = game.clone(); //copies the game LENGTH^2 times
          delay(50);
          if(temp.turn){ //goes through all possible move combinations
            temp.getPlayer1().sow(temp.getRows().getL(r));
            temp.getPlayer2().sow(temp.getRows().getR(c));
            results[r][c] = temp.getPlayer1().getScore()-temp.getPlayer2().getScore();
          } else {
            temp.getPlayer2().sow(temp.getRows().getR(r));
            temp.getPlayer1().sow(temp.getRows().getL(c));
            results[r][c] = temp.getPlayer2().getScore()-temp.getPlayer1().getScore();
          }
        }
      }
    }
    if(game.turn) //sows from the best pit available
      sow(rows.getL(bestRow(results)));
    else
      sow(rows.getR(bestRow(results)));
  }
  public int bestRow(int[][] results){
    int[] wcNetGain = new int[rows.LENGTH];
    //assumes worst case -- best move by opponent -- and makes optimal move considering this
    for(int r = 0;r<rows.LENGTH;r++){
      int max = results[r][0];
      int min = results[r][0];
      for(int i : results[r]){
        if(i > max)
          max = i;
        if(i < min)
          min = i;
      }
      wcNetGain[r] = min;
    }
    int ans = 0;
    int max = wcNetGain[0];
    for(int i = 0;i<wcNetGain.length;i++){
      if(wcNetGain[i]>max){
        max = wcNetGain[i];
        ans = i;
      }
    }
    return ans;
  }
 
  
    
}
