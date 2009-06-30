package Util;
import java.sql.ResultSet;

public interface DBConnectInterface {
	public void setUserName(String username);
	public void setPassword(String password);
	public void setURL(String url);
	public void setDBName(String dbName);
	public void connect();
	public ResultSet executeQuery(String sql);
	public void execute(String sql);
}
