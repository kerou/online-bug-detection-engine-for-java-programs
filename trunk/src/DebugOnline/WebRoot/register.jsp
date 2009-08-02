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
		<script type="text/javascript">
		function checkUsername(){
			var username=document.getElementById("username").value;
			var patrn=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
			if(!patrn.test(username)){
				document.getElementById("usernameerror").style.display="";
			}else{
				document.getElementById("usernameerror").style.display="none";
			}
		}
		
		function checkPassword1(){
			var password1=document.getElementById("password1").value;
			var patrn=/^[a-zA-Z0-9]{4,15}$/;
			if(!patrn.test(password)){
				document.getElementById("passworderror").style.display="";
			}else{
				document.getElementById("passworderror").style.display="none";
			}
			if(document.getElementById("password1").value!=document.getElementById("password2").value){
					document.getElementById("passwordnotmatch").style.display="";
			}else{
					document.getElementById("passwordnotmatch").style.display="none";
			}
		}
		
		function checkPassword2(){
			var password2=document.getElementById("password2").value;
			var patrn=/^[a-zA-Z0-9]{4,15}$/;
			if(!patrn.test(password2)){
				document.getElementById("passworderror").style.display="";
			}else{
				document.getElementById("passworderror").style.display="none";
			}
			if(document.getElementById("password1").value!=document.getElementById("password2").value){
					document.getElementById("passwordnotmatch").style.display="";
			}else{
					document.getElementById("passwordnotmatch").style.display="none";
			}
		}
		
		function checkEmail(){
			var email=document.getElementById("email").value;
			var patrn =/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
			if(!patrn.test(email)){
				document.getElementById("emailerror").style.display="";
			}else{
				document.getElementById("emailerror").style.display="none";
			}
		}
		
		function submitForm2(){
			if(document.getElementById("username").value==""){
				alert("please enter username");
			}else{
				if(document.getElementById("password1").value==""){
					alert("please enter password");
				}else{
					if(document.getElementById("password2").value==""){
						alert("please enter password checked");
					}else{
						if(document.getElementById("school").value==""){
							alert("please enter school");
						}else{
							if(document.getElementById("email").value==""){
								alert("please enter email");
							}else{
								if(
								   document.getElementById("usernameerror").style.display==""||
								   document.getElementById("passworderror").style.display==""||
								   document.getElementById("emailerror").style.display==""
								){
									alert("please correct the errors first");
								}else{
									document.getElementById("form2").submit();
								}
							}
						}
					}
				}
			}
		}
        </script>
	</head>

	<body>
		<div id="outer">
			<div id="header">
				<h1>
					<a href="#">Bugcide</a>
				</h1>
				<h2>
					by Baldur
				</h2>
			</div>
			<div id="menu">
				<ul>
					<li class="first">
						<a href="index2.jsp" accesskey="1" title="">Home</a>
					</li>
					<li>
						<a href="BugStat.do" accesskey="2" title="">Statistics</a>
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
							Register for an account
						</h2>
						<div>
							<form id="form2" method="post" action="Register.do">
								<div class="loginPanel2">
									<div class="inputLabel2">
										username:
									</div>
									<div class="inputField2">
										<input name="username" type="text" id="username"
											onpropertychange="checkUsername()" />
									</div>
									<div class="inputLabel2">
										choose a password:
									</div>
									<div class="inputField2">
										<input type="password" name="password1" id="password1"
											onpropertychange="checkPassword1()" />
									</div>
									<div class="inputLabel2">
										re-enter password:
									</div>
									<div class="inputField2">
										<input type="password" name="password2" id="password2"
											onpropertychange="checkPassword2()" />
									</div>
									<div class="inputLabel2">
										school
									</div>
									<div class="inputField2">
										<input name="school" type="text" id="school" />
									</div>
									<div class="inputLabel2">
										sex
									</div>
									<div class="inputField2">
										<label>
											<input type="radio" name="sex" value="0" id="M"
												checked="checked" />
											Male
										</label>
										<label>
											<input type="radio" name="sex" value="1" id="F" />
											Female
										</label>
									</div>
									<div class="inputLabel2">
										Email:
									</div>
									<div class="inputField2">
										<input name="email" type="text" id="email"
											onpropertychange="checkEmail()" />
									</div>
									<div class="inputLabel5" style="display: none"
										id="usernameerror">
										username should only be consisted of numbers and letters. Its
										length should be between 5 and 15.
									</div>
									<div class="inputLabel5" style="display: none"
										id="passworderror">
										password should only be consisted of numbers and letters. Its
										length should be between 5 and 15.
									</div>
									<div class="inputLabel5" style="display: none"
										id="passwordnotmatch">
										the two password can not match
									</div>
									<div class="inputLabel5" style="display: none" id="emailerror">
										something wrong with the pattern of the email address
									</div>
								</div>
							</form>
						</div>
						<div class="inputButton">
							<input type="submit" name="submit" id="submit" value="submit"
								onclick="submitForm2()" />
						</div>
						<p>
							&nbsp;
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
