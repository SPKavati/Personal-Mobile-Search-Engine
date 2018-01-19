<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%

		
		Statement st = null;
		ResultSet rs1=null;
		int id=0,count=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from location";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				session.setAttribute("id",id);

		String locationname=null,description=null,lat=null,lon=null,title=null;
		int report=0;
		int upload=0;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		
		try {		
				
					locationname=request.getParameter("locationname");				
					description=request.getParameter("description");					
					lat=request.getParameter("lat");
					lon=request.getParameter("lon");
					title=request.getParameter("title");
				
					Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO location VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,locationname);
				ps.setString(3,title);
				ps.setString(4,description);	
       			ps.setString(5,lat);
				ps.setString(6,lon);
				ps.setInt(7,count);
				
			    	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("admin1.jsp?message=successfully Uploaded Location Data");
			}
			else
			{
				response.sendRedirect("admin1.jsp?message=fail");
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