<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>

<%
		//pmse
		int count1=0,count2=0;
		String search = request.getParameter("search");
		session.setAttribute("search",search);
		String uid = (String)session.getAttribute("uid");
		Statement st = null;
		ResultSet rs1=null;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
	
	try{
		
			Connection	con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from search where uid='"+uid+"' and keyword='"+search+"'";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				
				count2=rs1.getInt("locationweight")+1;
				count1=rs1.getInt("contentweight")+1;				
				try{
				Connection	con2=databasecon.getconnection();
				PreparedStatement ps=con.prepareStatement("Update search set date=? where uid='"+uid+"' and keyword='"+search+"'");
				ps.setString(1,strDateNew);
				int x=ps.executeUpdate();
					if(count1>count2){
						response.sendRedirect("searchcontent.jsp?message=success");
					}
					else if(count1<count2){
						response.sendRedirect("searchlocation.jsp?message=success");
					}
					else{
						response.sendRedirect("searchresult.jsp?message=success");
					}
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}
			else
				response.sendRedirect("search2.jsp?message=success");	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
