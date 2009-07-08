package Utils;

import java.util.Vector;

import FindBugs.FindBugsXML;
import PMD.PMDXML;

public class XMLParser implements XMLParserInterface {

	public int type;
	public String input;
	Vector<Report> reports;

	public XMLParser(int type) {
		this.type = type;
		this.reports = new Vector<Report>();
	}

	public void SetInput(String input) {
		this.input = input;
	}

	public void clear() {
		this.input = "";
		this.type = 0;
		reports.clear();
	}

	public String getOutput() {
		return reports.toString();
	}

	public Vector<Report> getReports() {
		return reports;
	}

	public void parse() {
		switch (this.type) {
		case XMLSettings.PMD:
			processPMD();
			break;
		case XMLSettings.FindBugs:
			processFindBugs();
			break;
		}
	}

	private void processPMD() {
		PMDXML pmdxml=new PMDXML();
		pmdxml.SetInput(input);
		pmdxml.parse();
		
		for(int i=0;i<pmdxml.reports.size();i++){
			this.reports.add(pmdxml.reports.get(i));
		}
		
	}

	private void processFindBugs() {
		FindBugsXML fbxml=new FindBugsXML();
		fbxml.SetInput(input);
		fbxml.parse();
		
		for(int i=0;i<fbxml.reports.size();i++){
			this.reports.add(fbxml.reports.get(i));
		}
	}
}
