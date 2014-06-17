public class Opponent extends Player{
  
  private int score;
  private boolean side;
  private Game game;
  public Opponent(boolean side, Game game){
    score=0;
    this.side = side;
    this.game = game;
  }
  public void makeMove(){
    println("making move");
    int[][] results = new int[rows.LENGTH][rows.LENGTH];
    for(int r = 0;r<results.length;r++){
      for(int c = 0;c<results.length;c++){
        Game temp = game;
        if(temp.turn){
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
        if(results[r][i] > max)
          max = results[r][i];
        if(results[r][i] < min)
          min = results[r][i];
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
