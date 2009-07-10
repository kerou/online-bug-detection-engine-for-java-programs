package FindBugs;

import java.io.StringReader;
import java.util.Vector;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

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
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		try
		{
			builder=factory.newDocumentBuilder();
			StringReader sr = new StringReader(input);
			InputSource is = new InputSource(sr);
			Document doc = builder.parse(is);
			doc.normalize();
			
			Element root = doc.getDocumentElement();
			NodeList bugs = root.getElementsByTagName("BugInstance");
			for (int i = 0; i < bugs.getLength(); i++) 
			{
				Element bugElement=(Element)bugs.item(i);
				Report report = new Report();
				
				
				report.setPriority(Integer.parseInt(bugElement.getAttribute("priority")));
				report.setInfo(bugElement.getFirstChild().getTextContent());
				report.setLine(Integer.parseInt(bugElement.getChildNodes().item(6)
						.getAttributes().getNamedItem("start").getTextContent()));
				report.setFilePath(bugElement.getElementsByTagName("class").item(0).getAttributes().item(0).getTextContent());
			}
		}
		catch (Exception e)
		{
			
		}
	}

}
