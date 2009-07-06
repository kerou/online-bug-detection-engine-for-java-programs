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
				<p><strong>Rational</strong> is a free template from <a href="http://www.freecsstemplates.org/">www.mbsky.com</a> released under a <a href="http://creativecommons.org/licenses/by/2.5/">Creative Commons Attribution 2.5 License</a>. You're free to use it for both commercial or personal use. I only ask that you link back to <a href="http://www.freecsstemplates.org/">my site</a> in some way. Enjoy :)</p>
				<p>Suspendisse potenti. Donec nulla est, laoreet quis, pellentesque in, congue in, dui. Nunc rhoncus placerat augue. Donec justo odio, eleifend varius, volutpat venenatis, sagittis ut, orci. Donec nulla est, laoreet quis, pellentesque in, congue in, dui. Nunc rhoncus placerat augue. Donec justo odio, eleifend varius, volutpat venenatis, sagittis ut, orci. Nullam et orci in erat viverra ornare. Nunc pellentesque.</p>
				<p>Sed vestibulum blandit nisl. Quisque elementum convallis purus. Quisque pellentesque semper massa:</p>
				<h3>Example Unordered List</h3>
				<ul>
					<li><a href="#">Suspendisse quis gravida massa felis.</a></li>
					<li><a href="#">Vivamus sagittis bibendum erat.</a></li>
					<li><a href="#">Nullam et orci in erat viverra ornare.</a></li>
					<li><a href="#">Suspendisse quis gravida massa felis.</a></li>
					<li><a href="#">Curabitur malesuada turpis nec ante.</a></li>
				</ul>
				<h3>Example Blockquote</h3>
				<blockquote>
						<p>Aliquam gravida massa eu arcu. Fusce mollis tristique sem. Sed eu eros imperdiet eros interdum blandit. Vivamus sagittis bibendum erat. Curabitur malesuada turpis nec ante. Suspendisse quis felis. Suspendisse potenti. Nullam et orci in erat viverra ornare. Nunc pellentesque. Sed vestibulum blandit nisl. Quisque elementum convallis purus.</p>
				</blockquote>
				<h3>Example Table</h3>
				<table>
					<tr>
						<th>Date</th>
						<th>Title</th>
						<th>Description</th>
					</tr>
					<tr class="rowA">
						<td>December 1, 2006</td>
						<td>Sed vestibulum blandit</td>
						<td>Vivamus sollicitudin dolor sit amet eros. Vivamus ligula. Sed pretium turpis eu ipsum. Sed rutrum sapien id arcu.</td>
					</tr>
					<tr class="rowB">
						<td>November 28, 2006</td>
						<td>Augue non nibh</td>
						<td>Nam adipiscing urna ac consequat dignissim massa est sodales sem.</td>
					</tr>
					<tr class="rowA">
						<td>November 23, 2006</td>
						<td>Fusce ut diam bibendum</td>
						<td>Vestibulum quis urn nulla facilis nam malesuada cursus turpis.</td>
					</tr>
					<tr class="rowB">
						<td>November 21, 2006</td>
						<td>Maecenas et ipsum</td>
						<td>Vivamus mi lectus gravida scelerisque, ultrices vitae cursus in neque.</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="secondaryContent">
			<h3>Etiam suscipit et</h3>
			<p>Rhoncus ac, lacinia, nisl. Aliquam gravida massa eu arcu. <a href="#">More&#8230;</a></p>
			<h3>Fusce dolor tristique</h3>
			<p>Sed eu eros imperdiet eros interdum blandit. Vivamus sagittis bibendum erat. Curabitur malesuada. <a href="#">More&#8230;</a></p>
			<h3>Nunc pellentesque</h3>
			<p>Sed vestibulum blandit nisl. Quisque elementum convallis purus. Suspendisse potenti. Donec nulla est, laoreet quis, pellentesque in. <a href="#">More&#8230;</a></p>
			<h3>Ipsum Dolorem</h3>
			<ul>
				<li><a href="#">Sagittis Bibendum Erat</a></li>
				<li><a href="#">Malesuada Turpis</a></li>
				<li><a href="#">Quis Gravida Massa</a></li>
				<li><a href="#">Inerat Viverra Ornare</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">
		<p>Copyright &copy; 2006 Sitename.com. Designed by <a href="http://www.freecsstemplates.org">www.mbsky.com</a></p>
	</div>
</div>
</body>
</html>
