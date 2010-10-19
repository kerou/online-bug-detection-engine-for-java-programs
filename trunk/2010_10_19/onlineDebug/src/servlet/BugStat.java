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
		String category = request.getParameter("category");
		Vector<BugStatis> bugstat = new Vector<BugStatis>();

		if (category == null) {
			processName(bugstat);
		} else {
			if (category.equals("name")) {
				processName(bugstat);
			} else {
				if (category.equals("category")) {
					processCategory(bugstat);
				} else {
					if (category.equals("time")) {
						processTime(bugstat);
					} else {
						response
								.sendRedirect("showMessage.jsp?message=something wrong");
					}
				}
			}
		}
		request.setAttribute("category", category);
		request.setAttribute("bugstat", bugstat);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("BugStat.jsp");
		dispatcher.forward(request, response);
	}

	private void processName(Vector<BugStatis> bugstat) {
		String sql = "SELECT name,category,count(name) FROM rulesstat GROUP BY name";
		ResultSet rs = SQLUtil.getInstance().executeQuery(sql);
		try {
			while (rs.next()) {
				BugStatis bug = new BugStatis();
				bug.name = rs.getString(1);
				bug.category = rs.getString(2);
				bug.count = rs.getInt(3);
				bugstat.add(bug);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void processCategory(Vector<BugStatis> bugstat) {
		String sql = "SELECT category,count(category) FROM rulesstat GROUP BY category";
		ResultSet rs = SQLUtil.getInstance().executeQuery(sql);
		try {
			while (rs.next()) {
				BugStatis bug = new BugStatis();
				bug.category = rs.getString(1);
				bug.count = rs.getInt(2);
				bugstat.add(bug);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void processTime(Vector<BugStatis> bugstat) {
		String sql = "SELECT create_at,count(create_at) FROM rulesstat GROUP BY create_at";
		ResultSet rs = SQLUtil.getInstance().executeQuery(sql);
		try {
			while (rs.next()) {
				BugStatis bug = new BugStatis();
				bug.time = rs.getString(1);
				bug.count = rs.getInt(2);
				bugstat.add(bug);
			}
		} catch (SQLException e) {
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
