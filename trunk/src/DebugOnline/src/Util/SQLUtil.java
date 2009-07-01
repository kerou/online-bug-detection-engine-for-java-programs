/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

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
    static SQLUtil sqlutil;

    private SQLUtil() {
    }

    public static SQLUtil getInstance() {
        if (sqlutil == null) {
            sqlutil = new SQLUtil();
        }
        return sqlutil;
    }

    public boolean setAuth(String username, String password, String dbName) {
        try {
            Class.forName(driver);
            this.username = username;
            this.password = password;
            this.dbName=dbName;
            connection = DriverManager.getConnection(url + ";DatabaseName=" + dbName, username, password);
            statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ResultSet executeQuery(String sql) {
        ResultSet set = null;
        try {
            set = statement.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return set;
    }

    public void execute(String sql) {
        try {
            statement.execute(sql);
        } catch (SQLException ex) {
            Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args){
        try {
            SQLUtil util = SQLUtil.getInstance();
            util.setAuth("steven1208", "871208", "StudentManagement");
            ResultSet set = util.executeQuery("select * from ElectCourse where courseId='ME002' and studentId='209217'");
            System.out.println("set row:"+set.getRow());
            while (set.next()) {
                System.out.println(set.getString(2));
            }
        } catch (SQLException ex) {
            Logger.getLogger(SQLUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
