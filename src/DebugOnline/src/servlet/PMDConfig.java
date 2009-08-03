package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Utils.SQLUtil;
import Utils.UserInfo;

public class PMDConfig extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PMDConfig() {
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
			HttpSession session = request.getSession();
			session.setAttribute("message", "Please login first");
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("/showMessage.jsp");
			dispatcher.forward(request, response);
		}
		int Uid = userInfo.getId();
		String enable = request.getParameter("enable");
		String[] rules = request.getParameterValues("pmdRules");
		StringBuffer sb = new StringBuffer("");
		boolean match = false;
		for (int i = 0; i < 29; i++) {
			for (int j = 0; j < rules.length; j++) {
				if (rules[j].equals(String.valueOf(i + 1))) {
					match = true;
					break;
				}
			}
			if (match == false) {
				sb.append("0");
			} else {
				sb.append("1");
			}
			match = false;
		}
		String sql = "UPDATE UserCOnfig SET PMDconfig ='" + enable
				+ sb.toString() + "' WHERE userId=" + Uid;
		SQLUtil.getInstance().execute(sql);
		SQLUtil.updateRules(userInfo, enable + sb.toString(), "PMD");
		response.sendRedirect("Config.do");
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
