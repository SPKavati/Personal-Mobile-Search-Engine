<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
int count=0;
String id=(String)session.getAttribute("id");
		String temp[]=null;
		temp=id.split(",");

String uid=(String)session.getAttribute("uid");
String uname=(String)session.getAttribute("name");
String search=(String)session.getAttribute("search");
StringBuffer query = new  StringBuffer();
		query.append(search);
StringBuffer nquery = new  StringBuffer();
		nquery.append(search);

Connection con=databasecon.getconnection();
Statement st=con.createStatement();
%>
<% 
    
        try
		{

	    String sql="delete from templocation";
 	    st.executeUpdate(sql);
			
		}
		catch(SQLException e1)	{ out.println("Database error"+e1.getMessage()); }


   %>
   <% 
    
        try
		{

	    String sq5="delete from tempcontent";
 	    st.executeUpdate(sq5);
			
		}
		catch(SQLException e1)	{ out.println("Database error"+e1.getMessage()); }


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

<style type="text/css">
body {
    margin: 0;
    padding: 0;
    font-family: "Gill sans", sans-serif;
    
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
var lati=document.ff.lat.value;
var longi=document.ff.lon.value;
  var myLatlng = new google.maps.LatLng(lati,longi);
  
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
  
 
}
  
function placeMarker(location) {
  var clickedLocation = new google.maps.LatLng(location);
  marker.setPosition(location);
}


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
			<li><a><%=session.getAttribute("mymobile")%></a></li>
          <li><a href="userpage.jsp">Personal Search</a></li>
          <li><a href="positiveset.jsp">Data Set</a></li>
          
          <li><a href="home.html">SignOut</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="hbg"><!--map-->
				  	<span class="style4">View Location :</span><br />
				<table width="920" height="450" style="border:1px #666600 solid">
                <tr>
               <td align="center" width="900" height="425">
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
            <h2><span>Geo-Based Search(Location)</span></h2>
            <div class="clr"></div>
            
          </div>
          <div class="article">
		  	<!--Geo-Based(Location)-->
				
<%
		
		String child=null;
				
		ResultSet rs1=null;		
		
	try{
		
			
			
			String sql1="select * from ontology where country='"+search+"' and concept='location concept' ";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				child=rs1.getString("state");
				query.append(",");
				query.append(child);	
				
			}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
		
	
 %>

 <%
 String tempquery[]=null;
 tempquery=(query.toString()).split(",");

           
         for(int i=0;i<tempquery.length;i++)
           				{
							ResultSet rs2=null;

							try{
					
								String sql2="select * from location where locationname='"+tempquery[i]+"' ";
								rs2=st.executeQuery(sql2);
								while(rs2.next()){
									try {
								
											PreparedStatement ps=con.prepareStatement("INSERT INTO templocation VALUES(?,?,?,?,?,?,?)");
											ps.setInt(1,rs2.getInt("id"));
											ps.setString(2,rs2.getString("locationname"));
											ps.setString(3,rs2.getString("title"));	
											ps.setString(4,rs2.getString("description"));
											ps.setString(5,rs2.getString("latitude"));
											ps.setString(6,rs2.getString("longitude"));
											ps.setInt(7,count);
											
											ps.executeUpdate();
							
									} 
									catch (Exception e) 
									{
										out.println(e.getMessage());
									}
								}	
							}
							catch (Exception eq) 
							{
								out.println(eq.getMessage());
							}        
             
         }
						
						
	
 %>
 <%
 int myid=0;
for(int p=0;p<tempquery.length;p++)
           				{
							ResultSet rs8=null;

							try{
					
								String sql8="select * from view where contentname='"+tempquery[p]+"' and uid='"+uid+"' and concept='location' ";
								rs8=st.executeQuery(sql8);
								while(rs8.next()){
								myid=rs8.getInt("sid");
									try {
								
											PreparedStatement ps=con.prepareStatement("update templocation set count=? where id='"+myid+"' ");
											ps.setInt(1,rs8.getInt("count"));
											
											
											ps.executeUpdate();
							
									} 
									catch (Exception e) 
									{
										out.println(e.getMessage());
									}
								}	
							}
							catch (Exception eq) 
							{
								out.println(eq.getMessage());
							}        
             
 }
%>
 <%
		
	
		ResultSet rs3=null;

	try{
		
			String sql3="select * from templocation where id='"+temp[0]+"' ";
			rs3=st.executeQuery(sql3);
			while(rs3.next()){	%>			
					
				<div class="comment">
				<p>Title:--<a href="locationcount.jsp?id=<%=rs3.getInt("id")%>,<%=rs3.getString("locationname")%>"><font color="#FF0000" size="+2"><%=rs3.getString("title")%></font></a></p>
				<p>Views:--<a><font color="#0000FF" size="+2"><%=rs3.getInt("count")%></font></a></p>
				<p>Description:&nbsp;&nbsp;<%=rs3.getString("description")%></p>
				<form name="ff">
												<p>Latitude:<input type="text" name="lat" value="<%=rs3.getString("latitude")%>" disabled="disabled"></p>
												<p>Longitude:<input type="text" name="lon" value="<%=rs3.getString("longitude")%>" disabled="disabled"></p>
				</form>
				<p><a onClick="initialize()"><font color="#FF0000" size="+1">Click here Find Location</font></a></p>
				</div>		
			
			<%}	
	}
	catch (Exception eq3) 
		{
			out.println(eq3.getMessage());
		}
		
	
 %>
			<!--Geo-Based(Location)-->
            <!--Non-Geo Based(Content)-->
				<div class="article">
            
            <div class="clr"></div>
            
	
			
           

          </div>
			<!--End Non-Geo Based(Content)-->
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
            <h2 class="star"><span>Location</span> Ontology</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#"><img src="images/ontology.jpg" width="245" height="350px" /></a></li>
           
            </ul>
          </div>
          <div class="gadget">
		  <!--
            <h2 class="star"><span>Content Ontology</span></h2>
			-->
            <div class="clr"></div>
            <ul class="ex_menu">
              <!--
				<li class="active"><a href="#"><img src="images/ontology1.jpg" width="245" /></a></li>	
				-->
            </ul>
          </div>
       
        </div>
        <div class="clr"></div>
      </div>
    </div>
  </div>
  <div class="fbg">
    
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