<%-- 
    Document   : enviartarea
    Created on : Jul 9, 2015, 6:38:14 AM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi app</title>
         <link rel="stylesheet" href="css/barra.css">
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
         <DIV ALIGN=center><h1>Enviar tarea</h1></DIV>
        <form action="uploadFile.jsp" method="post" enctype="multipart/form-data"> 
<input type="file" name="file"/> 
<br /> 
<input type="submit" value="Subir archivo" /> 
</form> 
    </body>
</html>
