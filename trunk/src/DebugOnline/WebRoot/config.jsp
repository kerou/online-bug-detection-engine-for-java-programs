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
					<a href="#">Pesticide</a>
				</h1>
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
							Config
						</h2>
						<div>
							<form id="form2" method="post" action="PMDConfig.do">
								<h3>PMD Config								</h3>
							  <div class="loginPanel">
                                <div class="inputLabel">
										Enable
							    </div>
									<div class="inputField">
										ddddd
									</div>
<div class="inputLabel">
										RuleSet
								</div>
									<div class="inputField">
									  <input type="checkbox" name="pmdRules" id="checkbox1" />
									  Android Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox2" />
									  Basic JSF rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox3" />
									  Basic JSP rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox4" />
									  Basic Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox5" />
									  Braces Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox6" />
									  Clone Implementation Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox7" />
									  Code Size Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox8" />
									  Controversial Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox9" />
									  Coupling Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox10" />
									  Design Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox11" />
									  Finalizer Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox12" />
									  Import Statement Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox13" />
									  J2EE Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox14" />
									  JavaBean Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox15" />
									  JUnit Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox16" />
									  Jakarta Commons Logging Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox17" />
									  Java Logging Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox18" />
									  Migration Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox19" />
									  Migration13<br />
									  <input type="checkbox" name="pmdRules" id="checkbox20" />
									  Migration14<br />
									  <input type="checkbox" name="pmdRules" id="checkbox21" />
									  Migration15<br />
									  <input type="checkbox" name="pmdRules" id="checkbox22" />
									  MigratingToJava4<br />
									  <input type="checkbox" name="pmdRules" id="checkbox23" />
									  Naming Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox24" />
									  Optimization Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox25" />
									  Strict Exception Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox26" />
									  String and StringBuffer Rules<br />
									  <input type="checkbox" name="pmdRules" id="checkbox27" />
									  Security Code Guidelines<br />
								      <input type="checkbox" name="pmdRules" id="checkbox28" />
							        Type Resolution Rules<br />
								      <input type="checkbox" name="pmdRules" id="checkbox29" />
							        Unused Code Rules</div>
                                </div>
							  <div class="inputButton">
									<input type="submit" name="submit2" id="submit2" value="submit" />
							  </div>
                          </form>
                                
<p>&nbsp;
									
						  </p>
                                <form id="form2" method="post" action="FindBugsConfig.do">
								<h3>
									FindBugs Config
								</h3>
								<div class="loginPanel">
                                <div class="inputLabel">
										Enable
								  </div>
									<div class="inputField">
									    <label>
								        <input type="radio" name="Enable" value="0" id="Enable_0" />
									      Yes
									    </label>
									    <label>
				                <input type="radio" name="Enable" value="1" id="Enable_1" />
									      No</label>
									    <br />
								      </p>
									</div>
                                    <div class="inputLabel">
										Strength
									</div>
									<div class="inputField">
									    <label>
								        <input type="radio" name="strength" value="1" id="RadioGroup1_0" />
									      low</label>
									    <label>
								        <input type="radio" name="strength" value="2" id="RadioGroup1_1" />
									      medium</label>
									    <label>
								        <input type="radio" name="strength" value="3" id="RadioGroup1_2" />
									      strong</label>
									    <br />
								      </p>
									</div>
                                  </div>
				  <div class="inputButton">
									<input type="submit" name="submit2" id="submit2" value="submit" />
								</div>
							</form>
						</div>
					  <p>&nbsp;
							
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
