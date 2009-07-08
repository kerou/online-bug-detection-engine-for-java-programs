package Utils;

public class Report {
	public String filePath;
	public int line;
	public int priority;
	public String info;

	public Report() {
	}

	public Report(String filePath,int line,int priority,String info) {
		this.filePath=filePath;
		this.line=line;
		this.priority=priority;
		this.info=info;		
	}
	
	public String getFilePath(){
		return filePath;
	}
	
	public void setFilePath(String filePath){
		this.filePath=filePath;
	}
	
	public int getPriority(){
		return priority;
	}
	
	public void setPriority(int priority){
		this.priority=priority;
	}
	
	public int getLine(){
		return line;
	}
	
	public void setLine(int line){
		this.line=line;
	}
	
	public String getInfo(){
		return info;
	}
	
	public void setInfo(String info){
		this.info=info;
	}
	
	public String toString(){
		StringBuffer sb=new StringBuffer("");
		
		sb.append("File:"+filePath);
		sb.append("line:"+line);
		sb.append("priority:"+priority);
		sb.append("Info:"+info);
		
		return sb.toString();
	}
}
