package servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import Utils.Config;
import Utils.Project;
import Utils.SQLUtil;
import Utils.UserInfo;

public class DeleteProject extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteProject() {
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
		int Pid = Integer.parseInt(request.getParameter("PId"));
		Project project = SQLUtil.getInstance().getProject(Pid);
		if (userInfo == null || project == null
				|| (project.getUserId() != userInfo.getId())) {
			response
					.sendRedirect("showMessage.jsp?message='something goes wrong'");
		}
		File file = new File(Config.UserDir + userInfo.getId() + "/"
				+ project.getId());
		System.out.println(file.getAbsolutePath());
		if (file.exists()) {
			System.out.println("file existed delete");
			FileUtils.forceDelete(file);
			String sql="DELETE FROM project WHERE id="+Pid;
			SQLUtil.getInstance().execute(sql);
		}
		response.sendRedirect("ProjectDebug.do?Uid=" + userInfo.getId());
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
