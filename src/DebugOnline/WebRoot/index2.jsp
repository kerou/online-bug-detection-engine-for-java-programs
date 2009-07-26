<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
        <link href="css/index.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
		<div id="outer">
			<div id="header">
				<h1>
					<a href="#">Bugcide</a></h1>
				<h2>
					by Baldur
				</h2>
			</div>
			<div id="menu">
				<ul>
					<li class="first">
					  <a href="index2.jsp" accesskey="1" title="">Home</a>					</li>
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
							Welcome to the onlinde bug detection engine</h2>
						<div></div>
				        <table cellspacing="0" cellpadding="0">
                          <tbody>
                            <tr valign="top">
                              <td class="navigateGrid"><a href="debug.jsp" target="_blank"> <img src="images/bugs/01.png"
									width="64" height="64"
									onmouseover="this.src = 'images/bugs/05.png'"
                                    onmouseout="this.src = 'images/bugs/01.png'" /> </a> </td>
                              <td class="navigateGrid"><a href="encyclopedia.jsp" target="_blank"><img src="images/bugs/02.png"
									width="64" height="64" 
									onmouseover="this.src= 'images/bugs/06.png'"
									onmouseout="this.src= 'images/bugs/02.png'" /> </a> </td>
                              <td class="navigateGrid"><a href="BugStat.do" target="_blank"><img src="images/bugs/03.png"
									width="64" height="64"
									onmouseover="this.src= 'images/bugs/07.png'"
									onmouseout="this.src= 'images/bugs/03.png'" /> </a> </td>
                              <td class="navigateGrid"><a href="Help.jsp" target="_blank"><img src="images/bugs/04.png"
									width="64" height="64" 
									onmouseover="this.src= 'images/bugs/08.png'"
									onmouseout="this.src= 'images/bugs/04.png'" /> </a> </td>
                            </tr>
                            <tr valign="bottom">
                              <td class="navigateGrid"><a href="debug.jsp" target="_blank">Bug Detect</a> </td>
                              <td class="navigateGrid"><a href="encyclopedia.jsp" target="_blank">Encyclopedia</a> </td>
                              <td class="navigateGrid"><a href="BugStat.do" target="_blank">Statistics</a> </td>
                              <td class="navigateGrid"><a href="Help.jsp" target="_blank">Help</a> </td>
                            </tr>
                          </tbody>
                        </table>
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
