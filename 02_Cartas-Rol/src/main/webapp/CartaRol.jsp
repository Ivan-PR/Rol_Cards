<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cartas Rol</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
	<div id="container">
		<form action="form.jsp" method="post">
			<label for="nom">Nom de la carta:</label> <input type="text" id="nom"
				name="nom">
			<%!public static int getValorbase() {
		//Valor de los dados
		int Vdados[] = { 0, 0, 0, 0 };
		//Suma de las 3 puntuaciones mas grandes de los 4 dados 
		int Vbase = 0;
		//Tirada de los dados y los guarda en cada posicion
		for (int i = 0; i < Vdados.length; i++) {
			Vdados[i] = (int) (Math.random() * 6 + 1);
		}
		//ordena de menor a mayor los resultados de los dados
		Arrays.sort(Vdados);
		//suma de los tres valores mas altos
		for (int i = 1; i < Vdados.length; i++) {
			Vbase = Vbase + Vdados[i];
		}
		return Vbase;
	}%>

			<%
			String userId = request.getParameter("user");
						
			int VBFue = getValorbase();
			int VBDes = getValorbase();
			int VBCon = getValorbase();
			int VBInt = getValorbase();
			int VBSab = getValorbase();
			int VBCar = getValorbase();
			%>
			<%
			//Nombres de razas
			String Razas[] = { "Elfs", "Nans", "Gnom", "Mitjans", "Semi-Orc", "humans" };
			//selector de razas random
			int SRazas = (int) (Math.random() * 6);
			%>
			
			<%
			String nom_raza = Razas[SRazas];
			//Valor de los Modificadores de caracteristicas segun el caso
			int ModFue = 0;
			int ModDes = 0;
			int ModCon = 0;
			int ModInt = 0;
			int ModSab = 0;
			int ModCar = 0;
			int MaxMana = 0;
			int Maxvida = 0;

			switch (nom_raza) {
			case "Elfs":
				ModDes = 2;
				ModCon = -2;
				ModInt = 2;
				Maxvida = 128;
				MaxMana = 76;
				break;
			case "Nans":
				ModCon = 2;
				ModCar = -2;
				ModSab = 2;
				Maxvida = 160;
				MaxMana = 76;
				break;
			case "Gnom":
				ModCon = 2;
				ModFue = -2;
				ModCar = 2;
				Maxvida = 160;
				MaxMana = 72;
				break;
			case "Mitjans":
				ModDes = 2;
				ModFue = -2;
				Maxvida = 144;
				MaxMana = 72;
				break;
			case "Semi-Orc":
				ModFue = 2;
				ModInt = -2;
				ModCar = -2;
				Maxvida = 144;
				MaxMana = 68;
				break;
			case "humans":
				Maxvida = 144;
				MaxMana = 72;
				break;
			}
			%>
			<table>
				<caption>
					<h2><%out.print(Razas[SRazas]);%></h2>
				</caption>
				<tr>
					<td rowspan="9" width="140px" height="300px"><img src="img/<%out.print(SRazas);%>.png" height="auto" width="110"></td>
					<th>Carac.</th>
					<th>Valor Base</th>
					<th>Mod.</th>
					<th>Valor Final</th>
				</tr>
				<tr>
					<td><i>FUE:</i></td>
					<td><%out.print(VBFue);%></td>
					<td><%out.print(ModFue);%></td>
					<%int Fuetotal = VBFue + ModFue;%>
					<td><%out.print(Fuetotal);%></td>
				</tr>
				<tr>
					<td><i>DES:</i></td>
					<td><%out.print(VBDes);%></td>
					<td><%out.print(ModDes);%></td>
					<%int Destotal = VBDes + ModDes;%>
					<td><%out.print(Destotal);%></td>
				</tr>
				<tr>
					<td><i>CON:</i></td>
					<td><%out.print(VBCon);%></td>
					<td><%out.print(ModCon);%></td>
					<%int Contotal = VBCon + ModCon;%>
					<td><%out.print(Contotal);%></td>
				</tr>
				<tr>
					<td><i>INT:</i></td>
					<td><%out.print(VBInt);%></td>
					<td><%out.print(ModInt);%></td>
					<%int Inttotal = VBInt + ModInt;%>
					<td><%out.print(Inttotal);%></td>
				</tr>
				<tr>
					<td><i>SAB:</i></td>
					<td><%out.print(VBSab);%></td>
					<td><%out.print(ModSab);%></td>
					<%int Sabtotal = VBSab + ModSab;%>
					<td><%out.print(Sabtotal);%></td>
				</tr>
				<tr>
					<td><i>CAR:</i></td>
					<td><%out.print(VBCar);%>
					</td>
					<td><%out.print(ModCar);%>
					</td>
					<%int Cartotal = VBCar + ModCar;%>
					<td><%out.print(Cartotal);%></td>
				</tr>
				<%
				//Puntos de vida
				int PVida = (VBCon + ModCon) * (int) (Math.random() * 8 + 1);
				//Puntos de mana
				int PMana = (int) (Math.floor(((VBInt + ModInt) + (VBSab + ModSab)) / 2) * (int) (Math.random() * 4 + 1));
				%>
				
				<tr>
					<td><i>P.V (<span><%out.print(PVida);%></span>)</i></td>
					<td colspan="3"><progress max="<%out.print(Maxvida);%>" value="<%out.print(PVida);%>"></progress></td>
				</tr>
				<tr>
					<td><i>P.M (<span> <%out.print(PMana);%></span>)</i></td>
					<td colspan="3"><progress class="mana" max="<%out.print(MaxMana);%>" value="<%out.print(PMana);%>"></progress></td>
				</tr>
			</table>
			<input type="hidden" name="user" value="<%=userId%>">
			<input type="hidden" name="raza" value="<%=nom_raza%>">
			<input type="hidden" name="fue" value="<%=Fuetotal%>">
			<input type="hidden" name="des" value="<%=Destotal%>">
			<input type="hidden" name="con" value="<%=Contotal%>">
			<input type="hidden" name="int" value="<%=Inttotal%>">
			<input type="hidden" name="sab" value="<%=Sabtotal%>">
			<input type="hidden" name="car" value="<%=Cartotal%>">
			<input type="hidden" name="pv" value="<%=PVida%>">
			<input type="hidden" name="pm" value="<%=PMana%>">
			<input type="hidden" name="img" value="<%out.print(SRazas);%>.png">
			<div class="crt">
				<button type="button" onclick="window.location.reload();">Treure nova carta</button>
				<input type="submit" value="Desar carta">
				<button type="button" onclick="location.href='paginacio.jsp?pagina=0&raza=ALL&vis=4&user=<%out.print(userId);%>'">Visualitzar cartes</button>
			</div>
		</form>

	</div>
</body>
</html>