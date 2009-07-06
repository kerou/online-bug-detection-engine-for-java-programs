package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import PMD.PMDAnalysis;

public class CreateReport extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CreateReport() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String inputType=request.getParameter("inputType");
		
		if(checkLogin()){
			if(inputType.equals("Single")){
				reportFromSingleFile(request,response);
			}else{
				if(inputType.equals("Project")){
					reportFromProject(request,response);
				}
			}
		}else{
			if(inputType.equals("Single")){
				reportFromSingleFile(request,response);
			}else{
				if(inputType.equals("Project")){
					errorResponse("未登录用户无法使用项目侦错");
				}
			}
		}
	}
	
	private void errorResponse(String string) {
		
	}

	private void reportFromProject(HttpServletRequest request,
			HttpServletResponse response) {
		PMDAnalysis pmd=PMDAnalysis.getInstance();
	}

	private void reportFromSingleFile(HttpServletRequest request,
			HttpServletResponse response) {
		PMDAnalysis pmd=PMDAnalysis.getInstance();
		
		String codeContent=request.getParameter("content");
		String type=request.getParameter("type");
		String rules=request.getParameter("rules");
		
		String result=pmd.reportFromString(codeContent, type, rules);
	}

	private boolean checkLogin(){
		return false;
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
