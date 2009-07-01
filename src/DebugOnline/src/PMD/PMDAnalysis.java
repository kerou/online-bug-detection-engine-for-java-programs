package PMD;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

public class PMDAnalysis {

	private static PMDAnalysis pmdAnalysis;
	private String result;
	private Process process;
	private String dirPath = "pmdBin/bin/";

	private String tempFilePath = "temp.java";

	private PMDAnalysis() {

	}

	public static PMDAnalysis getInstance() {
		if (pmdAnalysis == null) {
			pmdAnalysis = new PMDAnalysis();
		}
		return pmdAnalysis;
	}

	public String reportFromString(String src, String type, String rules) {
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

			reportFromFile(tempFilePath, type, rules);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public String reportFromFile(String path, String type, String rules) {
		try {
			System.out.println("start pmd process");

			process = Runtime.getRuntime().exec(
					dirPath + "pmd.bat " + path + " " + type + " " + rules);
			processResult();

			System.out.println("pmd process finished");
			return result;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	private void processResult() {
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
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String getResult() {
		return result;
	}

	public static void main(String[] args) {
		PMDAnalysis test = PMDAnalysis.getInstance();
		String temp = "public class Test{"
				+ "public static void main(String[] args){"
				+ "System.out.println(\"ggggg\");" + "}" + "}";
		test.reportFromString(temp, "xml", PMDRules.Naming);
		System.out.println(test.getResult());
	}
}