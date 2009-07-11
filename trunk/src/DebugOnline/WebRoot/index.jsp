<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<base href="<%=basePath%>">
		<TITLE>Welcome to the online bug detect engine</TITLE>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<link href="css/index.css" rel="stylesheet" type="text/css" />
	</HEAD>
	<BODY aLink=#ff0000 link=#0000cc topMargin=3 bgColor=#ffffff
		text=#000000 vLink=#551a8b marginheight="3">
		<DIV id=gbar>
			<NOBR>
			<A class=gb1 href="">Search</A>
			<A class=gb1 href="">Bug Detect</A>
			<A class=gb1 href="">Bug Encyclopedia</A>
			<A class=gb1 href=""></A>
			<DIV id=gbi>
				<DIV class=gb2>
					<DIV class=gbd>
					</DIV>
				</DIV>
				<DIV class=gb2>
					<DIV class=gbd>
					</DIV>
				</DIV>
				<DIV class=gb2>
					<DIV class=gbd>
					</DIV>
				</DIV>
			</DIV>
			</NOBR>
		</DIV>

		<DIV id=guser width="100%">
			<NOBR>
			<A href="">Index</A>|
			<A href="">Login</A>
			</NOBR>
		</DIV>

		<DIV style="LEFT: 0px" class=gbh>
		</DIV>
		<DIV style="RIGHT: 0px" class=gbh>
		</DIV>

		<CENTER>
		<BR id=lgpd clear=all>
		<A href="" target=_blank> <IMG id=logo title="" border=0 alt=""
				src="images/logo.png" width=306 height=134> </A>
		<BR>
		<BR>
		<FORM name=f action="/search">
			<B class=gb1>Welcome to online bug detect engine</B>
			<br>
			<br>
			<TABLE cellSpacing=0 cellPadding=0>
				<TBODY>
					<TR vAlign=top>
						<TD width="25%">
							&nbsp;
						</TD>
						<TD noWrap align=middle>
							<div class="searchInput">
								<INPUT title="search">
							</div>
							<BR>
						</TD>
						<TD width="25%" noWrap align=left>
							<FONT size=-1>
							<INPUT value="Search" type=submit class="searchButton">
							</FONT>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
		<div>

			<TABLE cellSpacing=0 cellPadding=0>
				<TBODY>
					<TR vAlign=top>
						<TD class="navigateGrid">
							<A href="" target=_blank><img src="images/bugs/01.png"
									width="64" height="64"
									onmouseover=
	this.src = 'images/bugs/05.png';
onmouseout=
	this.src = 'images/bugs/01.png';
>
							</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank><img src="images/bugs/02.png"
									width="64" height="64"
									onmouseover=
	this.src = 'images/bugs/06.png';
onmouseout=
	this.src = 'images/bugs/02.png';
>
							</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank><img src="images/bugs/03.png"
									width="64" height="64"
									onmouseover=
	this.src = 'images/bugs/07.png';
onmouseout=
	this.src = 'images/bugs/03.png';
>
							</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank><img src="images/bugs/04.png"
									width="64" height="64"
									onmouseover=
	this.src = 'images/bugs/08.png';
onmouseout=
	this.src = 'images/bugs/04.png';
>
							</A>
						</TD>
					</TR>
					<TR vAlign=bottom>
						<TD class="navigateGrid">
							<A href="" target=_blank>aaaa</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank>bbbb</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank>cccc</A>
						</TD>
						<TD class="navigateGrid">
							<A href="" target=_blank>dddd</A>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<div>
				<p>
					<BR>
					<FONT size=-1>
					<A href="" target=_blank>What can u do with Pesticides？</A></FONT>
				</p>
				<p>
					<FONT size=-1>
					<A href="">User Manual</A> -
					<A href="">Bug Encyclopedia</A> -
					<A href="">Wikipedia</A>
					</FONT>
				</p>
				<P>
					<FONT size=-1>©2009 -
					<A href="http://stap.sjtu.eud.cn">STAP@SJTU</A> -
					</FONT>
				</P>
			</div>
		</div>

		</CENTER>
	</BODY>
</HTML>
