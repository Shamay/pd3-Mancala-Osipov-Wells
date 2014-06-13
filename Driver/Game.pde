import java.util.*;
import java.io.*;

public class Game{
    
    private Player player1, player2;
    private Rows rows;
    
    public Game(){
      player1 = new Player(true);
      player2 = new Player(false);
      rows = new Rows();
    }
    
    public Player getPlayer1(){
      return player1;
    }
    public Player getPlayer2(){
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
}
