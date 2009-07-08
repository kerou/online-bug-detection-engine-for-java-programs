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
	
	public void reportFromString(String src){
	}
	
	public void reportFromFile(String path){
	}
	
	public void reportFromProject(int userId,int projectId){
	}
	
	public void process(){
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
