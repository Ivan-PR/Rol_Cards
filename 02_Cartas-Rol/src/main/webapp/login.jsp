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


String userid=request.getParameter("usr"); 
session.putValue("usr",userid); 
String pass=request.getParameter("password"); 



Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(url, user, password);
statement = conn.createStatement();
rs=statement.executeQuery("select * from usuari where nom='"+userid+"' and password='"+pass+"'");

try{
	rs.next();
	        if(rs.getString("password").equals(pass)&&rs.getString("nom").equals(userid)) 
			{ 
	        	String redirectURL = "CartaRol.jsp?pagina=0&user="+rs.getString("id_usuari");
	            response.sendRedirect(redirectURL);
			} 
		else{
			 out.println("Invalid password or username.");
		    }
}
catch (Exception e) {
e.printStackTrace();
}
%>