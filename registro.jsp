<%-- 
    Document   : registro
    Created on : Jul 28, 2015, 6:25:03 AM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Jean Piaget - Aula Virtual</title>
        <link rel="stylesheet" href="css/barra3.css">
        <link rel="stylesheet" href="css/formulario.css">
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
        
         <form action="registroalumno" method="post">
            <br>
            <h1>Registro de alumnos</h1>
            <fieldset>
        <legend style="font-weight:bold;">Datos personales</legend>
        
            <div>
                <label for="nombres">Nombres:</label>
                <input type="text" name="nombres" size="50" required pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ]*"/>
            </div>
        <div>
            <label for="apellidos">Apellidos:</label>
            <input type="text" name="apellidos" size="50" required pattern="[a-zA-Z áéíóúÁÉÍÓÚñÑ]*"/>
        </div>
            <div>
                <label for="direccion">Direccion:</label>
                <input type="text" name="direccion" size="60"/>
            </div>
            <div>
                <label for="email">Correo electronico:</label>
                <input type="email" name="email" size="60"/>
            
        </div>
            </fieldset>
            <fieldset>
        <legend style="font-weight:bold;">Datos de usuario</legend>
        
            <div>
                <label for="usuario">Usuario:</label>
                <input type="text" name="usuario"required/>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" name="pass"required/>
            </div>
        <label style="font-weight: bold;">Curso:</label>
        <%
            String id = (String) session.getAttribute("cod_curso");
            String nombre = (String) session.getAttribute("nom_curso");
            
            Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from cursos");
   while(rs.next()) { 
	//String idtar=rs.getString("id");
       %><%
       //out.println("<tr>");
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       //out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	//out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
                   //out.println("<td>"+rs.getString("fecha")+"</td>");
                    //out.println("<input type=text style=visibility:hidden name=idasg value='"+rs.getString("id")+"'/>");
                   out.println("<div><label>"+rs.getString("nombre")+"</label><input type=radio name=curso value='"+rs.getString("id")+"' checked/></div>");
                   //out.println("</tr>");
                   // String id_tarea=rs.getString("id");
   //HttpSession session = request.getSession(true);
   //session.setAttribute("id", id_tarea);
                               %><%

	}
 
  
   rs.close();
         st.close();
%>
<input type="submit" value="Guardar" />
            </fieldset>
         </form>
    </body>
</html>
