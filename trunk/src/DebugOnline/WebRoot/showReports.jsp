<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="Utils.Report"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    <title>Welcome to Debug Online Service</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Rational by www.mbsky.com</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="default.css" rel="stylesheet" type="text/css" />
  </head>
  
<body>
<div id="outer">
	<div id="header">
		<h1><a href="#">Debug Online</a></h1>
		<h2>by Baldur</h2>
	</div>
	<div id="menu">
		<ul>
			<li class="first"><a href="#" accesskey="1" title="">Home</a></li>
			<li><a href="#" accesskey="2" title="">About Us</a></li>
			<li><a href="#" accesskey="3" title="">Products</a></li>
			<li><a href="#" accesskey="4" title="">Services</a></li>
			<li><a href="#" accesskey="5" title="">Contact Us</a></li>
		</ul>
	</div>
	<div id="content">
		<div id="primaryContentContainer">
			<div id="primaryContent">
				<h2>Welcome to Sitename.com!</h2>
				<p>
                <% Vector<Report> reports=(Vector<Report>)request.getSession().getAttribute("reports");%>
				<table align="center" cellspacing="0" cellpadding="3">
				<tr><th>#</th><th>File</th><th>Line</th><th>Problem</th></tr>
				<%for(int i=0;i<reports.size();i++){ %>
				<% Report report=reports.get(i);%>
				<%if(i%2==0){%>
					<tr bgcolor="lightgrey">
				<% }else{%>
					<tr>
				<% }%>
				<td align="center"><%=i+1 %></td>
				<td width="*%"><%=report.getFilePath() %></td>
				<td align="center" width="5%"><%=report.getLine() %></td>
				<td width="*"><%=report.getInfo() %></td>
				</tr>
				<% } %>
				</table>
                </p>
			</div>
		</div>
		<div id="secondaryContent">
			<h3>Etiam suscipit et</h3>
			<p>&nbsp;</p>
	  </div>
		<div class="clear"></div>
	</div>
	<div id="footer">
		<p>Copyright &copy; 2006 Sitename.com. Designed by <a href="http://www.freecsstemplates.org">www.mbsky.com</a></p>
	</div>
</div>
</body>
</html>
