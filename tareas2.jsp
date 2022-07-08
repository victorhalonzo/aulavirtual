<%-- 
    Document   : tareas2
    Created on : Jul 29, 2015, 8:38:56 PM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
     String codasg = (String) session.getAttribute("cod_asg2");//Recoge la session
   String nombre = (String) session.getAttribute("nom_asg2");//Recoge la session 
   String codpersona = (String) session.getAttribute("cod");
   String idcurso = (String) session.getAttribute("cod_curso");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jean Piaget - Aula Virtual</title>
        <link rel="stylesheet" href="css/contenedor.css">
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
        <div align="center"><h1><%=nombre%></h1></div>
        <div id="contenedor">
        <div id="tabla1">
        <table border="1">
            <tr>
                    <td colspan="5"style="font-weight:bold">
                        Tareas
                    </td>
                </tr>
            <tr>
                
                <th> # </th>
            <th> Nombre </th>
      <th> Fecha </th>
      <th> Enviar respuesta </th>
      </tr>
      
        <%

        Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from apli_tareas where id_asg='"+codasg+"'and idcurso='"+idcurso+"'");
   
   while(rs.next()) { 
	//String idtar=rs.getString("id");
       out.println("<tr>");
       
       %><form action="selec_tarea3" method="POST"><%
       
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       
       out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
                   out.println("<td>"+rs.getString("fecha")+"</td>");
                   out.println("<td><input type=submit value='Revisar tareas'/></td>");
                   out.println("</tr>");
                   // String id_tarea=rs.getString("id");
   //HttpSession session = request.getSession(true);
   //session.setAttribute("id", id_tarea);
                               %></form><%

	}
 
  
   rs.close();
         st.close();
%>
               
</table>
        </div>
        </div>
         
    </body>
</html>