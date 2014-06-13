public class Pit{
    int seeds;
    Pit next;
    Pit prev;
    boolean side; //true = L, false = R
    
    public Pit(int s, boolean side){
  seeds = s;
  next = null;
  prev = null;
  this.side = side;
    }
    public int getSeeds(){
  return seeds;
    }
    public Pit getNext(){
  return next;
    }
    public Pit getPrev(){
  return prev;
    }
    public void setSeeds(int s){
  seeds = s;
    }
    public void addSeed(){
  seeds++;
    }
    public void setNext(Pit n){
  next = n;
    }
    public void setPrev(Pit n){
  prev = n;
    }
    public int empty(){
  int temp = seeds;
  seeds = 0;
  return temp;
    }
    public boolean getSide(){
  return side;
    }
    public void setSide(boolean bool){
  side = bool;
    }
}

