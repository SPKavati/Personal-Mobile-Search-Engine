<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String community=request.getParameter("community");
		String uid=(String)session.getAttribute("uid");
		Statement st = null;
		ResultSet rs1=null;
	
	try{		
			
			Connection con=databasecon.getconnection();
			st=con.createStatement();
			String sql1="select * from addcommunity where uid='"+uid+"' and communityname='"+community+"'";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				int count1=0;
				count1=rs1.getInt("count")+1;
				
				try{
				Connection con2=databasecon.getconnection();
				PreparedStatement ps=con2.prepareStatement("Update addcommunity set count=? where uid='"+uid+"' and communityname='"+community+"'");
				ps.setInt(1,count1);
				int x=ps.executeUpdate();
				response.sendRedirect("viewcommunity.jsp?community="+community+"");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}
			else{
				out.println("Join to Community");
			}	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
