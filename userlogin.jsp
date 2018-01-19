<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
<head>
<title>Presence Services</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String name = request.getParameter("name");
String password = request.getParameter("password");
if(name.equals("admin") && password.equals("admin")){
	response.sendRedirect("admin.jsp");
}
session.setAttribute("name",name);
session.setAttribute("password",password);
String status="Allow";

try{
	Connection con=databasecon.getconnection();
	st = con.createStatement();
	String qry ="select * from profile where name='"+name+"' AND password='"+password+"' "; 
	rs = st.executeQuery(qry);

	if(!rs.next()){
		out.println("Enter correct username, password ");
		%>
				<html>
					<body><br><a href="home.html">Go to home</a></body>
				</html>
		<%	
	}
	else
		session.setAttribute("uid",Integer.toString(rs.getInt("id")));
		session.setAttribute("mylocation",rs.getString("location"));
		session.setAttribute("mymobile",rs.getString("mobile"));
		
			response.sendRedirect("userpage.jsp");
		
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


