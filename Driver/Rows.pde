import java.util.*;
import java.io.*;
// A linked list of Pits, constituting the gameboard.

public class Rows{
    
    final int LENGTH = 6; //Number of pits per row, in general
    Pit L,R; //First pits in each row

    public Rows(){ // Creates a circular, doubly linked list with two pointers.
        L = new Pit(4,true,1);
        R = L;
        for(int x = 0;x<LENGTH;x++){
            R.setNext(new Pit(4, true,2+x));
            R.getNext().setPrev(R);
            R = R.getNext();
        }
        R.setSide(false);
        R.setNum(7);
        Pit temp = R;
        for(int x = 0;x<LENGTH-1;x++){
            temp.setNext(new Pit(4, false,8+x));
            temp.getNext().setPrev(temp);
            temp = temp.getNext();
        }
        temp.setNext(L);
        L.setPrev(temp);
    }
    
    public Rows(Pit L){
      this.L = L;
      R = L;
      for(int x=0;x<LENGTH;x++){
      R = R.getNext();
      }
    }
    public Rows clone(){ //Duplicates rows for AI purposes
      Rows ans = new Rows();
      for(int x=0;x<LENGTH*2;x++){
        ans.getPit(x).setSeeds(getPit(x).getSeeds());
      }
      return ans;
    }
    
    public Pit getL(int i){
        Pit t = L;
            for(int x = 0;x<i;x++)
                t = t.getNext();
        return t;
    }
    
    public Pit getR(int i){
        Pit t = R;
            for(int x = 0;x<i;x++)
                t = t.getNext();
        return t;
    }
    
    public Pit getPit(int i){
        Pit t = L;
            for(int x = 1;x<i;x++)
                t = t.getNext();
        return t;
    }

}
