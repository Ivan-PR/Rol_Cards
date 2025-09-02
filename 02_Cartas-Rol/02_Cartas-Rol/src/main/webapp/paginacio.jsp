<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="US-ASCII">
<title>Cartas Rol</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<div id="container2">
		<h1 class="titol">Les meves cartes</h1>
		<ul class="llista">
			<li><a href="index.html">Inici</a></li>
			<li><a href="CartaRol.jsp">Treure cartes</a></li>
		</ul>
		<br> <br>
		<label class="filtre" for="raza">Filtrar per raza: 
		<select class="sfiltre" name="raza" id="raza" onchange="filtre(s)">
				<option value="ALL" onclick='filtre(this.parentElement.value);'>Totes</option>
				<option value="Elfs" onclick='filtre(this.parentElement.value);'>Elfs</option>
				<option value="Nans" onclick='filtre(this.parentElement.value);'>Nans</option>
				<option value="Gnom" onclick='filtre(this.parentElement.value);'>Gnom</option>
				<option value="Mitjans" onclick='filtre(this.parentElement.value);'>Mitjans</option>
				<option value="Semi-Orc" onclick='filtre(this.parentElement.value);'>Semi-Orc</option>
				<option value="humans" onclick='filtre(this.parentElement.value);'>humans</option>
		</select>
		</label> <br> <br>
		<%
		String raza_seleccionada = request.getParameter("raza");
		String pag = request.getParameter("pagina");

		//  variables per fer la connexio:
		String user = "root";
		String password = "123456";
		String host = "localhost";
		String db = "db_cartas_rol";
		String url = "jdbc:mysql://" + host + "/" + db;
		Connection conn = null;
		Statement statement = null;
		Statement num_registres = null;
		ResultSet rs = null;
		ResultSet num_reg = null;
		int inicio;
		%>
		<%
		//Limito la busqueda
		int TAMANO_PAGINA = 4;
		%>
		<%
		//Limito la busqueda
		String visualitzar = request.getParameter("vis");
		TAMANO_PAGINA = Integer.parseInt(visualitzar);
		%>
		<label class="filtre" for="vis">Resultats per pagina: 
		<select	class="sfiltre" name="vis" id="vis" onchange="visual(p)">
				<option value="4" onclick='visual(this.parentElement.value);'>4</option>
				<option value="8" onclick='visual(this.parentElement.value);'>8</option>
				<option value="16" onclick='visual(this.parentElement.value);'>16</option>
				<option value="20" onclick='visual(this.parentElement.value);'>20</option>
		</select></label> <br> <br>
		
		<script>
		function visual(p) {
			let num = p;
			window.location.href = "paginacio.jsp?pagina=0&raza=" + valor+ "&vis=" +num;
			
			}
		function filtre(s) {
			let valor = s;
			window.location.href = "paginacio.jsp?pagina=0&raza=" + valor+ "&vis=" +<%out.print(TAMANO_PAGINA);%>;
			
			}
		</script>
		

		<%
		//examino la página a mostrar y el inicio del registro a mostrar
		int pagina = Integer.parseInt(pag);
		if (pagina == 0) {
			inicio = 0;
			pagina = 1;
		} else {
			inicio = (pagina - 1) * TAMANO_PAGINA;
		}

		/**
		//miro a ver el número total de campos que hay en la tabla con esa búsqueda
		**/
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, user, password);
		num_registres = conn.createStatement();
		//inmediatamente hacemos una consulta sencilla
		//creamos la consulta

		if (!raza_seleccionada.equals("ALL")) {
			num_reg = num_registres.executeQuery("SELECT * FROM Carta where RACE_carta='" + raza_seleccionada + "'");
		} else {
			num_reg = num_registres.executeQuery("SELECT * FROM Carta");
		}

		int num_total_registros = 0;
		while (num_reg.next()) {
			num_total_registros++;
		}

		//calculo el total de páginas
		int total_paginas = (int) Math.ceil(((double) num_total_registros / TAMANO_PAGINA));

		//pongo el número de registros total, el tamaño de página y la página que se muestra
		%>
		<p class="para">Nombre de cartes en possessió: <%out.print(num_total_registros);%></p>
		<br>
		<p class="para">Mostrant la pàgina <%out.print(pagina);%> de <%out.print(total_paginas);%></p>
		<br>
		<p class="pagi">
			<%
			if (total_paginas > 1) {
				for (int i = 1; i <= total_paginas; i++) {
					if (pagina == i)
				//si muestro el índice de la página actual, no coloco enlace
				out.print(pagina);

					else
				//si el índice no corresponde con la página mostrada actualmente, coloco el enlace para ir a esa página
				out.print(" <a href=paginacio.jsp?pagina=" + i + "&raza=" + raza_seleccionada + "&vis=" + TAMANO_PAGINA + ">" + i + "</a> ");

				}
			}
			out.print("<br><br>");
			%>
		</p>
	</div>

</body>

<%
try {

	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, user, password);
	statement = conn.createStatement();
	//inmediatamente hacemos una consulta sencilla
	//creamos la consulta
	String sentence;

	if (!raza_seleccionada.equals("ALL")) {
		sentence = "SELECT * from Carta where RACE_carta='" + raza_seleccionada + "' limit " + inicio + ","
		+ TAMANO_PAGINA;
	} else {
		sentence = "SELECT * from Carta limit " + inicio + "," + TAMANO_PAGINA;
	}

	rs = statement.executeQuery(sentence);
	//leemos la consulta
	while (rs.next()) {
%>
<div class="presentacio">
	<table>
		<caption>
			<h2><%out.print(rs.getString("NOM_carta"));%></h2>
			<br>
			<h2><%out.print(rs.getString("RACE_carta"));%></h2>
		</caption>
		<tr>
			<td rowspan="9" width="100px" height="300px"><img src="img/<%out.print(rs.getString("PIC_carta"));%>" alt="<%out.print(rs.getString("PIC_carta"));%>" height="auto" width="110px" /></td>
			<th>Carac.</th>
			<th>Valor Final</th>
		</tr>
		<tr>
			<td><i>FUE:</i></td>
			<td><%out.print(rs.getString("FUE_carta"));%></td>
		</tr>
		<tr>
			<td><i>DES:</i></td>
			<td><%out.print(rs.getString("DES_carta"));%></td>
		</tr>
		<tr>
			<td><i>CON:</i></td>
			<td><%out.print(rs.getString("CON_carta"));%></td>
		</tr>
		<tr>
			<td><i>INT:</i></td>
			<td><%out.print(rs.getString("INT_carta"));%></td>
		</tr>
		<tr>
			<td><i>SAB:</i></td>
			<td><%out.print(rs.getString("SAB_carta"));%></td>
		</tr>
		<tr>
			<td><i>CAR:</i></td>
			<td><%out.print(rs.getString("CAR_carta"));%></td>
		</tr>
		<tr>
			<td><i>P.V </i></td>
			<td style="text-align: center"><span> <%out.print(rs.getString("PV_carta"));%></span></td>
		</tr>
		<tr>
			<td><i>P.M </i></td>
			<td style="text-align: center"><span> <%out.print(rs.getString("PM_carta"));%></span></td>
		</tr>
	</table>
</div>

</html>

<%
}
//cerramos la conexión
rs.close();
} catch (SQLException error) {
out.print("Error de Conexión : " + error.toString());
}
%>
