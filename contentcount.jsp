<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<%
		//pmse

		
		String uid = (String)session.getAttribute("uid");
		String uname=(String)session.getAttribute("name");
		String search = (String)session.getAttribute("search");
		String id=request.getParameter("id");
		session.setAttribute("id",id);
		String temp[]=null;
		temp=id.split(",");
		Statement st = null;
		ResultSet rs1=null;
		
	
	try{
		
			Connection	con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from view where uid='"+uid+"' and sid='"+temp[0]+"' and contentname='"+temp[1]+"'";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				int count2=0;
				count2=rs1.getInt("count")+1;				
				try{
				Connection	con2=databasecon.getconnection();
				PreparedStatement ps=con.prepareStatement("Update view set count=? where uid='"+uid+"' and sid='"+temp[0]+"' and contentname='"+temp[1]+"'");
				ps.setInt(1,count2);
				int x=ps.executeUpdate();
				
				response.sendRedirect("contentview1.jsp?message=success");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}
			else
				response.sendRedirect("contentview.jsp?sid="+id+"");	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
