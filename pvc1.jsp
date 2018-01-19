<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String community=request.getParameter("community");
		
		Statement st = null;
		ResultSet rs1=null;
	
	try{
		
			
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from community where communityname='"+community+"'";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				int count2=0;
				count2=rs1.getInt("count")+1;
				
				try{
				Connection con2=databasecon.getconnection();
				PreparedStatement ps=con2.prepareStatement("Update community set count=? where communityname='"+community+"'");
				ps.setInt(1,count2);
				int x=ps.executeUpdate();
				response.sendRedirect("pvc2.jsp?community="+community+"");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
