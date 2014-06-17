import java.util.*;
import java.io.*;
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
    public Player clone(){
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
      myWin = true;
  
  }
  public void makeMove(Game game){
    println(game.getRows().getL(0).getSeeds());
    println("Making Move");
    int[][] results = new int[rows.LENGTH][rows.LENGTH];
    for(int r = 0;r<results.length;r++){
      for(int c = 0;c<results.length;c++){
        Game temp = game.clone();
        println("creating game");
        delay(50);
        if(temp.turn){
          temp.getPlayer1().sow(temp.getRows().getL(r));
          temp.getPlayer2().sow(temp.getRows().getR(c));
          results[r][c] = temp.getPlayer1().getScore()-temp.getPlayer2().getScore();
        } else {
          println(game.getRows().getL(0).getSeeds());
          temp.getPlayer2().sow(temp.getRows().getR(r));
          temp.getPlayer1().sow(temp.getRows().getL(c));
          results[r][c] = temp.getPlayer2().getScore()-temp.getPlayer1().getScore();
        }
      }
    }
    if(game.turn)
      sow(rows.getL(bestRow(results)));
    else
      sow(rows.getR(bestRow(results)));
  }
  public int bestRow(int[][] results){
    int[] wcNetGain = new int[rows.LENGTH];
    for(int r = 0;r<rows.LENGTH;r++){
      int max = results[r][0];
      int min = results[r][0];
      for(int i : results[r]){
        if(i > max)
          max = i;
        if(i < min)
          min = i;
      }
      wcNetGain[r] = max-min;
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
