public class Player{
    
    private int score;
    private boolean side; //true = L, false = R
    
    public Player(boolean side){
	score=0;
	this.side = side;
    }
    
    public boolean getSide(){
	return side;
    }
    
    public void setSide(boolean bool){
	side = bool;
    }
    
    public int getScore(){
	return score;
    }
    public void setScore(int num){
	score += num;
    }
    
    public void sow(Pit p){         
	//sowing
	int s = p.getSeeds();
	p.setSeeds(0);
	Pit exclude = p;
	while(s>0){                                        
	    p = p.getNext();
	    if(!p.equals(exclude)){
		p.addSeed();
		s--;    
	    }                                               
	}
	
	//capturing
	while(p.getSide() != side && (p.getPrev().getSeeds() == 2 || p.getPrev().getSeeds() == 3)){
	    p = p.getPrev();
	    score += p.empty();
	}
	
    }
    
}