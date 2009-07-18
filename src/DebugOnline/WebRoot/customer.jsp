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
						<h2>Hi ~ 
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
						%></h2>
						<h2>Welcome to your customer page 
						</h2>
					  <div class="loginBack">
					    <div>
                          <div class="loginPanel3">
                            <div>
                              <div
										style="width: 30%; position: relative; float: left; margin-bottom: 10px;"><img src="images/bugs/07.png" alt="detec" width="128" height="128" /></div>
                              <div
										style="width: 70%; position: relative; margin-bottom: 10px;">
                                <p><a href="debug.jsp">Let's go and find the bugs in yout file</a></p>
                              </div>
                            </div>
                          </div>
				        </div>
					  </div>
                      <p>&nbsp;</p>
					  <div class="loginBack">
                        <div>
                          <div class="loginPanel3">
                            <div>
                              <div
										style="width: 30%; position: relative; float: left; margin-bottom: 10px;"><img src="images/bugs/02.png" alt="ency" width="128" height="128" /></div>
                              <div
										style="width: 70%; position: relative; margin-bottom: 10px;">
                                <p><a href="encylopedia.jsp">Let's go and look up the bug encyclopedia</a></p>
                              </div>
                            </div>
                          </div>
                        </div>
				      </div>
                      <p>&nbsp;</p>
					  <div class="loginBack">
                        <div>
                          <div class="loginPanel3">
                            <div>
                              <div
										style="width: 30%; position: relative; float: left; margin-bottom: 10px;"><img src="images/bugs/05.png" alt="ency" width="128" height="128" /></div>
                              <div
										style="width: 70%; position: relative; margin-bottom: 10px;">
                                <p><a href="editInfo.jsp">change your personal infomation</a></p>
                              </div>
                            </div>
                          </div>
                        </div>
				      </div>
					</div>
				</div>
                
				<div id="secondaryContent">
					<h3>
						Hello
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
						to be done
					</h3>
					<p>
						aaa
					</p>
					<h3>
						to be done</h3>
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
