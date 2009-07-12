/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
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
		setAuth("root","","onlinedebug");
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
		System.out.println();
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
		execute(sql);
	}

	public static void main(String[] args) {
		try {
			SQLUtil util = SQLUtil.getInstance();
			util.setAuth("root", "", "onlinedebug");
			ResultSet set = util.executeQuery("select * from user");
			System.out.println("set row:" + set.getRow());
			while (set.next()) {
				System.out.println(set.getString(2));
			}
		} catch (SQLException ex) {
			Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null,
					ex);
		}
	}
}
