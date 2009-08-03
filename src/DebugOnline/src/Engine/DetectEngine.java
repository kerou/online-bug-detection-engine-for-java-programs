package Engine;

import java.sql.PreparedStatement;
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
		process(userInfo, -1);
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
		process(userInfo, Pid);
	}

	@Override
	public void process(UserInfo userInfo, int Pid) {
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		for (int i = 0; i < reports.size(); i++) {
			String sql = "INSERT INTO rulesstat(name,category,type,tool,userId,proId,create_at) VALUES(?,?,?,?,?,?,?)";
			PreparedStatement pstmt;
			try {
				pstmt = SQLUtil.getInstance().connection.prepareStatement(sql,
						PreparedStatement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, reports.get(i).getRule());
				pstmt.setString(2, reports.get(i).getRuleSet());
				pstmt.setString(3, reports.get(i).getType());
				pstmt.setString(4, reports.get(i).getTool());
				pstmt.setInt(5, reports.get(i).getUserId());
				pstmt.setInt(6, reports.get(i).getProId());
				pstmt.setDate(7, date);
				pstmt.execute();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
