package servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.Project;
import Utils.UserInfo;

public class FileDetail extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public FileDetail() {
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
		Project project = (Project) request.getSession()
				.getAttribute("project");
		int Fid = Integer.parseInt(request.getParameter("Fid"));
		int line = Integer.parseInt(request.getParameter("line"));

		if (userInfo == null) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please login first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}

		if (project == null) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please select a project first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}

		if (Fid == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please select a file first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}

		String path = project.getProjectItem(Fid).getPath();
		BufferedReader reader = null;
		StringBuffer buffer = new StringBuffer("");
		reader = new BufferedReader(new FileReader(path));
		String lineContent;
		while ((lineContent = reader.readLine()) != null) {
			buffer.append(lineContent + "\n");
		}
		if (reader != null) {
			reader.close();
		}

		request.setAttribute("line", line);
		request.setAttribute("content", buffer.toString());
		request.setAttribute("Fid", Fid);
		request.setAttribute("Uid", userInfo.getId());

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/fileDetail.jsp");
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
