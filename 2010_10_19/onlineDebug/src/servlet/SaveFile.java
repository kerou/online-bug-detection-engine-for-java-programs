package servlet;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.Project;
import Utils.UserInfo;

public class SaveFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SaveFile() {
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
		Project project = (Project) request.getSession()
				.getAttribute("project");
		String Fid = request.getParameter("Fid");
		String path = request.getParameter("path");
		String content = request.getParameter("content");
		response.setContentType("text/plain");
		response.setHeader("Pragma", "no-cache");
		DataOutputStream oos = new DataOutputStream(response.getOutputStream());
		if (path == null) {
			path = project.getProjectItem(Integer.parseInt(Fid)).getPath();
		}
		saveFile(path, content);
		if (content == null) {
			oos.writeUTF("the content is null");
		} else {
			oos.writeUTF("successfully saved");
		}
		oos.flush();
		oos.close();
		System.out.println("finish sending");
	}

	private void saveFile(String path, String content) {
		File file = new File(path);
		OutputStream out;
		try {
			out = new FileOutputStream(file);
			BufferedWriter rd = new BufferedWriter(new OutputStreamWriter(out,
					"utf-8"));
			rd.write(content);
			rd.close();
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
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
