<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%

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
      <div class="hbg"><img src="images/spynb.PNG" width="923" height="250" alt="" /></div>
    </div>
    <div class="content">
      <div class="content_bg">
        <div class="mainbar">
          <div class="article">
            
            <div class="clr"></div>
            
          </div>
          <div class="article">
		  	<!--Geo-Based(Location)-->
				

			<!--Geo-Based(Location)-->
            <!--Non-Geo Based(Content)-->
				<div class="article">
            <h2><span>Non-Geo Based Search(Content)</span> </h2>
            <div class="clr"></div>
            
	<%
		
		String nchild=null;		
		
		ResultSet rs5=null;		
		
	try{		
			
			String sql6="select * from ontology where country='"+search+"' and concept='content concept' ";
			rs5=st.executeQuery(sql6);
			while(rs5.next()){
				nchild=rs5.getString("state");
				nquery.append(",");
				nquery.append(nchild);	
				
			}	
	}
	catch (Exception eq6) 
	{
		out.println(eq6.getMessage());
	}
		
	
 %>

 <%
 int count=0;
 String ntempquery[]=null;
 ntempquery=(nquery.toString()).split(",");

           
         for(int j=0;j<ntempquery.length;j++)
           				{
							ResultSet rs6=null;

							try{
					
								String sql7="select * from content where contentname='"+ntempquery[j]+"' ";
								rs6=st.executeQuery(sql7);
								while(rs6.next()){
									try {
								
											PreparedStatement ps=con.prepareStatement("INSERT INTO tempcontent VALUES(?,?,?,?,?)");
											ps.setInt(1,rs6.getInt("id"));
											ps.setString(2,rs6.getString("contentname"));
											ps.setString(3,rs6.getString("title"));	
											ps.setString(4,rs6.getString("description"));
											ps.setInt(5,count);
											
											ps.executeUpdate();
							
									} 
									catch (Exception e7) 
									{
										out.println(e7.getMessage());
									}
								}	
							}
							catch (Exception eq6) 
							{
								out.println(eq6.getMessage());
							}        
             
         }
						
						
	
 %>
 <%
 int myid=0;
for(int q=0;q<ntempquery.length;q++)
           				{
							ResultSet rs9=null;

							try{
					
								String sql9="select * from view where contentname='"+ntempquery[q]+"' and uid='"+uid+"' and concept='content' ";
								rs9=st.executeQuery(sql9);
								while(rs9.next()){
								myid=rs9.getInt("sid");
									try {
								
											PreparedStatement ps=con.prepareStatement("update tempcontent set count=? where id='"+myid+"' ");
											ps.setInt(1,rs9.getInt("count"));
											
											
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
		
	
		ResultSet rs7=null;

	try{
		
			String sql8="select * from tempcontent where id='"+temp[0]+"' ";
			rs7=st.executeQuery(sql8);
			while(rs7.next()){	%>			
					
				<div class="comment"> 
				<p>
				<img src="viewimage3.jsp?id=<%=rs7.getInt("id")%>" width="175" height="175" alt="" class="userpic" /> <br />
				Title:--<a href="contentcount.jsp?id=<%=rs7.getInt("id")%>,<%=rs7.getString("contentname")%>"><font color="#FF0000" size="+2"><%=rs7.getString("title")%></font></a></p>
				<p>Views:--<a><font color="#0000FF" size="+2"><%=rs7.getInt("count")%></font></a></p>
				<p>Description:<br /><%=rs7.getString("description")%></p>
				</div>		
			
			<%}	
	}
	catch (Exception eq8) 
		{
			out.println(eq8.getMessage());
		}
		
	
 %>
			
           

          </div>
			<!--End Non-Geo Based(Content)-->
          </div>
        </div>
        <div class="sidebar">
          <div class="gadget">
		  <!--
            <h2 class="star"><span>Location</span> Ontology</h2>
			-->
            <div class="clr"></div>
            <ul class="sb_menu">
			<!--
              <li class="active"><a href="#"><img src="images/ontology.jpg" width="245" /></a></li>
           -->
            </ul>
          </div>
          <div class="gadget">
            <h2 class="star"><span>Content Ontology</span></h2>
            <div class="clr"></div>
            <ul class="ex_menu">
              
				<li class="active"><a href="#"><img src="images/ontology1.jpg" width="245" /></a></li>	

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