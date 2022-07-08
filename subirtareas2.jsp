<%-- 
    Document   : subirtareas2
    Created on : Aug 8, 2015, 10:06:47 AM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Jean Piaget - Aula virtual</title>
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
        <div align="center"><h1>Subir tareas</h1></div>
    <body>
        
        <%
        String codigoasg = (String) session.getAttribute("cod_asg2");

String idcurso = (String) session.getAttribute("cod_curso");
%>
        <form action="ingresarnomtarea" method="post">
            <input type="text" style="visibility: hidden"name="codcurso"value="<%=idcurso%>"/>
            <input type="text" style="visibility: hidden"name="codasg"value="<%=codigoasg%>"/>
            <table align="center">
                <tr>
                    <td colspan="2">
                        <label style="font-weight:bold;">ESCRIBA UN TITULO PARA LA TAREA</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre:
                    </td>                            
            <td>
                <input type="text" name="nomtarea" style="width: 250px" required/>
            </td>
            </tr>
            <tr>
                    <td colspan="2">
            <input type="submit" value="OK"/>
                    </td>
            </tr>
            </table>
            
        </form>
    </body>
</html>
