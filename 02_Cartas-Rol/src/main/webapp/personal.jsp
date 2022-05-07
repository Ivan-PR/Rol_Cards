<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays,java.util.List"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cartas Rol</title>
<link rel="stylesheet" href="css/style2.css" type="text/css" />
</head>
<body>
	<div class="container">
		<h1>Que vols fer?</h1>
	</div>
	<div class="opcions">
		<button type="button" onclick="location.href='CartaRol.jsp?pagina=0'">Obrir una carta</button>
		<button type="button" onclick="location.href='paginacio.jsp?pagina=0&raza=ALL&vis=4'">Visualitzar cartes</button>
	</div>

</body>
</html>