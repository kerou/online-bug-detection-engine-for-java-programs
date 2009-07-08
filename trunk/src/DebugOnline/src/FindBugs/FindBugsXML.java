package FindBugs;

import java.util.Vector;

import Utils.Report;
import Utils.XMLParserInterface;

public class FindBugsXML implements XMLParserInterface {

	public String input;
	public Vector<Report> reports;
	
	public FindBugsXML(){
		reports=new Vector<Report>();
	}
	
	public void SetInput(String input) {
		this.input=input;
	}

	public void clear() {
		input="";
		reports.clear();
	}

	public String getOutput() {
		return reports.toString();
	}

	public Vector<Report> getReports() {
		return reports;
	}

	public void parse() {
	}

}
