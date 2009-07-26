package Engine;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import FindBugs.FindBugsAnalysis;
import PMD.PMDAnalysis;
import Utils.ReportGenerator;
import Utils.SQLUtil;
import Utils.UserInfo;

public class DetectEngine extends ReportGenerator {

	private Vector<ReportGenerator> generators;

	public DetectEngine() {
		generators = new Vector<ReportGenerator>();

		PMDAnalysis pmd = new PMDAnalysis();
		FindBugsAnalysis findBugs = new FindBugsAnalysis();

		generators.add(pmd);
		generators.add(findBugs);
	}

	@Override
	public void reportFromString(String src, String sessionId, UserInfo userInfo) {
		for (int i = 0; i < generators.size(); i++) {
			generators.get(i).reportFromString(src, sessionId, userInfo);

			for (int j = 0; j < generators.get(i).reports.size(); j++) {
				reports.add(generators.get(i).reports.get(j));
			}
		}
	}

	@Override
	public void reportFromFile(String path, UserInfo userInfo) {
		for (int i = 0; i < generators.size(); i++) {
			generators.get(i).reportFromFile(path, userInfo);

			for (int j = 0; j < generators.get(i).reports.size(); j++) {
				reports.add(generators.get(i).reports.get(j));
			}
		}
		process();
	}

	@Override
	public void reportFromProject(int userId, String projectName, int Pid,
			UserInfo userInfo) {
		for (int i = 0; i < generators.size(); i++) {
			generators.get(i).reportFromProject(userId, projectName, Pid,
					userInfo);

			for (int j = 0; j < generators.get(i).reports.size(); j++) {
				reports.add(generators.get(i).reports.get(j));
			}
		}
		process();
	}

	@Override
	public void process() {
		for (int i = 0; i < reports.size(); i++) {
			String sql1 = "SELECT * FROM rulesstat WHERE name='"
					+ reports.get(i).getRule() + "' and type='"
					+ reports.get(i).type + "'";
			ResultSet rs = SQLUtil.getInstance().executeQuery(sql1);
			try {
				if (rs.next()) {
					int update = rs.getInt("count") + 1;
					rs.updateInt("count", update);
					rs.updateRow();
				} else {
					String sql2 = "INSERT INTO rulesstat(name,category,type,tool,count) VALUES('"
							+ reports.get(i).rule
							+ "','"
							+ reports.get(i).ruleSet
							+ "','"
							+ reports.get(i).type
							+ "','"
							+ reports.get(i).tool
							+ "',1" + ")";
					SQLUtil.getInstance().execute(sql2);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
	}
}
