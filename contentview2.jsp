<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<%
		//pmse

		String uid = (String)session.getAttribute("uid");
		String name = (String)session.getAttribute("name");
		String search = (String)session.getAttribute("search");
		
		Statement st = null;
		ResultSet rs1=null;
		
	
	try{
		
			Connection	con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from search where uid='"+uid+"' and keyword='"+search+"' ";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				int count2=0;
				count2=rs1.getInt("contentweight")+1;				
				try{
				Connection	con2=databasecon.getconnection();
				PreparedStatement ps=con.prepareStatement("Update search set contentweight=? where uid='"+uid+"' and keyword='"+search+"' ");
				ps.setInt(1,count2);
				int x=ps.executeUpdate();
				
				response.sendRedirect("viewcontent.jsp?message=success");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}
			else
				response.sendRedirect("viewcontent.jsp?message=success");	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
