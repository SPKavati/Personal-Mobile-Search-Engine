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

<style type="text/css">
body {
    margin: 0;
    padding: 0;
    font-family: "Gill sans", sans-serif;
    background-color: #fff;
    color: #000;
}
div#bd {
    position: relative;
}
div#gmap {
    width: 100%;
    height: 400px;
}
.style4 {
	color: #FF0000;
	font-weight: bold;
	font-size: 16pt;
}
</style>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
var map;
var marker=false;
function initialize() {
  var myLatlng = new google.maps.LatLng(13.053721679021347,80.22521737216266);
  
  var myOptions = {
    zoom: 16,
    center: myLatlng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
	
  }
  
  map = new google.maps.Map(document.getElementById("gmap"), myOptions);
  
  marker = new google.maps.Marker({
      	position: myLatlng, 
      	map: map
  	});
	
  google.maps.event.addListener(map, 'center_changed', function() {
  	var location = map.getCenter();
	document.getElementById("lat").innerHTML = location.lat();
	document.getElementById("lon").innerHTML = location.lng();
    placeMarker(location);
  });
  google.maps.event.addListener(map, 'zoom_changed', function() {
  	zoomLevel = map.getZoom();
	document.getElementById("zoom_level").innerHTML = zoomLevel;
  });
  google.maps.event.addListener(marker, 'dblclick', function() {
    zoomLevel = map.getZoom()+1;
    if (zoomLevel == 20) {
     zoomLevel = 10;
   	}    
	document.getElementById("zoom_level").innerHTML = zoomLevel; 
	map.setZoom(zoomLevel);
	 
  });
  
   document.getElementById("zoom_level").innerHTML = 16; 
  document.getElementById("lat").innerHTML = 13.053721679021347;
  document.getElementById("lon").innerHTML = 80.22521737216266;
  
}
  
function placeMarker(location) {
  var clickedLocation = new google.maps.LatLng(location);
  marker.setPosition(location);
}
window.onload = function(){initialize();};

</script>

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
          
          <li><a href="admin.jsp">Content Data</a></li>
          <li class="active"><a href="admin1.jsp">Location Data</a></li>
          <li><a href="home.html">SignOut</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><!--map-->
				  	<span class="style4">Find Location :</span><br />
				<table width="920" height="400" style="border:1px #666600 solid">
                <tr>
               <td align="center" width="600">
			    <div id="bd">
                 <div id="gmap"></div>
                lat:<span id="lat"></span> lon:<span id="lon"></span><br/>
                zoom level: <span id="zoom_level"></span>
                </div>
			   
			   </td>
			   </tr>
			   </table>
				  <!--map--></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          
          <div class="article">
            <h2><span>Upload Location</span> Data</h2>
            <div class="clr"></div>
            <form action="insertlocation.jsp" method="post" id="sendemail">
              <ol>
                <li>
                  <label for="name">Location Name (required)</label>
                  <input id="name" name="locationname" class="text" />
                </li>
				<li>
                  <label for="name">Title (required)</label>
                  <input id="name" name="title" class="text" />
                </li>
                <li>
                  <label for="email">Description (required)</label>
				  <textarea name="description" cols="" rows="4"></textarea>
                </li>
                <li>
                  <label for="website">Latitude</label>
                  <input id="name" name="lat" class="text" />
                </li>
				<li>
                  <label for="website">Longitude</label>
                  <input id="name" name="lon" class="text" />
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
              <li class="active"><a href="#"><img src="images/upload.png" width="245" height="400" /></a></li>
              
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