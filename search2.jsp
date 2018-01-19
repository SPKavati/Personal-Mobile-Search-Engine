<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<%
	//pmse
		String uid = (String)session.getAttribute("uid");
		String name = (String)session.getAttribute("name");
		String search = (String)session.getAttribute("search");
		
		java.util.Date now = new java.util.Date();
		String date=now.toString();
	 	String DATE_FORMAT = "dd-MM-yyyy";
	 	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     	String strDateNew = sdf.format(now) ;
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0,weight=0;
		
	try{
		
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select max(id) from search";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1; 
		
		try {		
				
			Connection con1=databasecon.getconnection(); 

			PreparedStatement ps=con1.prepareStatement("INSERT INTO search VALUES(?,?,?,?,?,?,?)");
				ps.setInt(1,id);
               	ps.setString(2,uid);
				ps.setString(3,name);	
       			ps.setString(4,search);
				ps.setInt(5,weight);
				ps.setInt(6,weight);
			    ps.setString(7,strDateNew);
			    	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("searchresult.jsp?message=successfully registered");
			}
			else
			{
				response.sendRedirect("searchresult.jsp?message=fail");
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