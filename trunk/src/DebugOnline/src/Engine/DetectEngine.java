package Engine;

import java.util.Vector;

import FindBugs.FindBugsAnalysis;
import PMD.PMDAnalysis;
import Utils.ReportGenerator;

public class DetectEngine extends ReportGenerator {
	
	private Vector<ReportGenerator> generators;
	
	public DetectEngine(){
		generators=new Vector<ReportGenerator>();
		
		PMDAnalysis pmd=new PMDAnalysis();
		FindBugsAnalysis findBugs=new FindBugsAnalysis();
		
		generators.add(pmd);
		//generators.add(findBugs);
	}
	
	@Override
	public void reportFromString(String src) {
		for(int i=0;i<generators.size();i++){
			generators.get(i).reportFromString(src);
			
			for(int j=0;j<generators.get(i).reports.size();j++){
				reports.add(generators.get(i).reports.get(j));
			}
		}
		process();
	}

	@Override
	public void reportFromFile(String path) {
		for(int i=0;i<generators.size();i++){
			generators.get(i).reportFromFile(path);
			
			for(int j=0;j<generators.get(i).reports.size();j++){
				reports.add(generators.get(i).reports.get(j));
			}
		}
		process();
	}

	@Override
	public void reportFromProject(int userId,String projectName){
		for(int i=0;i<generators.size();i++){
			generators.get(i).reportFromProject(userId, projectName);
			
			for(int j=0;j<generators.get(i).reports.size();j++){
				reports.add(generators.get(i).reports.get(j));
			}
		}
	}

	@Override
	public void process() {
		
	}
}
