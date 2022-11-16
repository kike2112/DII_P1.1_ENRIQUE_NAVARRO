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
                <h2>Registro de Usuario</h2>
            </div>       
            <form action="<%=request.getContextPath()%>/AccesoUsuario?opcion=agregar" method="post">
                <fieldset>   
<%
    String error_nombre = (String) request.getAttribute("error_nombre");
    String error_pass = (String) request.getAttribute("error_pass");
    String nombre = (String) request.getAttribute("nombre");
%>
    
                    <div class="campo">
                        <label for="name">Nombre / Nickname:<span>*</span></label>
                        <br>  
                <%
                  if (nombre != null) {
                %>
                        <input class="caja-texto" type="text" id="nombre" name="nombre" value="<%=nombre%>" title="Introduzca nombre de usuario" required>
                <%
                  } else {
                %>
                        <input class="caja-texto" type="text" id="nombre" name="nombre" placeholder="Nombre de usuario" value="" title="Introduzca nombre de usuario" required>
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
                        <label for="pass">Contraseña:<span>*</span></label>  
                        <br>
                        <input class="caja-texto" type="password" id="pass" name="pass" value="" title="Debe introducir la contraseña" required> 
                    </div>                    
               <%
                 if (error_pass != null) {
                %>
                    <div class="campo" class="error_pass"><p class="error"><%=error_pass%></p></div>
                <%
                 }         
               %>
                    <div class="campo"> 
                        <label for="pass2">Confirme contraseña:<span>*</span></label>
                        <br>
                        <input class="caja-texto" type="password" id="pass2" name="pass2" value="" title="Debe confirmar la contraseña" required> 
                    </div>
                    <div class="campo">            
                        <label for="fecha">Fecha de nacimiento:<span>*</span></label>  
                        <br>
                        <input class="caja-texto" type="date" id="fecha" name="fecha" max="2004-12-31" title="Debe ser mayor de edad" required>    
                    </div>
                    <div class="botones2">
                        <div>
                            <input class="boton" type="submit" name="registrar" value="Registrar">
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