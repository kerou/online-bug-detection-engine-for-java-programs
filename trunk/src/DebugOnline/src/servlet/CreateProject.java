package servlet;

import java.io.File;
import java.io.IOException;
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
			request.getSession().setAttribute("message", "please login first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}

		String PName = request.getParameter("name");
		String desc = request.getParameter("desc");
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		Timestamp time = new Timestamp(date.getTime());
		System.out.println(time.toString());

		SQLUtil sql = SQLUtil.getInstance();

		Project project = new Project();
		project.setUserId(userInfo.getId());
		project.setName(PName);
		project.setCreateAt(time.toString());
		project.setTimestamp(time);
		project.setDate(date);

		sql.createProject(project);

		File file = new File(Config.UserDir + userInfo.getId() + "/"
				+ project.getId());

		if (!file.exists()) {
			file.mkdirs();
		}

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
