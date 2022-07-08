<%-- 
    Document   : ingresarasg
    Created on : Aug 5, 2015, 6:35:30 AM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Jean Piaget - Aula Virtual</title>
        <link rel="stylesheet" href="css/barra4.css">
        <link rel="stylesheet" href="css/portal.css">
        <link href="imagenes/logo2.ico" rel="shortcut icon" />
    </head>
    <body>
        <div align="center">
        <img src="imagenes/logojp.gif" width="80px" height="100px" alt="logo portoviejo">
        <h2>"No existe conocimiento sin amor, ni amor sin conocimiento"</h2>
        </div>
        
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
        <div align=center>
        <h1>Ingreso de Asignaturas</h1>
        <form action="ingreso_asg" method="post">
            <label for="nombreasg">Nombre:</label>
            <input type="text" name="nombreasg" style="width:300px" required pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ]*"/>
            <input type="submit" value="Guardar"/>
        </form>
        </div>
    </body>
</html>
