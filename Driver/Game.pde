import java.util.*;
import java.io.*;

public class Game{
    
    private Player player1, player2;
    private Rows rows;
    private ArrayList<Seed> seeds; // instantiates seedList 
    private boolean turn; // true = player1, false = player2
    
    public Game(){
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
      
      player1 = new Player(true, seeds);
      player2 = new Player(false, seeds);
      rows = new Rows();
      turn = true;
      
      
    }
  
    public ArrayList<Seed> getSeedList(){
     return seeds;
    } 
    
    public boolean validMove(int pit){
      if(turn)
        return pit < 7 && pit > 0;
      else
        return pit < 13 && pit > 6;
    }
    
    public Player getPlayer1(){
      return player1;
    }
    public Player getPlayer2(){
      return player2;
    }
    public Player getCurrentPlayer(){
      if(turn)
        return player1;
      return player2;
    }
    public void setPlayer1(Player player1){
      this.player1 = player1;
    }
    public void setPlayer2(Player player2){
      this.player2 = player2;
    }
    public Rows getRows(){
      return rows;
    }
    public void setRows(Rows rows){
      this.rows = rows;
    }
   public void nextTurn(){
      turn=!turn;
   } 
}
