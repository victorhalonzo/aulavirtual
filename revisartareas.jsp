<%-- 
    Document   : revisartareas
    Created on : Jul 11, 2015, 2:26:50 PM
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
        <title>Jean Piaget - Aula virtual</title>
        <link href="imagenes/logo2.ico" rel="shortcut icon" />
        <link rel="stylesheet" href="css/barra.css">
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
        <h1>Revisar Tareas</h1>
        
        <table border="1">
            <tr>
                <th> # </th>
            <th> Alumno </th>
      <th> Tarea </th>
      <th> Enlace </th>
      <th> Fecha </th>
      <th> Comentario </th>
      <th> Nota </th>
        <%
            String codtarea2 = (String) session.getAttribute("cod_tarea2");
            String codtarea = (String) session.getAttribute("cod_tarea");
            String codasg = (String) session.getAttribute("cod_asg2");
            String idcurso = (String) session.getAttribute("cod_curso");
            String nombre = (String) session.getAttribute("nom_asg");
        Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   //ResultSet rs=st.executeQuery("select * from tareas_recibidas where idasg in (select id from asignaturas where nombre='"+nombre+"')");
        ResultSet rs=st.executeQuery("select tareas_recibidas.id,tareas_recibidas.idtarea,personas.nombres,tareas_recibidas.tarea_enviada,tareas_recibidas.nombre_tarea,tareas_recibidas.fecha,ifnull(tareas_recibidas.nota,0),ifnull(tareas_recibidas.comentario,'') from tareas_recibidas,personas where idtarea='"+codtarea2+"' and idasg='"+codasg+"' and idcurso='"+idcurso+"' and tareas_recibidas.idpersona=personas.idpersona");
        while(rs.next()) { 
	//String idtar=rs.getString("id");
       %><form action="ingreso_nota" method="POST"><%
       out.println("<tr>");
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
       out.println("<td>"+rs.getString("nombres")+"</td>");
       out.println("<td>"+rs.getString("nombre_tarea")+"</td>");
	out.println("<td><a href='"+rs.getString("tarea_enviada")+"'>ver respuesta</a></td>");
        
                   out.println("<td>"+rs.getString("fecha")+"</td>");
                   //out.println("<td>"+rs.getString("ifnull(tareas_recibidas.nota,0)")+"</td>");
                   out.println("<td><input type=text name=comentario maxlength=100 style='width:400px' value='"+rs.getString("ifnull(tareas_recibidas.comentario,'')")+"'/></td>");
                   out.println("<td><input type=number step=any  name=nota style='width:50px' value='"+rs.getString("ifnull(tareas_recibidas.nota,0)")+"'/></td>");
                   out.println("<td><input type=submit value='Guardar'/></td>");
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

    </body>
</html>
