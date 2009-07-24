package FindBugs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import Utils.JavaUtil;
import Utils.ReportGenerator;
import Utils.UserInfo;
import Utils.XMLParser;
import Utils.XMLSettings;

public class FindBugsAnalysis extends ReportGenerator {

	private Process process;
	private String dirPath = "findbugsBin\\bin\\";
	private String type;
	private String rules;
	private XMLParser parser;
	private String tempFilePath = "findbugsBin\\bin\\temp.java";
	private String tempClassFilePath = "findbugsBin\\bin\\Debug.class";

	public FindBugsAnalysis() {
		this.name = "FindBugs";
		this.parser = new XMLParser(XMLSettings.FindBugs);
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setRules(String rules) {
		this.rules = rules;
	}

	@Override
	public void reportFromString(String src, String sessionId, UserInfo userInfo) {
		// System.out.print("xxx");
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
			JavaUtil util;
			util = JavaUtil.getInstance();
			util.compile(tempFilePath);
			reportFromFile(tempClassFilePath, userInfo);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportFromFile(String path, UserInfo userInfo) {
		try {
			System.out.print("abc");
			System.out.println("start findbugs process");
			if (userInfo != null) {
				if (!userInfo.isFB) {
					return;
				}
			}

			process = Runtime.getRuntime().exec(
					dirPath + "findbugs.bat -textui -xml:withMessages " + path
							+ "");
			process();
			System.out.println("findbugs process finished");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void reportFromProject(int userId, String projectName, int Pid,
			UserInfo userInfo) {
		if (userInfo != null) {
			if (!userInfo.isFB) {
				return;
			}
		}
		System.out.println("start findbugs project process");
		String command = dirPath + "findbugs.bat -textui -xml:withMessages "
				+ "..\\userProjects\\" + userId + "\\" + Pid
				+ "\\target\\classes";

		try {
			process = Runtime.getRuntime().exec(command);
			System.out.println("execute " + command);
			process();
			System.out.println("findbugs project process finished");
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
}