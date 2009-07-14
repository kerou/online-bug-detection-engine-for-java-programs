package Utils;

import java.sql.Date;
import java.sql.Timestamp;

public class Project {
	public int id;
	public int userId;
	public String name;
	public String createAt;
	public Timestamp timestamp;
	public Date date;
	
	public void setId(int id){
		this.id=id;
	}
	
	public int getId(){
		return id;
	}
	
	public void setUserId(int uid){
		this.userId=uid;
	}
	
	public int getUserId(){
		return userId;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public String getName(){
		return name;
	}
	
	public void setCreateAt(String createAt){
		this.createAt=createAt;
	}
	
	public String getCreateaAt(){
		return createAt;
	}
	
	public void setTimestamp(Timestamp timestamp){
		this.timestamp=timestamp;
	}
	
	public Timestamp getTimestamp(){
		return timestamp;
	}
	
	public void setDate(Date date){
		this.date=date;
	}
	
	public Date getDate(){
		return date;
	}
}
