<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cartas Rol</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<%// variables per fer la connexio:
	String user="root";
	String password="Myfunshop942";
	String host="localhost";
	String db = "db_cartas_rol";
	String url = "jdbc:mysql://"+host+"/"+db;
	Connection conn = null;
	Statement statement = null;
	ResultSet rs = null;
	%>
	<div id="container">
		<%
		String nom_carta = request.getParameter("nom");
		String Vfue = request.getParameter("fue");
		String Vdes = request.getParameter("des");
		String Vcon = request.getParameter("con");
		String Vint = request.getParameter("int");
		String Vsab = request.getParameter("sab");
		String Vcar = request.getParameter("car");
		String Vpv = request.getParameter("pv");
		String Vpm = request.getParameter("pm");
		String Rza = request.getParameter("raza");
		String picture = request.getParameter("img");
		
		// recollim valors formulari:
		
		int nfue=Integer.parseInt(Vfue);
		int ndes=Integer.parseInt(Vdes);
		int ncon=Integer.parseInt(Vcon);
		int nint=Integer.parseInt(Vint);
		int nsab=Integer.parseInt(Vsab);
		int ncar=Integer.parseInt(Vcar);
		int npv=Integer.parseInt(Vpv);
		int npm=Integer.parseInt(Vpm);

	try{

		Class.forName("com.mysql.jdbc.Driver").newInstance ();
			conn = DriverManager.getConnection(url, user, password);
			statement = conn.createStatement();
			//inmediatamente hacemos un insert amb les dades
			//creamos la consulta
	int i=statement.executeUpdate("insert into Carta(NOM_carta,PIC_carta,RACE_carta,FUE_carta,DES_carta,CON_carta,INT_carta,SAB_carta,CAR_carta,PV_carta,PM_carta)values('"+nom_carta+"','"+picture+"','"+Rza+"',"+nfue+","+ndes+","+ncon+","+nint+","+nsab+","+ncar+","+npv+","+npm+")");
	%>
	<h2 class="confirm"><img src="img/ok.png" title="OK" alt="OK" width="25" height="25">La carta s'ha desat correctament!</h2>
	<%
	}catch(SQLException error) {
	out.print("Error de Conexió : "+error.toString());
	} %>
		<table>
			<caption>
				<h2><%out.print(nom_carta);%></h2><br>
				<h2><%out.print(Rza);%></h2>
			</caption>
			<tr>
				<td rowspan="9" width="100px" height="300px"><img src="img/<%out.print(picture);%>" alt="<%out.print(picture);%>" height="auto" width="110px" /></td>
				<th>Carac.</th>
				<th>Valor Final</th>
			</tr>
			<tr>
				<td><i>FUE:</i></td>
				<td><%out.print(Vfue);%></td>
			</tr>
			<tr>
				<td><i>DES:</i></td>
				<td><%out.print(Vdes);%></td>
			</tr>
			<tr>
				<td><i>CON:</i></td>
				<td><%out.print(Vcon);%></td>
			</tr>
			<tr>
				<td><i>INT:</i></td>
				<td><%out.print(Vint);%></td>
			</tr>
			<tr>
				<td><i>SAB:</i></td>
				<td><%out.print(Vsab);%></td>
			</tr>
			<tr>
				<td><i>CAR:</i></td>
				<td><%out.print(Vcar);%></td>
			</tr>
			<tr>
				<td><i>P.V </i></td>
				<td style="text-align: center"><span><%out.print(Vpv);%></span></td>
			</tr>
			<tr>
				<td><i>P.M </i></td>
				<td style="text-align: center"><span><%out.print(Vpm);%></span></td>
			</tr>
		</table>
		<div class="crt">
		<button onclick="location.href='CartaRol.jsp?pagina=0'">Treure nova carta</button>
		
		<button onclick="location.href='paginacio.jsp?pagina=0&raza=ALL&vis=4'">Visualitzar cartes</button></div>
		
	</div>
</body>
</html>