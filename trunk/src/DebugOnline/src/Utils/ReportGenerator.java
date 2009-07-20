package Utils;

import java.util.Vector;

public class ReportGenerator {
	
	public String result;
	public String toolType;
	public Vector<Report> reports;
	
	public ReportGenerator(){
		reports=new Vector<Report>();
	}
	
	public void setToolType(String type){
		this.toolType=type;
	}
	
	public void reportFromString(String src,String SessionId){
	}
	
	public void reportFromFile(String path){
	}
	
	public void reportFromProject(int userId,String projectName,int Pid){
	}
	
	public void process(){
	}
	
	public String getFileName(String src) {
		return null;
	}
	
	public Vector<Report> getReports(){
		return reports;
	}
	
	public String getResult(){
		return result;
	}
	
	public String toString(){
		return "this is the report Generator "+toolType;
	}
}
