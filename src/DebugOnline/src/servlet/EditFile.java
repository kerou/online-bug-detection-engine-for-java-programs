package servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.Project;

public class EditFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditFile() {
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
		String line = request.getParameter("line");
		String content = request.getParameter("content");
		int Fid = Integer.parseInt(request.getParameter("Fid"));
		int Uid = Integer.parseInt(request.getParameter("Uid"));

		Project project = (Project) request.getSession()
				.getAttribute("project");

		if (project == null) {
			request.setAttribute("message", "please choose a project first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		} else {
			File file = new File(project.getProjectItem(Fid).getPath());
			if (file.exists()) {
				file.delete();
			}
			try {
				OutputStream out = new FileOutputStream(file);
				BufferedWriter rd = new BufferedWriter(new OutputStreamWriter(
						out, "utf-8"));
				rd.write(content);
				rd.close();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/ProjectDetail.do?Pid="
							+ project.getId());
			dispatcher.forward(request, response);
		}
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
