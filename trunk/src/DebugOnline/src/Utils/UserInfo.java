package Utils;

public class UserInfo implements UserInfoInterface {
	
	private static UserInfo userInfo;
	
	private UserInfo(){
		
	}
	
	public static UserInfo getInstance(){
		if(userInfo==null){
			userInfo=new UserInfo();
		}
		return userInfo;
	}

	public void clear() {
		// TODO Auto-generated method stub

	}

	public int getId() {
		// TODO Auto-generated method stub
		return 0;
	}

	public String getSchool() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSex() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean isLogin() {
		// TODO Auto-generated method stub
		return true;
	}

	public boolean login() {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean logout() {
		// TODO Auto-generated method stub
		return false;
	}

	public void setPassword(String password) {
		// TODO Auto-generated method stub

	}

	public void setUsername(String username) {
		// TODO Auto-generated method stub

	}

}
