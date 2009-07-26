package Utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class BuildTable {
	public static void main(String[] args) {
		processPMD("PMDData.data");
		processFB("FBData.data");
	}

	private static void processFB(String string) {
		String line = "";
		int index = 0;
		String rule = "";
		String ruleSet = "";
		try {
			Scanner input = new Scanner(new File(string));
			while (input.hasNextLine()) {
				line = input.nextLine();
				index = line.lastIndexOf(':');
				rule = line.substring(0, index);
				ruleSet = line.substring(index + 1, line.length());
				String sql = "INSERT INTO FBRules(name,category) VALUES('"
						+ rule + "','" + ruleSet + "')";
				System.out.println(sql);
				SQLUtil.getInstance().execute(sql);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	private static void processPMD(String string) {
		String line = "";
		int index = 0;
		String rule = "";
		String ruleSet = "";
		try {
			Scanner input = new Scanner(new File(string));
			while (input.hasNextLine()) {
				line = input.nextLine();
				index = line.indexOf(':');
				rule = line.substring(0, index);
				ruleSet = line.substring(index + 1, line.length());
				String sql = "INSERT INTO PMDRules(name,ruleSet,rulePath) VALUES('"
						+ rule
						+ "','"
						+ ruleSet
						+ "','"
						+ Config.getPMDRulePath(ruleSet) + "')";
				if (Config.getPMDRulePath(ruleSet) == null) {
					System.out.println("@@@@@@@@@@@@:"+ruleSet);
				}
				System.out.println(sql);
				SQLUtil.getInstance().execute(sql);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

	}
}
