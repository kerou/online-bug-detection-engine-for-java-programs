<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to Debug Online Service</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="style.css" rel="stylesheet" type="text/css" />
  </head>
  
<body>
<!--nav start -->
<div id="nav">
<ul>
<li class="about"><span>Introduction</span></li>
<li><a href="#">Single File Debug</a></li>
<li><a href="#">Project Debug</a></li>
<li><a href="#">Login</a></li>
<li class="nbdr"><a href="#">contact us</a></li>
</ul>
</div>
<!--nav end -->
<!--body start -->
<div id="body">
<!--left start -->
<div id="left">
<a href="#" class="join"></a>
<img src="images/logo.gif" alt="modern outlook" width="119" height="209" />
<p class="top"></p>
<ul>
<li><a href="#" class="link">Lorem ipsum</a></li>
<li><a href="#" class="link">dolor sit amet,</a></li>
<li><a href="#" class="link">consectetuer</a></li>
<li><a href="#" class="link">adipiscing elit.</a></li>
<li><a href="#" class="link">Ut luctus. In</a></li> 
<li><a href="#" class="link">varius lorem a</a></li> 
<li><a href="#" class="link">lacus. Cras</a></li> 
<li><a href="#" class="link">pede nisi,</a></li> 
<li><a href="#" class="link">vestibulum</a></li> 
<li><a href="#" class="link">feiat, eleifend</a></li> 
<li><a href="#" class="link">ac, convallis</a></li> 
<li><a href="#" class="link">molestie libero.</a></li> 
<li><a href="#" class="link">Quisque mattis</a></li> 
<li><a href="#" class="link">tempus lorem.</a></li> 
<li><a href="#" class="link">In eros.nec,</a></li>
</ul>
<p></p>
</div>
<!--left end -->
<!--right start -->
<div id="right">
<div id="right-top">
<h2>why choose us</h2>
<a href="#">home</a>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Ut luctus. In varius lorem a lacus. Cras pede nisi, vestibulum feiat, eleifend ac, convallis
</p>
<p class="txt2">molestie non, ullamcorper eget, mi. Pellentesque euismod ttor porta ante. Mauris gravida semper neque. Curabitur molestie dictum libero. Quisque mattis tempus lorem. In eros. Fuscente enim, euismod sit amet, adipiscing nec,</p>
<a href="#" class="more">more</a>
<h2 class="log">login info</h2>
<form name="log-info" action="#" method="post">
<label>your name</label>
<input type="text" name="name"/>
<label>password</label>
<input type="password" name="password"/>
<input name="check" type="checkbox" value="" class="check" />
<label class="blue">remember my password</label>
<input type="submit" name="login" value="" class="login" />
</form>
<p class="bot"></p>
<h2 class="banner">
main<br />
<b>events</b><span>2007</span>
</h2>
</div>
<p class="bottom"></p>
</div>
<!--right end -->
<!--contact start -->
<div id="contact">
<h2>contact info</h2>
<form name="contact" action="#" method="post" class="con">
<label>first name</label>
<input type="text" name="first_name" />
<label>middle name</label>
<input type="text" name="middle_name" />
<label>last name</label>
<input type="text" name="last_name" />
<label>email id</label>
<input type="text" name="email_id" />
<label class="blue2">comments</label>
<textarea name="comments" cols="" rows=""></textarea>
<input type="submit" name="button" class="submit" value="" />
<br class="spacer" />
</form>
<p class="bot2"></p>
</div>
<!--contact end -->
</div>
<!--body end -->
<div id="footer-main">
<div id="footer">
<ul>
<li class="home2">about us</li>
<li>|<a href="#">service</a>|</li>
<li><a href="#">support</a>|</li>
<li><a href="#">testimonials</a>|</li>
<li><a href="#">report</a>|</li>
<li><a href="#">future</a>|</li>
<li><a href="#">latest</a>|</li>
<li><a href="#">meetings</a>|</li>
<li><a href="#">contact us</a></li>
</ul>
<p class="copyright">&copy; Copyright Information Goes Here.</p>
<a href="http://validator.w3.org/check?uri=referer" target="_blank" class="xht">xhtml</a>
<a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank" class="cs">css</a>
<p class="design">Designed By- <a href="http://www.templateworld.com/" target="_blank" class="link">Template World</a></p>
</div>
</div>
</body>
</html>
