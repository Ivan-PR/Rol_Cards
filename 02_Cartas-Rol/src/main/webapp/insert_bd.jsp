<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cartas Rol</title>
		
	</head>
<body>
	<%// variables per fer la connexio:
	String user="root";
	String password="123456";
	String host="localhost";
	String db = "db_cartas_rol";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	
	
	// recollim valors formulari:
	String id_user = request.getParameter("user");
	String nom=request.getParameter("nom");
	String race=request.getParameter("raza");
	String picture=request.getParameter("img");
	String fue=request.getParameter("fue");
	int nfue=Integer.parseInt(fue);
	String des=request.getParameter("des");
	int ndes=Integer.parseInt(des);
	String con=request.getParameter("con");
	int ncon=Integer.parseInt(con);
	String intt=request.getParameter("int");
	int nint=Integer.parseInt(intt);
	String sab=request.getParameter("sab");
	int nsab=Integer.parseInt(sab);
	String car=request.getParameter("car");
	int ncar=Integer.parseInt(car);
	String pv=request.getParameter("pv");
	int npv=Integer.parseInt(pv);
	String pm=request.getParameter("pm");
	int npm=Integer.parseInt(pm);

try{

	Class.forName("com.mysql.jdbc.Driver").newInstance ();
		conn = DriverManager.getConnection(url, user, password);
		statement = conn.createStatement();
		//inmediatamente hacemos un insert amb les dades
		//creamos la consulta
int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta,id_user)values('"+nom+"','"+picture+"','"+race+"',"+nfue+","+ndes+","+ncon+","+nint+","+sab+","+car+","+pv+","+pm+","+id_user+")");
out.println("Data is successfully inserted!");
}catch(SQLException error) {
out.print("Error de Conexión : "+error.toString());
} %>