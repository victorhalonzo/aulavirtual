<%-- 
    Document   : tareas
    Created on : Jul 1, 2015, 5:47:47 PM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page import="servlets.consultartareas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="servlets.Sql"%>
<%@page import="java.util.LinkedList"%>
<%@page import="servlets.Tareas"%>
<%@page import="servlets.consulta_tareas"%>
<%@page import="servlets.recuperar_archivo"%>
<%@page import="servlets.convertir_archivo"%>
<%@page import="servlets.ApliTareas"%>
<!DOCTYPE html>

<%
     String codasg = (String) session.getAttribute("cod_asg2");//Recoge la session
   String nombre = (String) session.getAttribute("nom_asg2");//Recoge la session 
   String codpersona = (String) session.getAttribute("cod");
   String idcurso = (String) session.getAttribute("cod_curso");
   String nomprof =(String) session.getAttribute("nom_prof");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jean Piaget - Aula Virtual</title>
        <link rel="stylesheet" href="css/contenedor.css">
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
        <div align="center"><h1><%=nombre%> - <%=nomprof%></h1></div>
        
        <div id="contenedor">
        <div id="tabla1">
        <table border="1">
            <tr>
                    <td colspan="5"style="font-weight:bold">
                        Documentos / Tareas
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
       
       %><form action="selec_tarea" method="POST"><%
       
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       
       out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
                   out.println("<td>"+rs.getString("fecha")+"</td>");
                   out.println("<td><input type=submit value='enviar respuesta'/></td>");
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
<div id="tabla2">
    <table border="1">
        <tr>
        <td colspan="4" style="font-weight:bold">
                        Calificaciones
                    </td>
        </tr>
        <tr>
                
            <th> Nombre </th>
      <th> Nota </th>
      <th> Comentario </th>
      </tr>

    <%
        Statement st2=con.createStatement();
        ResultSet rs2=st2.executeQuery("select nombre_tarea,nota,ifnull(tareas_recibidas.comentario,''),tarea_enviada from tareas_recibidas where idpersona='"+codpersona+"'and idasg='"+codasg+"' and idcurso='"+idcurso+"' and nota is not null");
   while(rs2.next()) { 
	//String idtar=rs.getString("id");
       %><%
       out.println("<tr>");
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       //out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs2.getString("id")+"'></td>");
	
        out.println("<td>"+rs2.getString("nombre_tarea")+"</td>");           
        out.println("<td>"+rs2.getString("nota")+"</td>");
        out.println("<td>"+rs2.getString("ifnull(tareas_recibidas.comentario,'')")+"</td>");
        out.println("<td><a href='"+rs2.getString("tarea_enviada")+"'>ver mi respuesta</a></td>");
                   //out.println("<td><input type=submit value='enviar respuesta'/></td>");
                   out.println("</tr>");
                   // String id_tarea=rs.getString("id");
   //HttpSession session = request.getSession(true);
   //session.setAttribute("id", id_tarea);
                               %><%

	}
 
  
   rs2.close();
         st2.close();
%>   
    
    
</table>
</div>
</div>
       
        
<%
              
        Statement st3=con.createStatement();
   ResultSet rs3=st3.executeQuery("select idrol from usuarios where persona_idpersona='"+codpersona+"'");
   while(rs3.next()) {         
   Integer idr=rs3.getInt("idrol");
            switch(idr){
                case 1:
                %> 
                <a href='tareas3.jsp'style='display:inline;'><img src="imagenes/foro.jpg" width="48px"height="48px">Entrar al foro</a>
                <menu><a href='subirtareas2.jsp'style='display:inline;'><img src="imagenes/subirtareas.jpg" width="48px" height="48px">Subir documentos/tareas</a></menu>
                <menu><a href='tareas2.jsp'style='display:inline;'><img src="imagenes/revisartareas.jpg" width="48px"height="48px">Revisar tareas</a></menu>
               
                <%break;
                case 2: 
                %>
              <a href='tareas3.jsp'style='display:inline;'><img src="imagenes/foro.jpg" width="48px"height="48px">Entrar al foro</a>
              <menu><a href='subirtareas2.jsp'style='display:none;'>Subir tareas</a></menu>
              <menu><a href='tareas2.jsp'style='display:none;'>Revisar tareas</a></menu>
              
                <% break;
                case 3: 
                %>
              <a href='tareas3.jsp'style='display:inline;'><img src="imagenes/foro.jpg" width="48px"height="48px">Entrar al foro</a>
              <menu><a href='subirtareas2.jsp'style='display:inline;'><img src="imagenes/subirtareas.jpg" width="48px" height="48px">Subir documentos/tareas</a></menu>
              <menu><a href='tareas2.jsp'style='display:inline;'><img src="imagenes/revisartareas.jpg" width="48px"height="48px">Revisar tareas</a></menu>
              
                <% break;
            
                    }
                    }
        %>
              
    </body>
</html>
