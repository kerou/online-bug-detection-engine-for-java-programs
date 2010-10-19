package Utils;

import java.util.Vector;

import Utils.UserInfoInterface;

public class UserInfo implements UserInfoInterface {

	private int id;
	private String school;
	private String sex;
	private String userName;
	private String passWord;
	private String email;
	public Vector<String> PMDRuleSets;
	public String FBStrength;
	public boolean isPMD;
	public boolean isFB;
	public Vector<String> tools;

	public UserInfo() {
		clear();
		PMDRuleSets=new Vector<String>();
		tools=new Vector<String>();
	}

	public void clear() {
		// TODO Auto-generated method stub
		id = 0;
		school = "";
		sex = "";
		userName = "";
		passWord = "";
		email = "";
	}

	public int getId() {
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
	
	public int getSexInteger() {
		// TODO Auto-generated method stub
		int sex=-1;
		if(this.sex.equals("Male")){
			sex=0;
		}else{
			if(this.sex.equals("Female")){
				sex=1;
			}
		}
		return sex;
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
		this.passWord = password;
	}

	public void setUsername(String username) {
		// TODO Auto-generated method stub
		this.userName = username;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setId(int id) {
		// TODO Auto-generated method stub
		this.id = id;
	}

	public void setSchool(String school) {
		// TODO Auto-generated method stub
		this.school = school;
	}

	public void setSex(int id) {
		// TODO Auto-generated method stub
		if (id == 0) {
			this.sex = "Male";
		} else {
			if (id == 1) {
				this.sex = "Female";
			}
		}
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return passWord;
	}

}
