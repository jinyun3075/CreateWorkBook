package wrong;
import java.util.ArrayList;

public class wrong {
	ArrayList<Integer> wrong =null;
		
	public ArrayList<Integer> getWrong() {
		return wrong;
	}
	public void setWrong(ArrayList<Integer> wrong) {
		this.wrong = wrong;
	}
	public void add(Integer b) {
		wrong.add(b);
	}
	public void prin() {
		for(int i =0;i<wrong.size();i++) {
			System.out.println("action="+ wrong.get(i)+" size="+wrong.size());
		}
	}
}
