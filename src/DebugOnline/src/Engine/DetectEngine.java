package Engine;

import java.util.Vector;

import FindBugs.FindBugsAnalysis;
import PMD.PMDAnalysis;
import Utils.ReportGenerator;

public class DetectEngine extends ReportGenerator {
	
	private static DetectEngine engine;
	private Vector<ReportGenerator> generators;
	
	private DetectEngine(){
		generators=new Vector<ReportGenerator>();
		
		PMDAnalysis pmd=PMDAnalysis.getInstance();
		FindBugsAnalysis findBugs=FindBugsAnalysis.getInstance();
		
		generators.add(pmd);
		//generators.add(findBugs);
	}
	
	public static DetectEngine getInstance(){
		if(engine==null){
			engine=new DetectEngine();
		}
		return engine;
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
	public void reportFromProject(int userId, int projectId) {
	}

	@Override
	public void process() {
		
	}
}
