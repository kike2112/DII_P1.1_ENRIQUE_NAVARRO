<%@page import="dam2.dii.p11.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link rel="stylesheet" href="./css/style.css" type="text/css"></link>
</head>
<body>
    <main>
	    <div class="ventana">
			<div class="titulo">
				<h2>Acceso Concedido</h2>
			</div>       
	        <form action="<%=request.getContextPath()%>" method="post">
	            <fieldset>   
	                <div class="bienvenida">
	                    <%
	                    Usuario user = (Usuario) request.getAttribute("user");
					    %>
						<label for="name">Hola "<%= user.getNombre() %>"</label>
					</div>
	                <div class="botones1">
						<div>
	    	                <input class="boton" type="submit" name="cerrar_sesion" value="Cerrar Sesión">
						</div>
	                </div> 
	            </fieldset>
	        </form>
        </div>
    </main>  
</body>
</html>