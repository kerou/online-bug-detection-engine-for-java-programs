package servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Date;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.Config;
import Utils.Project;
import Utils.SQLUtil;
import Utils.UserInfo;

public class CreateProject extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateProject() {
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
		UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
				"userInfo");
		if (userInfo == null) {
			response.sendRedirect("shoeMessage.jsp?message='please login first'");
		}

		String PName = request.getParameter("name");
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		Timestamp time = new Timestamp(date.getTime());

		SQLUtil sql = SQLUtil.getInstance();

		Project project = new Project();
		project.setUserId(userInfo.getId());
		project.setName(PName);
		project.setCreateAt(time.toString());
		project.setTimestamp(time);
		project.setDate(date);

		sql.createProject(project);

		File file = new File(Config.UserDir + userInfo.getId() + "/"
				+ project.getId() + "/src/main/java/" + project.getName());
		File poem = new File(Config.UserDir + userInfo.getId() + "/"
				+ project.getId() + "/pom.xml");

		if (!file.exists()) {
			file.mkdirs();
		}

		if (!poem.exists()) {
			poem.createNewFile();
		}

		String src = "<project xmlns=\"http://maven.apache.org/POM/4.0.0\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n"
				+ "xsi:schemaLocation=\"http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd\">\n"
				+ "<modelVersion>4.0.0</modelVersion>\n"
				+ "<groupId>"
				+ project.getName()
				+ "</groupId>\n"
				+ "<artifactId>"
				+ project.getId()
				+ "</artifactId>\n"
				+ "<packaging>jar</packaging>\n"
				+ "<version>1.0-SNAPSHOT</version>\n"
				+ "<name>"
				+ project.getId()
				+ "</name>\n"
				+ "<url>http://maven.apache.org</url>\n"
				+ "<dependencies>\n"
				+ "<dependency>\n"
				+ "<groupId>junit</groupId>\n"
				+ "<artifactId>junit</artifactId>\n"
				+ "<version>3.8.1</version>\n"
				+ "<scope>test</scope>\n"
				+ "</dependency>\n"
				+ "</dependencies>\n"
				+ "</project>";

		OutputStream out = new FileOutputStream(poem);
		BufferedWriter rd = new BufferedWriter(new OutputStreamWriter(out,
				"utf-8"));
		rd.write(src);
		rd.close();
		out.close();

		request.getSession().setAttribute("project", project);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/projectDetail.jsp");
		dispatcher.forward(request, response);
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
