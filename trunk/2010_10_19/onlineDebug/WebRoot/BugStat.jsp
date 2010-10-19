<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Utils.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String category = (String) request.getAttribute("category");
%>

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
					<a href="#">Bugcide</a>
				</h1>
				<h2>
					by Baldur
				</h2>
			</div>
			<div id="menu">
				<ul>
					<li class="first">
						<a href="index2.jsp" accesskey="1" title="">Home</a>
					</li>
					<li>
						<a href="BugStat.do" accesskey="2" title="">Statistics</a>
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
							Hi ~
							<%
							String username = (String) request.getSession().getAttribute(
									"username");
						%>
							<%
								if (username != null && !username.equals("")) {
							%>
							<%=username%>
							<%
								}
							%>
						</h2>
						<h2>
							Bug Statistics
						</h2>
						<div class="loginBack">
							<div></div>
						</div>
						<p>
							<%
								Vector<BugStatis> bugstat = (Vector<BugStatis>) request
										.getAttribute("bugstat");
							%>

						</p>
						<%
							UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
									"userInfo");
						%>
						<%
							if (userInfo != null) {
						%>
						<a href="MyBug.do"> click here to see your statistics </a>
						<br></br>
						<a href="MyBug.do?category=name">name</a>
						<a href="MyBug.do?category=category">category</a>
						<a href="MyBug.do?category=time">time</a>
						<%
							}else{
						%>
						<a href="BugStat.do?category=name">name</a>
						<a href="BugStat.do?category=category">category</a>
						<a href="BugStat.do?category=time">time</a>
						<%}
							if (category == null) {
						%>
						<%
							for (int i = 0; i < bugstat.size(); i++) {
									BugStatis bug = bugstat.get(i);
						%>
						<div class="loginBack">
							<div>
								<div class="loginPanel3">
									<div align="left"><h2><%=bug.getName()%></h2></div>
									<div align="left"><h3>Count:<%=bug.getCount()%></h3></div>
								    </div>
								</div>
							</div>
						<%
							}
						%>
						<%
							} else {
								if (category.equals("name")) {
						%>
						<%
							for (int i = 0; i < bugstat.size(); i++) {
										BugStatis bug = bugstat.get(i);
						%>
						<div class="loginBack">
							<div>
								<div class="loginPanel3">
									<div align="left"><h2><%=bug.getName()%></h2></div>
									<div align="left"><h2>Count:<%=bug.getCount()%></h2></div>
								</div>
							</div>
						</div>
						<%
							}
						%>
						<%
							} else {
									if (category.equals("category")) {
						%>
						<%
							for (int i = 0; i < bugstat.size(); i++) {
											BugStatis bug = bugstat.get(i);
						%>
						<div class="loginBack">
							<div>
								<div class="loginPanel3">
									<div align="left"><h2><%=bug.getCategory()%></h2></div>
									<div align="left"><h2>Count:<%=bug.getCount()%></h2></div>
								</div>
							</div>
						</div>
						<%
							}
						%>
						<%
							} else {
										if (category.equals("time")) {
						%>
						<%
							for (int i = 0; i < bugstat.size(); i++) {
												BugStatis bug = bugstat.get(i);
						%>
						<div class="loginBack">
							<div>
								<div class="loginPanel3">
									<div align="left"><h2><%=bug.time%></h2></div>
									<div align="left"><h2>Count:<%=bug.getCount()%></h2></div>
								</div>
							</div>
						</div>
						<%
							}
						%>
						<%
							} else {
						%>
						Something wrong
						<%
							}
						%>
						<%
							}
						%>
						<%
							}
						%>
						<%
							}
						%>


					</div>
				</div>

				<div id="secondaryContent">
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
						to be done
					</h3>
					<p>
						aaa
					</p>
					<h3>
						to be done
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

