package Utils;


import Utils.UserInfoInterface;

public class UserInfo implements UserInfoInterface {
	
	private static UserInfo userInfo;
	private String id="";
	private String school="";
	private String sex="";
	private String userName="";
	private String passWord="";
	private String email="";
	
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
		userInfo.clear();
		

	}

	public String getId() {
		// TODO Auto-generated method stub
		return this.id;
	}

	public String getSchool() {
		// TODO Auto-generated method stub
		return this.school;
	}

	public String getSex() {
		// TODO Auto-generated method stub
		return this.sex;
	}

	public String getUsername() {
		// TODO Auto-generated method stub
		return this.userName;
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
		this.passWord=password;
		

	}

	public void setUsername(String username) {
		// TODO Auto-generated method stub
		this.userName=username;

	}
	public String getEmail(){
		
		return this.email;
	}
	public void setEmail(String email){
		this.email=email;
		
		
	}

}
