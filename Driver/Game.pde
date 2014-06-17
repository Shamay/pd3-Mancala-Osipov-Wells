import java.util.*;
import java.io.*;
// Contains players and rows, organizes their interaction
public class Game{
    
    private Player player1, player2;
    private Rows rows;
    private boolean turn; // true = player1, false = player2
    
    public Game(){      
      player1 = new Player(true);
      player2 = new Player(false);
      rows = new Rows();
      turn = true;
    } 
    public Game(Player player1, Player player2, Rows rows, boolean turn){      
      //helps create new Games for cloning
      this.player1 = player1;
      this.player2 = player2;
      this.rows = rows;
      this.turn = turn;
    } 
    public Game clone(){ ////Duplicates game for AI purposes
      return new Game(player1.clone(), player2.clone(), rows.clone(), turn);
    }
    public boolean validMove(int pit){
      //Determines whether a given move may be made at this time
      if(turn)
        return pit < 7 && pit > 0;
      else
        return pit < 13 && pit > 6;
    }
    
    public boolean validMovesLeft(){
      //Helper for game-over conditions
      if(turn){
          for(int x = 1; x < 7; x++){
            if(getRows().getPit(x).getSeeds() > 0)
              return true;
          }
      }else{
          for(int x = 7; x < 13; x++){
             if(getRows().getPit(x).getSeeds() > 0)
              return true;
          }
      }
      return false;
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
    
    // Token accessors, mutators
    public void setPlayer1(Player player1){
      this.player1 = player1;
    }
    public void setPlayer2(Player player2){
      this.player2 = player2;
    }
    // ----------------------
    
    public Rows getRows(){
      return rows;
    }
    public void setRows(Rows rows){
      this.rows = rows;
    }
    
   public void nextTurn(){
      turn=!turn;
   } 
   public boolean getTurn(){
     return turn;
   }
   
   public boolean checkGame(){ //  true = still in progress
     if(player1.myWin()){
       return false;
     }else if(player2.myWin()){
       return false;
     }else if(!validMovesLeft()){
       return false; 
     }
     return true;
   }
}
