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
	private String dirPath = "pmdBin\\bin\\";
	private String type;
	private String rules;
	private XMLParser parser;
	private String parseType;

	public PMDAnalysis() {
		this.name = "PMD";
		this.parser = new XMLParser(XMLSettings.PMD);
		setType("xml");
		setRules("rulesets/naming.xml rulesets/basic.xml");
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	@Override
	public void reportFromString(String src, String sessionId, UserInfo userInfo) {
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

			reportFromFile(tempFilePath, userInfo);
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
	public void reportFromFile(String path, UserInfo userInfo) {
		try {
			System.out.println("start pmd process");
			if (userInfo != null) {
				if (!userInfo.isPMD) {
					System.out.println("pmd return");
					return;
				}
				processRules(userInfo);
			}

			String command = dirPath + "pmd.bat " + path + " " + type + " "
					+ rules;

			System.out.println("execute: " + command);
			process = Runtime.getRuntime().exec(command);
			parseType = "single";
			process(userInfo, -1);
			System.out.println("pmd process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void processRules(UserInfo userInfo) {
		StringBuffer sb = new StringBuffer("");
		for (int i = 0; i < userInfo.PMDRuleSets.size(); i++) {
			if (i == userInfo.PMDRuleSets.size() - 1) {
				sb.append("rulesets/"
						+ Config.getPMDRulePath(userInfo.PMDRuleSets.get(i)));
			} else {
				sb.append("rulesets/"
						+ Config.getPMDRulePath(userInfo.PMDRuleSets.get(i))
						+ ",");
			}
		}
		this.setRules(sb.toString());
	}

	@Override
	public void reportFromProject(String project,UserInfo userInfo) {
		System.out.println("start pmd project process");
		if (userInfo != null) {
			processRules(userInfo);
			if (!userInfo.isPMD) {
				return;
			}
		}
		String sid = project.substring(0,project.indexOf('_'));
		String pName = project.substring(project.indexOf('_')+1);
		
		String command = dirPath + "pmd.bat " + "../userProjects/" + sid
						+ "/ " + type + " " + rules;

		try {
			System.out.println("command: " +command);
			process = Runtime.getRuntime().exec(command);
			parseType = "project";
			process(userInfo, -1);
			System.out.println("pmd project process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void process(UserInfo userInfo, int Pid) {
		InputStream stdin = process.getInputStream();
		InputStreamReader isr = new InputStreamReader(stdin);
		BufferedReader reader = new BufferedReader(isr);

		String s;
		StringBuffer sb = new StringBuffer("");
		try {
			while ((s = reader.readLine()) != null) {
				if (s.length() != 0) {
					sb.append(s + "\n");
				} else {
					System.out.println("length==0");
				}
			}
			try {
				process.waitFor();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			result = sb.toString();
			System.out.println(result);
			parser.SetInput(result);
			parser.SetParseType(parseType);
			parser.parse(userInfo, Pid);
			reports = parser.getReports();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		PMDAnalysis pmd = new PMDAnalysis();
		pmd.setRules("rulesets/android.xml," + "rulesets/basic-jsf.xml,"
				+ "rulesets/basic-jsp.xml," + "rulesets/basic.xml,"
				+ "rulesets/braces.xml," + "rulesets/clone.xml,"
				+ "rulesets/codesize.xml," + "rulesets/controversial.xml,"
				+ "rulesets/coupling.xml," + "rulesets/design.xml,"
				+ "rulesets/finalizers.xml," + "rulesets/imports.xml,"
				+ "rulesets/j2ee.xml," + "rulesets/javabeans.xml,"
				+ "rulesets/junit.xml,"
				+ "rulesets/logging-jakarta-commons.xml,"
				+ "rulesets/logging-java.xml," + "rulesets/migrating.xml,"
				+ "rulesets/migrating_to_13.xml,"
				+ "rulesets/migrating_to_14.xml,"
				+ "rulesets/migrating_to_15.xml,"
				+ "rulesets/migrating_to_junit4.xml," + "rulesets/naming.xml,"
				+ "rulesets/optimizations.xml," + "rulesets/scratchpad.xml,"
				+ "rulesets/strings.xml," + "rulesets/sunsecure.xml");
		pmd.reportFromFile("upload", null);
	}
}
