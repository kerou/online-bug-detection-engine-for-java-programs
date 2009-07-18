package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.SQLUtil;
import Utils.UserInfo;

public class EditUserData extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public EditUserData() {
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
		UserInfo userInfo=(UserInfo)request.getSession().getAttribute("userInfo");
		if(userInfo==null){
			request.getSession().setAttribute("message", "please login first");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/showMessage.jsp");
		    dispatcher.forward(request, response);
		}else{
			String password=request.getParameter("npassword");
			String email=request.getParameter("email");
			
			if(email!=null){
				SQLUtil.getInstance().execute("UPDATE USER SET EMAIL='"+email+"' "+"WHERE ID="+userInfo.getId());
			}
			if(password!=null){
				SQLUtil.getInstance().execute("UPDATE USER SET password='"+password+"' "+"WHERE ID="+userInfo.getId());
			}
			
			userInfo.setEmail(email);
			userInfo.setPassword(password);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/customer.jsp");
		    dispatcher.forward(request, response);
		}
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
