<%-- 
    Document   : index
    Created on : Jun 29, 2015, 6:38:38 PM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jean Piaget - Aula Virtual</title>
         <link rel="stylesheet" href="css/barra.css">
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
            <li><a href="index.jsp">Jean Piaget - Aula Virtual</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/historia/">Quienes Somos</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/definiciones/">Qué es un aula virtual</a></li>
            
        </ul>    
</nav>
        <br>
        <br>
        <br>
        <form method="post" action="ingreso">
            <table align="center">
                <tr>
                    <td colspan="2">
                        AUTENTICACION DE USUARIO
                    </td>
                </tr>
                <tr>
                    <td>
                        Usuario
                    </td>
                    <td>
                        <input type="text" name="usu"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contraseña
                    </td>
                    <td>
                        <input type="password" name="pass"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Ingresar"/>
                    </td>
                </tr>
                
            </table>
        </form>
            
        <h1>
            <div align="center">
<img src="imagenes/banderaporto.png" width="80" height="40" alt="banderaporto"/>
        <img src="imagenes/banderaecuador.jpg" width="80" height="40" alt="banderaecuador"/>
        </div>
        </h1>
    </body>
</html>
