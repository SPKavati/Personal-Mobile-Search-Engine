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
          <li><a href="home.html">Home</a></li>
          <li class="active"><a href="contentontology.jsp">Content Ontology</a></li>
          <li><a href="locationontology.jsp">Location Ontology</a></li>
          <li><a href="register.jsp">Register</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><img src="images/content.jpg" width="923" height="291" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          
          <div class="article">
            <h2><span>Content</span> Ontology</h2>
            <div class="clr"></div>
            <form action="contentontology1.jsp" method="post" id="sendemail">
              <ol>
                <li>
                  <label for="name">Parent (required)</label>
                  <input id="name" name="parent" class="text" />
                </li>
                <li>
                  <label for="email">Child (required)</label>
                  <input id="email" name="child" class="text" />
                </li>
                <li>
                  <label for="website">Type</label>
                  <select name="type">
				  	<option>Select Type</option>
				  	<option value="Parent-Child">Parent-Child</option>
					<option value="Similarity">Similarity</option>
				  </select>
                </li>
								
                <li>
                  <input type="image" name="imageField" id="imageField" src="images/submit.gif" class="send" />
                  <div class="clr"></div>
                </li>
              </ol>
            </form>
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span></span> </h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#"><img src="images/ontology.png" width="245" height="285" /></a></li>
              
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
