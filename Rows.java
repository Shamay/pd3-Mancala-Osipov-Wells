import java.util.*;
import java.io.*;
public class Rows{
    
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