<%@ page import="java.util.Arrays,java.util.List,java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//variables per fer la connexio:
	String user="root";
	String password="Myfunshop942";
	String host="localhost";
	String db = "db_cartas_rol";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	String userId = request.getParameter("user");
	String oPass = request.getParameter("act_pass");
	String nPass = request.getParameter("newpass");
	
	Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
statement = conn.createStatement();
rs=statement.executeQuery("select * from usuari where id_usuari='"+userId+"' and password='"+oPass+"'");
%>
<!DOCTYPE html>
<html>
    <head>
    	<link rel="stylesheet" href="css/style.css" type="text/css" />
        <meta charset="UTF-8">
        <title>Cartas Rol</title>
    </head>
    <body>
    <div class="accedir container"><br><br>

<%
try{
	rs.next();
if (rs.getString("password").equals(nPass)) {
	out.println("<h1>La contrasenya es la mateixa.</h1>");
	}

else {
	int i=statement.executeUpdate("update usuari set password="+nPass+" where id_usuari="+userId);
		
 out.println("<h1>La contrasenya s'ha canviat correctament.</h1>");
	}
}
catch (Exception e) {
	out.print("<h1>La contrasenya actual es erronea.</h1>");
	e.printStackTrace();
}

%><br><br>
<div class="botons">
    	<button type="button" onclick="location.href='menu.jsp?pagina=0&user=<%out.print(userId);%>'">Menu Principal</button>
    </div>
    </div>
    </body>
</html>










