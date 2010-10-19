package Utils;

public class ProjectItem {
	public int id;
	public int parent;
	public boolean isDir;
	public String path;
	public String name;
	public String fileType;

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getParent() {
		return this.parent;
	}

	public void setIsDir(boolean isDir) {
		this.isDir = isDir;
	}

	public boolean getIsDir() {
		return this.isDir;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath() {
		return this.path;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return this.name;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFileType() {
		return this.fileType;
	}

	public String toString() {
		String result = "id:" + id + "\nparnet:" + parent + "\nisDir:" + isDir
				+ "\npath:" + path + "\nname:" + name + "\nfileType:" + fileType+"\n";
		return result;
	}
}
