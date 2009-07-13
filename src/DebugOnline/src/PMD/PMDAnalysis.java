package PMD;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Random;

import Utils.*;

public class PMDAnalysis extends ReportGenerator {

	private Process process;
	private String dirPath = "pmdBin/bin/";
	private String type;
	private String rules;
	private XMLParser parser;

	public PMDAnalysis() {
		this.parser = new XMLParser(XMLSettings.PMD);
		setType("xml");
		setRules("rulesets/naming.xml");
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	@Override
	public void reportFromString(String src, String sessionId) {
		String fileName = getFileName(src);
		String tempFilePath = "tempFiles\\" + sessionId + "\\" + fileName
				+ ".java";
		File dir = new File("tempFiles\\" + sessionId);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		File file = new File(tempFilePath);
		if (file.exists()) {
			file.delete();
		}
		try {
			OutputStream out = new FileOutputStream(file);
			BufferedWriter rd = new BufferedWriter(new OutputStreamWriter(out,
					"utf-8"));
			rd.write(src);
			rd.close();
			out.close();

			reportFromFile(tempFilePath);
			file.delete();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String getFileName(String src) {
		int index1 = src.indexOf("class");
		int index2 = src.indexOf("{");
		String className = src.substring(index1 + 6, index2);
		return className;
	}

	@Override
	public void reportFromFile(String path) {
		try {
			System.out.println("start pmd process");

			String command = dirPath + "pmd.bat " + path + " " + type + " "
					+ rules;

			process = Runtime.getRuntime().exec(command);
			System.out.println("execute " + command);
			process();
			System.out.println("pmd process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportFromProject(int userId, String projectName) {
		System.out.println("start pmd project process");

		String command = dirPath + "pmd.bat " + "../userProjects/" + userId
				+ "/" + projectName + " " + type + " " + rules;

		try {
			process = Runtime.getRuntime().exec(command);
			System.out.println("execute " + command);
			process();
			System.out.println("pmd project process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
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
				} else {
					System.out.println("length==0");
				}
			}
			result = sb.toString();
			parser.SetInput(result);
			parser.parse();
			reports = parser.getReports();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		PMDAnalysis pmd = new PMDAnalysis();
		System.out.println("&&&&" + pmd.getFileName("public class asdasdasd{}")
				+ "%%%%");
	}
}
