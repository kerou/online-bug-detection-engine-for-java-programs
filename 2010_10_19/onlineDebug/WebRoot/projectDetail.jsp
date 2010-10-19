<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Utils.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Project project = (Project) request.getSession().getAttribute(
			"project");
	if (project == null) {
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}
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
		<script type="text/javascript" src="js/dtree.js"></script>
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
						<a href="searchPage.jsp" accesskey="2" title="">Statistics</a>
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
							Your Project
						</h2>
						<p>
							&nbsp;


						</p>
						<p>
							&nbsp;


						</p>
						<div class="loginBack">
							<div>
								<div class="loginPanel3">
									<div
										style="position: relative; float: left; margin-bottom: 10px; text-align: left;">
										<p>
											<a href="javascript: d.openAll();">open all</a> |
											<a href="javascript: d.closeAll();">close all</a>
										</p>
										<script type="text/javascript">
		<!--

		d = new dTree('d');

		<%for (int i = 0; i < project.getItemSize(); i++) {
				ProjectItem item = project.getProjectItem(i);
				if (item.getIsDir()) {%>
				d.add(<%=item.getId()%>,<%=item.getParent()%>,<%="'" + item.getName() + "'"%>,<%="''"%>,<%="'" + item.getName() + "'"%>,<%="''"%>,<%="''"%>,<%="'img/folderopen.gif'"%>);
				<%} else {%>
				d.add(<%=item.getId()%>,<%=item.getParent()%>,<%="'" + item.getName() + "'"%>,<%="'FileDetail.jsp?Fid=" + item.getId()
							+ "&line=0'"%>,"","_blank");
				<%}
			}%>
		document.write(d);

		//-->
	</script>
									</div>
									<div
										style="width: 70%; position: relative; margin-bottom: 10px; text-align: center; float: right;">
										<div class="buttonContainer">
											<a href="uploadProject.jsp">Upload</a>
										</div>
										<div class="buttonContainer">
											<a href="DeleteProject.do?PId=<%=project.getId()%>">Delete</a>
										</div>
										<div class="buttonContainer">
											<a href="CreateProjectReport.do">Debug</a>
										</div>
									</div>
								</div>
							</div>
						</div>
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
