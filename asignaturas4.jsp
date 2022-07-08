<%-- 
    Document   : asignaturas4
    Created on : Jul 21, 2015, 4:40:22 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Asignaturas</title>
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
        <h1>
        <table border="1" align="center">
        <%
            String idcurso = (String) session.getAttribute("cod_curso");
            String nombre = (String) session.getAttribute("nom_curso");
            
            Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from asignaturas where id in (select idasg from cursos_detalle where idcurso='"+idcurso+"')");
   while(rs.next()) { 
	//String idtar=rs.getString("id");
       %><form action="selec_asg4" method="POST"><%
       out.println("<tr>");
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       //out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	//out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
                   //out.println("<td>"+rs.getString("fecha")+"</td>");
                   out.println("<input type=text style=visibility:hidden name=idcurso value='"+idcurso+"'/>");
                    out.println("<input type=text style=visibility:hidden name=idasg value='"+rs.getString("id")+"'/>");
                   out.println("<td><input type=submit value='"+rs.getString("nombre")+"'style='width:300px; height:40px'/></td>");
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
</h1>
    </body>
</html>
