package Utils;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Vector;

public class Project {
	public int id;
	public int userId;
	public String name;
	public String createAt;
	public Timestamp timestamp;
	public Date date;

	private Vector<ProjectItem> projectItems;

	public Project() {
		this.projectItems = new Vector<ProjectItem>();
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setUserId(int uid) {
		this.userId = uid;
	}

	public int getUserId() {
		return userId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setCreateAt(String createAt) {
		this.createAt = createAt;
	}

	public String getCreateaAt() {
		return createAt;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate() {
		return date;
	}

	public void addProjectItem(ProjectItem item) {
		projectItems.add(item);
	}

	public int getItemSize() {
		return projectItems.size();
	}

	public ProjectItem getProjectItem(int index) {
		return projectItems.get(index);
	}

	public void processFileSystem() {
		File root = new File("../userProjects/" + this.getUserId() + "/"
				+ this.getId()+"/src/main/java");
		if(!root.exists()){
			root.mkdirs();
		}
		ProjectItem rootItem = new ProjectItem();
		rootItem.setId(0);
		rootItem.setIsDir(true);
		rootItem.setParent(-1);
		rootItem.setPath("../userProjects/" + this.getUserId() + "/"
				+ this.getId()+"/src/main/java");
		rootItem.setName(root.getName());
		rootItem.setFileType("dir");

		projectItems.add(rootItem);

		File[] files = root.listFiles();
		if (files != null && files.length != 0) {
			try {
				processFileTree(0, files);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void processFileTree(int parent, File[] files) throws IOException {
		for (int i = 0; i < files.length; i++) {
			ProjectItem rootItem = new ProjectItem();
			rootItem.setId(projectItems.size());
			rootItem.setIsDir(files[i].isDirectory());
			rootItem.setParent(parent);
			rootItem.setName(files[i].getName());
			rootItem.setPath(files[i].getPath());
			if (files[i].isDirectory()) {
				rootItem.setFileType("dir");
			} else {
				String ffName = files[i].getName();
				String ext = ffName.substring(ffName.lastIndexOf(".")+1, ffName.length());
				rootItem.setFileType(ext);
			}
			projectItems.add(rootItem);
			File[] files2 = files[i].listFiles();
			if (files2!=null&&files2.length != 0) {
				processFileTree(rootItem.getId(), files2);
			}
		}
	}
	public static void main(String[] args){
		Project project=new Project();
		project.setId(34);
		project.setUserId(1);
		project.processFileSystem();
		System.out.println("size:"+project.getItemSize());
		for(int i=0;i<project.getItemSize();i++){
			System.out.println(project.getProjectItem(i));
		}
	}
}
