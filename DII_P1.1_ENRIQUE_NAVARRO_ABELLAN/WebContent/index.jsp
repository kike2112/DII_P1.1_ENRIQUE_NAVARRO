<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link rel="stylesheet" href="css/style.css" type="text/css"></link>
</head>
<body>
    <main>
        <div class="ventana">
            <div class="titulo">
                <h2>Acceso Usuarios</h2>
            </div>       
            <form action="<%=request.getContextPath()%>/AccesoUsuario" method="post">
                <fieldset>   
<%
    String error_nombre = (String) request.getAttribute("error_nombre");
    String error_pass = (String) request.getAttribute("error_pass");
    String nombre = (String) request.getAttribute("nombre");
%>
    
                    <div class="campo">
                        <label for="name">Introduzca sus datos:</label>
                        <br>  
                <%
                  if (nombre != null) {
                %>
                        <input class="caja-texto" type="text" id="nombre" name="nombre" value="<%=nombre%>" title="Debe introducir un usuario">
                <%
                  } else {
                %>
                        <input class="caja-texto" type="text" id="nombre" name="nombre" placeholder="Nombre de usuario" value="" title="Debe introducir un usuario">
                <%
                  }
                %>         
                    </div>
               <%
                 if (error_nombre != null) {
               %>
                    <div class="campo" class="error_nombre"><p class="error"><%=error_nombre%></p></div>
               <%
                 }
               %>
                    <div class="campo">            
                        <label for="pass">Contraseña:</label>  
                        <br>
                        <input class="caja-texto" type="password" id="pass" name="pass" value="" title="Debe introducir la contraseña">    
                    </div>
               <%
                 if (error_pass != null) {
               %>
                     <div class="campo" class="error_pass"><p class="error"><%=error_pass%></p></div>
               <%
                 }         
               %>
                    <div class="campo"> 
                        <label for="pass2">Repite contraseña:</label>
                        <br>
                        <input class="caja-texto" type="password" id="pass2" name="pass2" value="" title="Debe confirmar la contraseña">
                    </div>
                    <div class="campo" class="campomini" class="registro">
                        <div class="campomini">
                             <a class="registro" href="<%=request.getContextPath()%>/AccesoUsuario?opcion=registro&&nombre=<%=nombre%>">Registrarse</a>
                        </div>
                    </div>
                    <div class="botones2">
                        <div>
                            <input class="boton" type="submit" name="aceptar" value="Aceptar">
                        </div>
                        <div>
                            <a href="<%=request.getContextPath()%>">
                                <input class="boton" type="button" name="cancelar" value="Cancelar"/>
                            </a>
                        </div>
                    </div> 
                </fieldset>
            </form>
        </div>
    </main>  
</body>
</html>