package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.BugStatis;
import Utils.SQLUtil;

public class BugStat extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BugStat() {
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
		String sql = "SELECT * FROM rulesstat";
		ResultSet rs = SQLUtil.getInstance().executeQuery(sql);
		Vector<BugStatis> bugstat = new Vector<BugStatis>();
		try {
			while (rs.next()) {
				BugStatis bug = new BugStatis();
				bug.id = rs.getInt(1);
				bug.name = rs.getString(2);
				bug.category = rs.getString(3);
				bug.type = rs.getString(4);
				bug.tool=rs.getString(5);
				bug.count = rs.getInt(6);

				bugstat.add(bug);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("bugstat", bugstat);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/BugStat.jsp");
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
