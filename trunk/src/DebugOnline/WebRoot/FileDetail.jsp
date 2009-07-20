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

		<title>Edit File</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="default.css" rel="stylesheet" type="text/css" />
	</head>

	<body>
	<jsp:plugin code="aaa.class" codebase="" type="bean">
	<jsp:params name="line" value="<%=request.getParameter("line") %>">
	</jsp:params>
	<jsp:params name="Fid" value="<%=request.getParameter("Fid") %>">
	</jsp:params>
	<jsp:params name="Uid" value="<%=request.getParameter("Uid") %>">
	</jsp:params>
	<jsp:params name="content" value="<%=request.getParameter("content") %>">
	</jsp:params>
	</jsp:plugin>
	<form id="form1" method="post" action="">
      <p>
        <textarea></textarea>
      </p>
      <p><input type="submit" name="Submit" id="Submit" value="submit" />
        <input type="cancel" name="Submit2" id="Submit2" value="cancel" />
      </p>
	</form>
</body>
</html>
