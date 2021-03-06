import java.util.*;
import java.io.*;
//  Nodes of a doubly linked list
// they now have associated numbers to identify themselves
public class Pit{
    int seeds,num;
    Pit next,prev;    
    boolean side; //true = L, false = R
    
    public Pit(int s, boolean side,int num){
      seeds = s;
      next = null;
      prev = null;
      this.side = side;
      this.num = num; 
    }
    
    public int getNum(){
       return num; 
    }
    public void setNum(int num){
      this.num = num;   
    }
    public void setSeeds(int seeds){
      this.seeds = seeds;
    }
    public int getSeeds(){
      return seeds;
    }
    public int empty(){ //Helper for sowing
      int temp = seeds;
      seeds = 0;
      return temp;
    }
    public void addSeed(){
      seeds++;
    }
    public void subSeed(){
       seeds--; 
    }
    
    public Pit getNext(){
      return next;
    }
    public Pit getPrev(){
      return prev;
    }    
    public void setNext(Pit n){
      next = n;
    }
    public void setPrev(Pit n){
      prev = n;
    }
 
    public boolean getSide(){
      return side;
    }
    public void setSide(boolean bool){
      side = bool;
    }
}

