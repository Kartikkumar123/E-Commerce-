<%@ page import =" java.util.*" %>
<%@ page import ="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>This is Signup page</title>
</head>
<body>
<h4>Insert Data into Database</h4>
<% 
Connection con = null;
Statement stmt = null;

String Name = request.getParameter("name");
String LastName = request.getParameter("lname");
String Email = request.getParameter("email");
String Password = request.getParameter("pass");
String Cpassword = request.getParameter("cpass");
String Phone = request.getParameter("phone");
String Country = request.getParameter("city");

try{
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/web","root","813091");
	if(con !=null){
		stmt = con.createStatement();
		
		String rsql = "insert into login values('"+Name+"','"+LastName+"','"+Email+"','"+Password+"','"+Cpassword+"',"+Phone+",'"+Country+"')"; 
		stmt.executeUpdate(rsql);
		//out.println("Data Stored in Database Succesfully");
		response.sendRedirect("thanks.jsp");  
	}%>
	
	
	
	<% if(con == null){
		con.close();
	}
}
	catch(SQLException se){
		out.println("SQL:"+se.getMessage());}
	
		catch(Exception e){ 
	    out.print("Exception:"+e.getMessage());}
	

%>
</body>
</html>