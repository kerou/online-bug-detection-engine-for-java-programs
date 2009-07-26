package servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import Utils.Config;
import Utils.Debug;
import Utils.JavaUtil;
import Utils.Project;
import Utils.UserInfo;

import Engine.DetectEngine;

public class UploadProject extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UploadProject() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processProjectFile(request, response);
	}

	private void processProjectFile(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		Project project = (Project) request.getSession()
				.getAttribute("project");

		if (userInfo == null) {
			request.getSession().setAttribute("message", "please login first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}
		if (project == null) {
			request.getSession().setAttribute("message",
					"please choose a project first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}
		if (ServletFileUpload.isMultipartContent(request)) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List items = upload.parseRequest(request);
				String fileName = ((FileItem) (items.get(0))).getFieldName();
				String tempFilePath = "../userProjects/" + userInfo.getId()
						+ "/" + project.getId() + "/src/main/java/"
						+ project.getName() + "/" + fileName + ".rar";
				File dir = new File("../userProjects/" + userInfo.getId() + "/"
						+ project.getId() + "/src/main/java/"
						+ project.getName());
				if (!dir.exists()) {
					dir.mkdirs();
				} else {
					dir.delete();
					dir.mkdirs();
				}
				File file = new File(tempFilePath);
				if (file.exists()) {
					file.delete();
				}
				try {
					((FileItem) (items.get(0))).write(file);
				} catch (Exception e) {
					e.printStackTrace();
				}
				// 解压缩，删除压缩文件。
				String command = "\"" + Config.WinrarDir + "/WinRAR.exe\" x "
						+ "\"" + file.getAbsolutePath() + "\"";
				Process process2 = Runtime.getRuntime()
						.exec(command, null, dir);
				try {
					process2.waitFor();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				file.delete();
				File mavenDir = new File("../userProjects/" + userInfo.getId()
						+ "/" + project.getId());
				JavaUtil.getInstance().compileProject(
						mavenDir.getAbsolutePath());
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("/ProjectDetail.do?PId="
								+ project.getId());
				dispatcher.forward(request, response);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
		}
	}

	private String getClassFileName(String string) {
		try {
			Scanner input = new Scanner(new File(string));
			while (input.hasNextLine()) {
				String line = input.nextLine();
				if (line.startsWith("public class ")) {
					String className = "";
					className = line.substring(13, line.indexOf("{"));
					return className;
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
