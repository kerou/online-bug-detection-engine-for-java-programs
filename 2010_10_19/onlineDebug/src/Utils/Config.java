package Utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;

public class Config {
	public static String UserDir = "../userProjects/";
	public static String WinrarDir = "C:/Program Files/WinRAR";
	public static String MavenBin = "D:/apache-maven-2.2.1/bin/mvn.bat";
	public static String JAVAHOME = "C:/Program Files/Java/jdk1.6.0_10";
	public static String M2HOME = "D:/apache-maven-2.2.1";
	public static String M2OPTS = "-Xms256m -Xmx512m";
	public static HashMap<String, String> PMDRulePath;
	public static String[] PMDRules = { "Android Rules", "Basic JSF rules",
			"Basic JSP rules", "Basic Rules", "Braces Rules",
			"Clone Implementation Rules", "Code Size Rules",
			"Controversial Rules", "Coupling Rules", "Design Rules",
			"Finalizer Rules", "Import Statement Rules", "J2EE Rules",
			"JavaBean Rules", "JUnit Rules", "Jakarta Commons Logging Rules",
			"Java Logging Rules", "Migration Rules", "Migration13",
			"Migration14", "Migration15", "MigratingToJava4", "Naming Rules",
			"Optimization Rules", "Strict Exception Rules",
			"String and StringBuffer Rules", "Security Code Guidelines",
			"Type Resolution Rules" };

	public static String getPMDRulePath(String rule) {
		if (PMDRulePath == null) {
			PMDRulePath = new HashMap<String, String>();
			processRulePath();
		}
		return (String) PMDRulePath.get(rule);
	}

	private static void processRulePath() {
		try {
			Scanner input = new Scanner(new File("rulesets.data"));
			String rule = "";
			String rulePath = "";
			int index = 0;
			while (input.hasNextLine()) {
				String line = input.nextLine();
				index = line.lastIndexOf(':');
				rule = line.substring(0, index);
				rulePath = line.substring(index + 1, line.length());
				PMDRulePath.put(rule, rulePath);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		System.out.println(Config.getPMDRulePath("JUnit Rules"));
	}
}
