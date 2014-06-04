import java.util.*;
import java.io.*;
public class Rows{
    private class Pit{
        int seeds;
        Pit next;
        public Pit(int s){
            seeds = s;
            next = null;
        }
        public int getSeeds(){
            return seeds;
        }
        public Pit getNext(){
            return next;
        }
        public void setSeeds(int s){
            seeds = s;
        }
        public void setNext(Pit n){
            next = n;
        }
    }
    final int LENGTH = 6;
    Pit L,R;
    public Rows(){
        L = new Pit(4);
        R = L;
        for(int x = 0;x<LENGTH;x++){
            R.setNext(new Pit(4));
            R = R.getNext();
        }
        Pit temp = R;
        for(int x = 0;x<LENGTH-1;x++){
            temp.setNext(new Pit(4));
            temp = temp.getNext();
        }
        temp.setNext(L);
    }
    public String toString(){
        String r = "";
        Pit p = L;
        for(int x = 0;x<LENGTH*2;x++){
            r += ", " + p.getSeeds();
            p = p.getNext();
        }
        return r;
    }
    public Pit getL(int i){
        Pit t = L
            for(int x = 0;x<i;x++)
                t = t.getNext();
        return t;
    }
    public Pit getR(int i){
        Pit t = R
            for(int x = 0;x<i;x++)
                t = t.getNext();
        return t;
    }
    /*    public void sow(Pit p){                                                                                                                                                                                                                                                      
	  int s = p.getSeeds();
	  p.setSeeds(0);                                                                                                                                                                                                                                                             	  while(s>0){                                                                                                                                                                                                                                                                
	  p = p.getNext();                                                                                                                                                                                                                                                       
    */
    
}