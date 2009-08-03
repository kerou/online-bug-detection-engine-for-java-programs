package Utils;

import java.util.Vector;

public class ReportGenerator {
	
	public String name;
	public String result;
	public String toolType;
	public Vector<Report> reports;
	
	public ReportGenerator(){
		reports=new Vector<Report>();
	}
	
	public void setToolType(String type){
		this.toolType=type;
	}
	
	public void reportFromString(String src,String SessionId,UserInfo userInfo){
	}
	
	public void reportFromFile(String path,UserInfo userInfo){
	}
	
	public void reportFromProject(int userId,String projectName,int Pid,UserInfo userInfo){
	}
	
	public void process(UserInfo userInfo,int Pid){
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
