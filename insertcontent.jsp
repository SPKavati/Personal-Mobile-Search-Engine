<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<html>
<head>
<title>PMSE</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

//Multipart
	ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String contentname=null,description=null,image=null,title=null;
		
		java.util.Date now = new java.util.Date();
		String date=now.toString();
	 	String DATE_FORMAT = "dd-MM-yyyy";
	 	SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     	String strDateNew = sdf.format(now) ;
 
		File file1 = null;
		MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				
				if(paramname.equalsIgnoreCase("contentname"))
				{
					contentname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("description"))
				{
					description=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("title"))
				{
					title=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				}
					
			int f = 0,count=0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
//Multipart
		Statement st1 = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con1=databasecon.getconnection();
			st1=con1.createStatement();
			String sql1="select max(id) from content";
			rs1=st1.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;	
		
		try {		
			
			
			PreparedStatement ps=con1.prepareStatement("INSERT INTO content VALUES(?,?,?,?,?,?)");
				ps.setString(1,image);
               	ps.setInt(2,id);
				ps.setString(3,contentname);
				ps.setString(4,title);	
       			ps.setString(5,description);
       			ps.setInt(6,count);
			    			    													
				
       if(f == 0)
			ps.setObject(1,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(1,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("admin.jsp?message=successfully Uploaded Content Data");
			}
			else
			{
				response.sendRedirect("admin.jsp?message=fail");
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
</body>
</html>


