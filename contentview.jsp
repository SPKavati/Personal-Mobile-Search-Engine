<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
	//pmse
		String uid = (String)session.getAttribute("uid");
		String name = (String)session.getAttribute("name");
		String search = (String)session.getAttribute("search");
		String concept="content";
		
		String sid=request.getParameter("sid");
		
		String temp[]=null;
		temp=sid.split(",");
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0,weight=1;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from view";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1; 
		
		try {		
				
			Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO view VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,uid);
				ps.setString(3,name);	
       			ps.setString(4,temp[0]);
				ps.setString(5,temp[1]);
				ps.setString(6,concept);
				ps.setInt(7,weight);
			    
			    	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("contentview1.jsp?message=successfully registered");
			}
			else
			{
				response.sendRedirect("contentview1.jsp?message=fail");
			}
				
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
		
	
 %>