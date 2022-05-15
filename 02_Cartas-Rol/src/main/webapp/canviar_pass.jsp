<DOCTYPE ! html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Canviar pass</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
<div class="accedir container"><br><br>
		<h1>Insereix les dades</h1><br><br>
<%String userId = request.getParameter("user");%>
	
	<form action="pass.jsp" method="post">
		<label for="pass">Contrasenya actual:</label>
		<input type="password" id="act_pass" name="act_pass"><br><br>
		<label for="pass">Contrasenya nova:</label>
		<input type="password" id="newpass" name="newpass"><br><br> 
		<input type="hidden" name="user" value="<%out.print(userId);%>">
		<input type="submit" value="Canviar Password" /><br><br>
		<div class="botons">
			<button type="button" onclick="location.href='index.html'">sortir</button>
		    </div>
	</form>
	</div>
</body>
</html>