// overlaps player and rows
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
      this.player1 = player1;
      this.player2 = player2;
      this.rows = rows;
      this.turn = turn;
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
    
    // are these needed?
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
     }
     return true;
   }
}
