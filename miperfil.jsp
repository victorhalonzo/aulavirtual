<%-- 
    Document   : miperfil
    Created on : Jul 15, 2015, 8:01:27 PM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String codigo = (String) session.getAttribute("cod");//Recoge la session
   String apellidos = (String) session.getAttribute("ape");//Recoge la session
   String nombres = (String) session.getAttribute("nom");//Recoge la session
   String usuario = (String) session.getAttribute("usu");//Recoge la session
   String rol = (String) session.getAttribute("rol");//Recoge la session
   String email = (String) session.getAttribute("email");//Recoge la session
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jean Piaget - Aula Virtual</title>
        <link rel="stylesheet" href="css/barra3.css">
        <link href="imagenes/logo2.ico" rel="shortcut icon" />
    </head>
    <body>
         <img src="imagenes/logojp.gif" width="80px" height="100px" alt="logo portoviejo">
         <nav>
        <!-- Listado de Navegación -->
        <ul class="menu">  
            <li><a href="principal.jsp">Jean Piaget - Aula Virtual</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/historia/">Quienes Somos</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/definiciones/">Qué es un aula virtual</a></li>      
        </ul>    
</nav>
         <br>
         <br>
        <h1>Nombres:<%=nombres%></br>
            Apellidos:<%=apellidos%></br>
            E-mail:<%=email%></h1>
            <h2>Subir foto</h2> 
            <form action="subirfoto.jsp" method="post" enctype="multipart/form-data"> 
<input type="file" name="file"/> 
<br /> 
<input type="submit" value="Subir archivo" /> 
</form> 
    </body>
</html>
