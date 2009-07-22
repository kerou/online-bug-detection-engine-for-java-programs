/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * 
 * @author StevenHsui
 */
public class SQLUtil {

	String username = "";
	String password = "";
	String dbName = "";
	String url = "jdbc:mysql://localhost:3306";
	String driver = "com.mysql.jdbc.Driver";

	Connection connection;
	Statement statement;

	private SQLUtil() {
		setAuth("root", "", "onlinedebug");
	}

	public static SQLUtil getInstance() {
		return new SQLUtil();
	}

	public boolean setAuth(String username, String password, String dbName) {
		try {
			Class.forName(driver);
			this.username = username;
			this.password = password;
			this.dbName = dbName;
			connection = DriverManager.getConnection(url + "/" + dbName,
					username, password);
			statement = connection.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null,
					ex);
			return false;
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null,
					ex);
			return false;
		}
	}

	public ResultSet executeQuery(String sql) {
		ResultSet set = null;
		try {
			set = statement.executeQuery(sql);
		} catch (SQLException ex) {
			Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null,
					ex);
		}
		return set;
	}

	public void execute(String sql) {
		try {
			statement.execute(sql);

		} catch (SQLException ex) {
			Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null,
					ex);
		}
	}

	public boolean chechLogin(String username, String password) {
		ResultSet set = executeQuery("select * from user");
		try {
			while (set.next()) {
				if (set.getString(2).equals(username)) {
					if (set.getString(3).equals(password)) {
						return true;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public UserInfo getUserInfo(String username, String password) {
		ResultSet set = executeQuery("select * from user");
		UserInfo userInfo = new UserInfo();
		try {
			while (set.next()) {
				if (set.getString(2).equals(username)) {
					if (set.getString(3).equals(password)) {
						userInfo.setId(set.getInt(1));
						userInfo.setUsername(username);
						userInfo.setPassword(password);
						userInfo.setSchool(set.getString(4));
						userInfo.setSex(set.getInt(5));
						userInfo.setEmail(set.getString(6));
						return userInfo;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void createUser(UserInfo userInfo) {
		String sql = "insert into USER(username,password,school,sex,email) values("
				+ "'"
				+ userInfo.getUsername()
				+ "',"
				+ "'"
				+ userInfo.getPassword()
				+ "',"
				+ "'"
				+ userInfo.getSchool()
				+ "',"
				+ userInfo.getSexInteger()
				+ ",'"
				+ userInfo.getEmail()
				+ "')";
		try {
			statement.execute(sql, Statement.RETURN_GENERATED_KEYS);
			ResultSet set = statement.getGeneratedKeys();
			if (set.next()) {
				userInfo.setId(set.getInt(1));
			}
			String sql2 = "insert into UserConfig(userId,PMDConfig,FBConfig) values("
				+userInfo.getId()
				+ ","
				+ "'"
				+ 0000000000000
				+ "',"
				+ "'"
				+ 11
				+ ")";
		statement.execute(sql2);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void createProject(Project project) {
		String sql = "insert into PROJECT(userId,name,create_at) values(?,?,?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql,
					PreparedStatement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, project.getUserId());
			pstmt.setString(2, project.getName());
			pstmt.setDate(3, project.getDate());

			pstmt.executeUpdate();
			ResultSet set = pstmt.getGeneratedKeys();
			if (set.next()) {
				project.setId(set.getInt(1));
			}
			project.processFileSystem();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Project getProject(int PId) {
		ResultSet set = executeQuery("select * from Project WHERE id=" + PId);
		try {
			while (set.next()) {
				Project project = new Project();
				project.setId(set.getInt(1));
				project.setUserId(set.getInt(2));
				project.setName(set.getString(3));
				project.setCreateAt(set.getTimestamp(4).toString());
				project.setTimestamp(set.getTimestamp(4));
				project.setDate(set.getDate(4));

				project.processFileSystem();
				return project;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public Vector<Project> getProjectByUid(int uid) {
		ResultSet set = executeQuery("select * from Project WHERE UserId="
				+ uid);
		Vector<Project> projects = new Vector<Project>();
		try {
			while (set.next()) {
				Project project = new Project();
				project.setId(set.getInt(1));
				project.setUserId(set.getInt(2));
				project.setName(set.getString(3));
				project.setCreateAt(set.getTimestamp(4).toString());
				project.setTimestamp(set.getTimestamp(4));
				project.setDate(set.getDate(4));

				project.processFileSystem();
				projects.add(project);
			}
			return projects;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		SQLUtil sql = SQLUtil.getInstance();

		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		Timestamp time = new Timestamp(date.getTime());
		System.out.println(time.toString());

		Project project = new Project();
		project.setUserId(1);
		project.setName("ddddd");
		project.setCreateAt(time.toString());
		project.setTimestamp(time);
		project.setDate(date);

		sql.createProject(project);
	}
}
