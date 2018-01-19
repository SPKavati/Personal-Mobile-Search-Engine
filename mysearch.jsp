<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%


String search=request.getParameter("search");
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
											ps.setInt(7,rs2.getInt("count"));
											
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
		
			String sql3="select * from templocation order by count DESC ";
			rs3=st.executeQuery(sql3);
			while(rs3.next()){	%>			
					
				<div class="comment">
				<p>Title:--<a href="#"><font color="#FF0000" size="+2"><%=rs3.getString("title")%></font></a></p>
				<p>Views:--<a><font color="#0000FF" size="+2"><%=rs3.getInt("count")%></font></a></p>
				<p>Description:<br /><%=rs3.getString("description")%></p>
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
											ps.setInt(5,rs6.getInt("count"));
											
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
		
	
		ResultSet rs7=null;

	try{
		
			String sql8="select * from tempcontent order by count DESC ";
			rs7=st.executeQuery(sql8);
			while(rs7.next()){	%>			
					
				<div class="comment"> 
				<p>Title:--<a href="#"><font color="#FF0000" size="+2"><%=rs7.getString("title")%></font></a></p>
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
            <h2 class="star"><span>Locatopn</span> Ontology</h2>
            <div class="clr"></div>
            <ul class="sb_menu">
              <li class="active"><a href="#"><img src="images/ontology.jpg" width="245" /></a></li>
           
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