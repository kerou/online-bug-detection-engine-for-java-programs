package Utils;

import java.util.Vector;

import FindBugs.FindBugsXML;
import PMD.PMDXML;

public class XMLParser implements XMLParserInterface {

	public int type;
	public String parseType;
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

	public void parse(UserInfo userInfo, int Pid) {
		switch (this.type) {
		case XMLSettings.PMD:
			processPMD(userInfo, Pid);
			break;
		case XMLSettings.FindBugs:
			processFindBugs(userInfo, Pid);
			break;
		}
	}

	private void processPMD(UserInfo userInfo, int Pid) {
		PMDXML pmdxml = new PMDXML();
		pmdxml.SetInput(input);
		pmdxml.SetParseType(parseType);
		pmdxml.parse(userInfo, Pid);

		for (int i = 0; i < pmdxml.reports.size(); i++) {
			this.reports.add(pmdxml.reports.get(i));
		}

	}

	private void processFindBugs(UserInfo userInfo, int Pid) {
		FindBugsXML fbxml = new FindBugsXML();
		fbxml.SetInput(input);
		fbxml.SetParseType(parseType);
		fbxml.parse(userInfo, Pid);

		for (int i = 0; i < fbxml.reports.size(); i++) {
			this.reports.add(fbxml.reports.get(i));
		}
	}

	public void SetParseType(String parseType) {
		this.parseType = parseType;
	}
}
