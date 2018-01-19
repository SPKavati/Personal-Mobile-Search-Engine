<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>

<%
String fid=null,fname=null,rid=null;
String id=(String)session.getAttribute("uid");
String name=(String)session.getAttribute("name");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>PMSE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<body>
<div class="main">
  <div class="main_resize">
    <div class="header">
      <div class="logo">
        <h1><span>PMSE: A Personalized Mobile Search Engine</span><small></small></h1>
      </div>
      <div class="search">
    		
        <!--/searchform -->
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
      <div class="menu_nav">
        <ul>
			<li><a><%=session.getAttribute("mymobile")%></a></li>
          <li class="active"><a href="userpage.jsp">Personal Search</a></li>
          
          <li><a href="home.html">SignOut</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="images/header_images.png" width="923" height="25" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
           <div class="article">
		  	<h2><span></span>Personalized Search</h2>
				<br />
				<br />
				<br />
				<br />
				<form name="f" action="search1.jsp" method="post">
     
          		<p align="center">
				<input type="text"  name="search" style="height: 2em; width: 15em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Search here"  onkeypress="checkEnter(event)">
				</p>
      		</form>
			
            
            <div class="clr"></div>
			 

          </div>
          <div class="article">
            
            <div class="clr"></div>
            
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Mobile Search </span> Engine</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#"><img src="images/search.png" width="245" /></a></li>
              
            </ul>
          </div>
 
        </div>
        <div class="clr"></div>
      </div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">

      <div class="clr"></div>
    </div>
  </div>
</div>
<div class="footer">
  <div class="footer_resize">
    <p align="center">PMSE: A Personalized Mobile Search Engine</p>
    <div class="clr"></div>
  </div>
</div>
</body>
</html>