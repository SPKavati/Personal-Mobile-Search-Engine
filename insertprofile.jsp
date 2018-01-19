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
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				session.setAttribute("id",id);

		String name=null,location=null,gender=null,email=null,password=null,phone=null,image=null,mobile=null;
		int report=0;
		int upload=0;
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		
		try {		
				
					name=request.getParameter("name");
				
					email=request.getParameter("email");
				
					password=request.getParameter("password");
					
					mobile=request.getParameter("mobile");
					location=request.getParameter("location");
				
					Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,name);
				ps.setString(3,email);	
       			ps.setString(4,password);
				ps.setString(5,mobile);
				ps.setString(6,location);
			    ps.setString(7,strDateNew);
			    	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("home.html?message=successfully registered");
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
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