package PMD;

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

public class PMDXML implements XMLParserInterface {

	public String input;
	public Vector<Report> reports;

	public PMDXML() {
		reports = new Vector<Report>();
	}

	public void SetInput(String input) {
		this.input = input;
	}

	public void clear() {
		input = "";
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
		try {
			builder = factory.newDocumentBuilder();
			StringReader sr = new StringReader(input);
			InputSource is = new InputSource(sr);
			Document doc = builder.parse(is);
			doc.normalize();

			Element root = doc.getDocumentElement();
			NodeList files = root.getElementsByTagName("file");
			for (int i = 0; i < files.getLength(); i++) {
				Element file = (Element) files.item(i);
				NodeList violations = file.getElementsByTagName("violation");
				for (int j = 0; j < violations.getLength(); j++) {
					Element violation = (Element) violations.item(j);
					Report report = new Report();

					report.setFilePath(file.getAttribute("name"));
					report.setInfo(violation.getFirstChild().getNodeValue());
					report.setLine(Integer.parseInt(violation
							.getAttribute("beginline")));
					report.setPriority(Integer.parseInt(violation
							.getAttribute("priority")));
					report.setRule(violation.getAttribute("rule"));
					report.setRuleSet(violation.getAttribute("ruleset"));

					reports.add(report);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String toString() {
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < reports.size(); i++) {
			sb.append("#" + i + ":\n");
			sb.append(reports.get(i).toString() + "\n");
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		PMDXML xml = new PMDXML();
		xml
				.SetInput("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
						+ "<pmd version=\"4.2.5\" timestamp=\"2009-07-08T14:27:04.406\">"
						+ "<file name=\"C:\\Documents and Settings\\StevenHsui\\aaa\\pmdBin\\bin\\test.java\">"
						+ "<violation beginline=\"1\" endline=\"5\" begincolumn=\"8\" endcolumn=\"1\" rule=\"NoPackage\" "
						+ "ruleset=\"Naming Rules\" externalInfoUrl=\"http://pmd.sourceforge.net/rules/naming.html#NoPackage\" "
						+ "priority=\"3\">"
						+ "All classes and interfaces must belong to a named package"
						+ "</violation>"
						+ "<violation beginline=\"1\" endline=\"5\" begincolumn=\"8\" endcolumn=\"1\" rule=\"ClassNamingConventions\" "
						+ "ruleset=\"Naming Rules\" externalInfoUrl=\"http://pmd.sourceforge.net/rules/naming.html#ClassNamingConventions\""
						+ " priority=\"1\">"
						+ "Class names should begin with an uppercase character"
						+ "</violation>" + "</file>" + "</pmd>");
		xml.parse();

		for (int i = 0; i < xml.reports.size(); i++) {
			Report report = xml.reports.get(i);
			System.out.println(report.getFilePath());
			System.out.println(report.getLine());
			System.out.println(report.getPriority());
			System.out.println(report.getInfo());
			System.out.println();
		}
	}
}
