package Util;

public class ReportGenerater {
	
	String result;
	String type;
	
	public void setType(String type){
		this.type=type;
	}
	
	public void reportFromString(String src){
	}
	
	public void reportFromFile(String path){
	}
	
	public void reportFromProject(int userId,int projectId){
	}
	
	public void process(){
		
	}
	
	public String getResult(){
		return result;
	}
	
	public String toString(){
		return "this is the report Generator "+type;
	}
}
