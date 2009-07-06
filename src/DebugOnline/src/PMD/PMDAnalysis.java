package PMD;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import Util.ReportGenerator;
import Util.XMLSettings;

public class PMDAnalysis extends ReportGenerator {

	private static PMDAnalysis pmdAnalysis;
	private Process process;
	private String dirPath = "pmdBin/bin/";
	private String type;
	private String rules;
	private Util.XMLParser parser;

	private String tempFilePath = "temp.java";

	private PMDAnalysis() {
		this.parser=new Util.XMLParser(XMLSettings.PMD);
	}

	public static PMDAnalysis getInstance() {
		if (pmdAnalysis == null) {
			pmdAnalysis = new PMDAnalysis();
		}
		return pmdAnalysis;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	@Override
	public void reportFromString(String src) {
		File file = new File(tempFilePath);
		if (file.exists()) {
			file.delete();
		}
		try {
			FileWriter fw = new FileWriter(tempFilePath);
			BufferedWriter bw = new BufferedWriter(fw);
			PrintWriter pw = new PrintWriter(bw);

			pw.print(src);
			bw.close();
			fw.close();

			reportFromFile(tempFilePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportFromFile(String path) {
		try {
			System.out.println("start pmd process");

			process = Runtime.getRuntime().exec(
					dirPath + "pmd.bat " + path + " " + type + " " + rules);
			process();
			System.out.println("pmd process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportFromProject(int userId, int projectId) {
		
	}

	@Override
	public void process() {
		InputStream stdin = process.getInputStream();
		InputStreamReader isr = new InputStreamReader(stdin);
		BufferedReader reader = new BufferedReader(isr);

		String s;
		StringBuffer sb = new StringBuffer("");
		try {
			while ((s = reader.readLine()) != null) {
				if (s.length() != 0) {
					sb.append(s);
				}
			}
			result = sb.toString();
			parser.SetInput(result);
			parser.parse();
			reports=parser.getReports();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}