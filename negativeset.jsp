<%@ page import="java.sql.*,java.lang.*,databaseconnection.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.axis.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import="org.jfree.chart.labels.*" %>
<%@ page  import="org.jfree.chart.plot.*" %>
<%@ page  import="org.jfree.chart.renderer.category.*" %>
<%@ page  import="org.jfree.chart.urls.*" %>
<%@ page  import="org.jfree.data.category.*" %>
<%@ page  import="org.jfree.data.general.*" %>

<%
int myid=0,myid1=0;
double ans1=0.0d,ans2=0.0d,ans3=0.0d,ans4=0.0d,ans5=0.0d,ans6=0.0d;

String uid=(String)session.getAttribute("uid");
String uname=(String)session.getAttribute("name");
String search=(String)session.getAttribute("search");
StringBuffer query = new  StringBuffer();
		query.append(search);
StringBuffer nquery = new  StringBuffer();
		nquery.append(search);

Connection con=databasecon.getconnection();
Statement st=con.createStatement();

String status="Negative Set";
String statusa="Positive Set";

String concepta="location";
String conceptb="content";
%>
<% 
    
        try
		{

	    String sql="delete from positivelocation";
 	    st.executeUpdate(sql);
			
		}
		catch(SQLException e1)	{ out.println("Database error"+e1.getMessage()); }


   %>
   <% 
    
        try
		{

	    String sq5="delete from positivecontent";
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
          <li class="active"><a href="positiveset.jsp">Data Set</a></li>
          
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
            <h2><span>Geo-Based(Location)</span></h2>
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
								
											PreparedStatement ps=con.prepareStatement("INSERT INTO positivelocation VALUES(?,?,?,?,?)");
											ps.setInt(1,rs2.getInt("id"));
											ps.setString(2,rs2.getString("locationname"));
											ps.setString(3,rs2.getString("title"));	
											ps.setString(4,status);
											ps.setString(5,concepta);
																						
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
 
for(int p=0;p<tempquery.length;p++)
           				{
							ResultSet rs8=null;

							try{
					
								String sql8="select * from view where contentname='"+tempquery[p]+"' and uid='"+uid+"' and concept='"+concepta+"' ";
								rs8=st.executeQuery(sql8);
								while(rs8.next()){
									try {
								
											PreparedStatement ps=con.prepareStatement("update positivelocation set status=? where id='"+rs8.getInt("sid")+"' and locationname='"+tempquery[p]+"' and concept='"+concepta+"' ");
											ps.setString(1,statusa);
											
											
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
<div class="comment">
		<table bgcolor="#00CCFF" border="2" width="500px">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Title</td>
			<td>Status</td>
		</tr>
 <%
		
	
		ResultSet rs3=null;

	try{
		
			String sql3="select * from positivelocation ";
			rs3=st.executeQuery(sql3);
			while(rs3.next()){	%>			
					
				
				<tr>
					<td><%=rs3.getInt("id")%></td>
					<td><%=rs3.getString("locationname")%></td>
					<td><%=rs3.getString("title")%></td>
					<td><%=rs3.getString("status")%></td>
				</tr>
						
			
			<%}	
	}
	catch (Exception eq3) 
		{
			out.println(eq3.getMessage());
		}
		
	
 %>
 </table>
 
 			<!--location graph-->
			<%
			Connection cons = null;
							Statement sts = null;
							ResultSet rss=null;
							
							try{
								cons=databasecon.getconnection();
								sts = cons.createStatement();
								String strs="select * from positivelocation ";
								rss=sts.executeQuery(strs);
								while(rss.next()){
									if((rss.getString("status")).equals("Positive Set")){
									ans2 +=1.0; 
									}
									else
									{
									ans3 +=1.0;
									}										
								}
								ans1=ans2+ans3;
							}
							catch(Exception e1){
								out.println(e1.getMessage());
							}
						/*	double[][] data = new double[][]{{0},{0},{0}};
			 
			data[0][0]=ans1;
			data[1][0]=ans2;
			data[2][0]=ans3;
			JFreeChart chart = null;
            BarRenderer renderer = null;
            CategoryPlot plot = null;

            final CategoryAxis categoryAxis = new CategoryAxis("");
            final ValueAxis valueAxis = new NumberAxis("Data Set");
            renderer = new BarRenderer();
	
						final CategoryDataset dataset = DatasetUtilities.createCategoryDataset(
								"", "", data);
								plot = new CategoryPlot(dataset, categoryAxis, valueAxis,
						renderer);
						plot.setOrientation(PlotOrientation.VERTICAL);
				
            
            chart = new JFreeChart("1.Total Data Set   2.Positive Set   3.Negative Set ", JFreeChart.DEFAULT_TITLE_FONT,plot, true);
            chart.setBackgroundPaint(new Color(249, 231, 236));
      
            try {
                final ChartRenderingInfo info = new ChartRenderingInfo
                (new StandardEntityCollection());
                final File file1 = new File("D:/apache-tomcat-6.0.18/webapps/PMSE/images/geo.png");
                ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
            } catch (Exception e) {
                out.println(e);
            }*/
			%>
			<!--end graph-->
			<p><img src="images/geo.png" /></p>
 </div>
			<!--Geo-Based(Location)-->
            <!--Non-Geo Based(Content)-->
				<div class="article">
            <h2><span>Non-Geo Based(Content)</span> </h2>
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
								
											PreparedStatement ps=con.prepareStatement("INSERT INTO positivecontent VALUES(?,?,?,?,?)");
											ps.setInt(1,rs6.getInt("id"));
											ps.setString(2,rs6.getString("contentname"));
											ps.setString(3,rs6.getString("title"));	
											ps.setString(4,status);
											ps.setString(5,conceptb);
											
											
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
  
for(int q=0;q<ntempquery.length;q++)
           				{
							ResultSet rs9=null;

							try{
					
								String sql9="select * from view where contentname='"+ntempquery[q]+"' and uid='"+uid+"' and concept='"+conceptb+"' ";
								rs9=st.executeQuery(sql9);
								while(rs9.next()){
								myid1=rs9.getInt("sid");
									try {
								
											PreparedStatement ps=con.prepareStatement("update positivecontent set status=? where id='"+rs9.getInt("sid")+"' and concept='"+conceptb+"' ");
											ps.setString(1,statusa);
											
											
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
<div class="comment">
		<table bgcolor="#00FFCC" border="2" width="500px">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Title</td>
			<td>Status</td>
		</tr>
 <%
		
	
		ResultSet rs7=null;

	try{
		
			String sql8="select * from positivecontent ";
			rs7=st.executeQuery(sql8);
			while(rs7.next()){	%>			
					
				<tr>
					<td><%=rs7.getInt("id")%></td>
					<td><%=rs7.getString("contentname")%></td>
					<td><%=rs7.getString("title")%></td>
					<td><%=rs7.getString("status")%></td>
				</tr>		
			
			<%}	
	}
	catch (Exception eq8) 
		{
			out.println(eq8.getMessage());
		}
		
	
 %>
 
 

 </table>
 <%

							
							//conteny
							Connection conc = null;
							Statement stc = null;
							ResultSet rsc=null;
							
							try{
								conc=databasecon.getconnection();
								stc = conc.createStatement();
								String strc="select * from positivecontent ";
								rsc=stc.executeQuery(strc);
								while(rsc.next()){
									if((rsc.getString("status")).equals("Positive Set")){
									ans5 =ans5+1.0; 
									}
									else
									{
									ans6 =ans6+1.0;
									}										
								}
								ans4=ans5+ans6;
							}
							catch(Exception ec){
								out.println(ec.getMessage());
							}
							
%>
<%
			 
            final double[][] data1 = new double[][]{{0},{0},{0}};
			data1[0][0]=(double)ans4;
			data1[1][0]=(double)ans5;
			data1[2][0]=(double)ans6;
			          
			
			//content graph
			JFreeChart chart1 = null;
            BarRenderer renderer1 = null;
            CategoryPlot plot1 = null;

            final CategoryAxis categoryAxis1 = new CategoryAxis("Content Based Data Set");
            final ValueAxis valueAxis1 = new NumberAxis("Data Set");
            renderer1 = new BarRenderer();
	
						final CategoryDataset dataset1 = DatasetUtilities.createCategoryDataset(
								"","", data1);
								plot1 = new CategoryPlot(dataset1, categoryAxis1, valueAxis1,
						renderer1);
						plot1.setOrientation(PlotOrientation.VERTICAL);
				
            
            chart1 = new JFreeChart("", JFreeChart.DEFAULT_TITLE_FONT,plot1, true);
            chart1.setBackgroundPaint(new Color(249, 231, 236));
      
            try {
                final ChartRenderingInfo info1 = new ChartRenderingInfo
                (new StandardEntityCollection());
                final File file2 = new File("D:/apache-tomcat-6.0.18/webapps/PMSE/images/cont.png");
                ChartUtilities.saveChartAsPNG(file2, chart1, 600, 400, info1);
            } catch (Exception e1) {
                out.println(e1);
            }
%>
			<p><img src="images/cont.png" /></p>
 </div>
           

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