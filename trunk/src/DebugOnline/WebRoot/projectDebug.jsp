<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Utils.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%UserInfo userInfo=(UserInfo)request.getSession().getAttribute("userInfo"); %>
<%if(userInfo==null){ %>
<%request.getSession().setAttribute("message","Please Login first"); %>
<%RequestDispatcher dispatcher = request.getRequestDispatcher("/showMessage.jsp");%>
<%dispatcher.forward(request, response); %>
<%} %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">

		<title>Welcome to Debug Online Service</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="default.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div id="outer">
			<div id="header">
				<h1>
					<a href="#">Pesticide</a>				</h1>
		  <h2>
					by Baldur
				</h2>
			</div>
			<div id="menu">
				<ul>
					<li class="first">
						<a href="#" accesskey="1" title="">Home</a>
					</li>
					<li>
						<a href="searchPage.jsp" accesskey="2" title="">Search</a>
					</li>
					<li>
						<a href="debug.jsp" accesskey="3" title="">Debug</a>
					</li>
					<li>
						<a href="encyclopedia.jsp" accesskey="4" title="">Encyclopedia</a>
					</li>
					<li>
						<a href="contact.jsp" accesskey="5" title="">Contact Us</a>
					</li>
				</ul>
			</div>
			<div id="content">
				<div></div>
				<div id="primaryContentContainer">
					<div id="primaryContent">
						<h2>
							Project Bug detect
						</h2>
                          <%
								Vector<Project> projects = (Vector<Project>) request.getSession()
										.getAttribute("projects");
							%>
							<%if(projects!=null&&projects.size()!=0) {%>
						<div class="loginBack">
						<div class="loginPanel3">
                          <table cellspacing="0" cellpadding="3">
                            <tr>
                              <th> # </th>
                              <th> Project Name</th>
                              <th>created at</th>
                            </tr>
                            <%
									for (int i = 0; i < projects.size(); i++) {
								%>
                            <%
									Project project = projects.get(i);
								%>
                            <%
									if (i % 2 == 0) {
								%>
                            <tr>
                              <%
										}
									%>
                              <td align="center"><%=i + 1%></td>
                              <td><a href="ProjectDetail.do?PId=<%=project.getId()%>"><%=project.getName()%></a></td>
                              <td align="center"><%=project.getCreateaAt()%></td>
                            </tr>
                            <%
									}
								%>
                          </table>
					  </div>
					  </div>
					  <%}else{ %>
						<p>&nbsp;</p>
						<div class="loginPanel">
                        <div>Hey~You havn't created a project yet<br />
                        you can <a href="createProject.jsp">create</a> on now ;-)</div>
                        <div></div>
					  </div>
					  <%} %>
						<p>&nbsp;						</p>
				  </div>
				</div>
				<div id="secondaryContent">
					<h3>
						Hello
						<%
						String username = (String) request.getSession().getAttribute(
								"username");
					%>
						<%
							if (username != null && !username.equals("")) {
						%>
						<%=username%>
						<a href="Logout.do">logout</a>
						<%
							} else {
						%>
						<%="Visitor"%>
						<%
							}
						%>
					</h3>
					<p>
						<%
							if (username == null || username.equals("")) {
						%>
						<%="you may <a href='register.jsp'>register</a> or <a href='login.jsp'>login</a>"%>
						<%
							}
						%>
					</p>
					<h3>
						Search
					</h3>
					<form id="form1" method="post" action="search.do">
						<input type="text" name="search" id="search" width="150px"
							height="18px" />
						<input type="submit" name="search2" id="search2" value="search" />
					</form>
					<p></p>
					<h3>
						BBB
					</h3>
					<p>
						aaa
					</p>
					<h3>
						BBB
					</h3>
					<ul>
						<li>
							bbbb
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<div id="footer">
				<p>
					Copyright &copy; 2009
					<a href="http://stap.sjtu.edu.cn">http://stap.sjtu.edu.cn</a>
				</p>
			</div>
		</div>
	</body>
</html>
