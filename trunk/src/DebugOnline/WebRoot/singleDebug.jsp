<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
				<h2>Welcome to Single File Debug</h2>
                <form id="form1" method="post" action="CreateSingleReport.do">
				<p>
				  <input name="pmd" type="checkbox" value="1" checked />
                  PMD
                  <input name="findbugs" type="checkbox" value="1" checked />
                  FindBugs
                </p>
				<div class="editContent">
                	<textarea id="content" name="content" cols="50" rows="30" style="height:100%;width:100%;"></textarea>
                </div>
				<p>
			      <input type="submit" name="submit" id="submit" value="submit" />
				</p>
                </form>
		  </div>
		</div>
		<div id="secondaryContent">
			<h3>Etiam suscipit et</h3>
			<p>&nbsp;</p>
			<h3>&nbsp;</h3>
	  </div>
		<div class="clear"></div>
	</div>
	<div id="footer">
		<p>Copyright &copy; 2006 Sitename.com. Designed by <a href="http://www.freecsstemplates.org">www.mbsky.com</a></p>
	</div>
</div>
</body>
</html>