package Util;

public class Report {
	public String filePath;
	public int line;
	public String info;

	public Report() {
	}

	public Report(String filePath,int line,String info) {
		this.filePath=filePath;
		this.line=line;
		this.info=info;
	}
	
	public String getFilePath(){
		return filePath;
	}
	
	public void setFilePath(String filePath){
		this.filePath=filePath;
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
}
