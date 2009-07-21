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
		<applet codebase="./classes" code="TestApplet.class" name="TestApplet"
			width="320" height="240">
			<param name="line" value="<%=request.getAttribute("line")%>">
			<param name="Fid" value="<%=request.getAttribute("Fid")%>">
			<param name="Uid" value="<%=request.getAttribute("Uid")%>">
			<param name="content" value="<%=request.getAttribute("content")%>">
		</applet>
	</body>
</html>
