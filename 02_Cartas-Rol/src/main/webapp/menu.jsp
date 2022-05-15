<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cartas Rol menu</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" />
    </head>
    <body>
    <div class="accedir container"><br><br>
		<h1>Unboxing rol cards</h1><br><br>
    <%String userId = request.getParameter("user"); %>
    <div class="botons">
		<button type="button" onclick="location.href='CartaRol.jsp?pagina=0&user=<%out.print(userId);%>'">Treure cartes</button>
		<button type="button" onclick="location.href='paginacio.jsp?pagina=0&raza=ALL&vis=4&user=<%out.print(userId);%>'">Visualitzar cartes</button>
		<button type="button" onclick="location.href='canviar_pass.jsp?pagina=0&user=<%out.print(userId);%>'">Canviar password</button> 
    	<button type="button" onclick="location.href='index.html'">Sortir</button>
    </div>
    </div>
    </body>
</html>