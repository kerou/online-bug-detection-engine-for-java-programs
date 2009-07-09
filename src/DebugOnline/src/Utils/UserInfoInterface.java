package Utils;

public interface UserInfoInterface {
	public void setUsername(String username);
	public void setPassword(String password);
	public int getId();
	public String getUsername();
	public String getSchool();
	public String getSex();
	public boolean login();
	public boolean logout();
	public void clear();
	public boolean isLogin();
}
