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
			
			System.out.print("xby");
			System.out.println(bugs.getLength());
			for (int i = 0; i < bugs.getLength(); i++) 
			{
				
				Element bugElement=(Element)bugs.item(i);
				//System.out.println(bugElement.getElementsByTagName("SourceLine").getLength());
				for (int j=0;j<bugElement.getElementsByTagName("SourceLine").getLength();j++)
				{
					if (bugElement.getElementsByTagName("SourceLine").item(j).getParentNode().equals(bugElement))
					{
						Report report = new Report();
						report.setPriority(Integer.parseInt(bugElement.getAttribute("priority")));
						report.setInfo(bugElement.getElementsByTagName("ShortMessage").item(0).getTextContent());
						
						report.setFilePath(bugElement.getElementsByTagName("Class").item(0).getAttributes().item(0).getTextContent());
						//System.out.println(bugElement.getElementsByTagName("SourceLine").item(j).getAttributes().getNamedItem("start"));
						if (bugElement.getElementsByTagName("SourceLine").item(j).getAttributes().getNamedItem("start")==null)
						{
							//System.out.println(bugElement.getElementsByTagName("SourceLine").item(0).getAttributes().getNamedItem("start").getTextContent());
							report.setLine(Integer.parseInt(bugElement.getElementsByTagName("SourceLine").item(0).getAttributes().getNamedItem("start").getTextContent()));
						}
						else
						{
							//System.out.println(bugElement.getElementsByTagName("SourceLine").item(j).getAttributes().getNamedItem("start").getTextContent());
							report.setLine(Integer.parseInt(bugElement.getElementsByTagName("SourceLine").item(j).getAttributes().getNamedItem("start").getTextContent()));
						}
						/*System.out.println(bugElement.getElementsByTagName("SourceLine").item(j).getAttributes().item(1));
						
						
						
						
						System.out.print("xxx ");
						System.out.print(report.filePath+" ");
						System.out.print(report.info+" ");
						System.out.print(report.line+" ");
						System.out.print(report.priority+" ");
						*/
						
						reports.add(report);
					}
				}
				
				//report.setLine(Integer.parseInt(((Element)(bugElement.getElementsByTagName("SourceLine").item(3)))
								//.getAttribute("start")));
				
				
				
			}
			
			
		}
		catch (Exception e)
		{
			
		}
	}

}
