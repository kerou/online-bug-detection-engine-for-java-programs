<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Utils.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	UserInfo userInfo = (UserInfo) request.getSession().getAttribute(
			"userInfo");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>
Welcome to Debug Online Service
</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="outer">
<div id="header">
<h1>
<a href="#">
Bugcide
</a>
</h1>
<h2>
by Baldur
</h2>
</div>
<div id="menu">
<ul>
<li class="first">
<a href="index2.jsp" accesskey="1" title="">
Home</a></li>
<li>
<a href="BugStat.do" accesskey="2" title="">
Statistics</a></li>
<li>
<a href="debug.jsp" accesskey="3" title="">
Debug</a></li>
<li>
<a href="encyclopedia.jsp" accesskey="4" title="">
Encyclopedia</a></li>
<li>
<a href="contact.jsp" accesskey="5" title="">
Contact Us</a></li>
</ul>
</div>
<div id="content">
<div></div>
<div id="primaryContentContainer">
<div id="primaryContent">
<h2>
Please choose the debug mode
</h2>
<h3>
1.find bugs in a single file
</h3>
<div>
<div class="loginPanel">
<div>
<div
	style="width: 30%; position: relative; float: left; margin-bottom: 10px;"><img src="images/bugs/02.png" alt="" width="128" height="128" /></div>
<div style="width: 70%; position: relative; margin-bottom: 10px;">
<a href="singleDebug.jsp">
If you want to find the hidden bugs in a single file.Please click here.
</a>
</div>
</div>
</div>
</div>
<p>&nbsp;

</p>
<%if(userInfo!=null){ %>
        <h3>
            2.find bugs involved in a project
        </h3>
        <div>
            <div class="loginPanel">
                <div>
                    <div
                        style="width: 30%; position: relative; float: left; margin-bottom: 10px;"><img src="images/bugs/07.png" alt="" width="128" height="128" /></div>
      <div
                        style="width: 70%; position: relative; margin-bottom: 10px;">
                        <a href="ProjectDebug.do?Uid=<%=userInfo.getId()%>">If you want to find the hidden bugs in a built project.Please click here.</a>
                    </div>
                </div>
            </div>
        </div>
        <p>&nbsp;<a href="customer.jsp">your customer Page</a>
          <%} %>   
						</p>
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
