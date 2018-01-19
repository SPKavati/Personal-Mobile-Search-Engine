<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from ontology";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				session.setAttribute("id",id);

		String country=null,state=null,city=null,status="location concept";
		int report=0;
		int upload=0;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		
		try {		
				
					country=request.getParameter("country");
				
					state=request.getParameter("state");
				
					city=request.getParameter("city");
									
					Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO ontology VALUES(?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,country);
				ps.setString(3,state);	
       			ps.setString(4,city);
				ps.setString(5,status);
			    	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("locationontology.jsp?message=successfully registered");
			}
			else
			{
				response.sendRedirect("locationontology.jsp?message=fail");
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