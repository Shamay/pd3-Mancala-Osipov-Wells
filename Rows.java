import java.util.*;
import java.io.*;
public class Rows{
    
    private class Pit{
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

    final int LENGTH = 6;
    Pit L,R;

    public Rows(){
        L = new Pit(4,true);
        R = L;
        for(int x = 0;x<LENGTH;x++){
            R.setNext(new Pit(4, true));
	    R.getNext().setPrev(R);
            R = R.getNext();
        }
	R.setSide(false);
        Pit temp = R;
        for(int x = 0;x<LENGTH-1;x++){
            temp.setNext(new Pit(4, false));
	    temp.getNext().setPrev(temp);
            temp = temp.getNext();
        }
        temp.setNext(L);
	L.setPrev(temp);
    }
    public String toString(){
        String r = "";
        Pit p = L;
        for(int x = 0;x<LENGTH*2;x++){
            r += p.getSeeds() + ""+ p.getSide() + ", ";
            p = p.getNext();
        }
        return r;
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


    public static void main(String[] args){
	Rows instance = new Rows();
	System.out.println(instance);
    }
}