<%-- 
    Document   : foro
    Created on : Aug 8, 2015, 9:06:53 AM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
     String codtarea = (String) session.getAttribute("cod_tarea3");//Recoge la session
   String nomtarea = (String) session.getAttribute("nombretar");
   String usuario = (String) session.getAttribute("usu");//Recoge la session
   String idusuario = (String) session.getAttribute("idusuario");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Jean Piaget - Aula virtual</title>
        <link rel="stylesheet" href="css/contenedor2.css">
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
        <div align="center"><h1>Foro</h1>
            <h2>Tarea: <%=nomtarea%></h2></div>
        <div id="contenedor">
        <div id="tabla1">
            <table bgcolor="C8E3F9">  
               <%
        Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select foros.mensaje,usuarios.nombre,foros.fecha from foros,usuarios where idtarea='"+codtarea+"' and foros.idusuario=usuarios.id");
   
   while(rs.next()) { 
	//String idtar=rs.getString("id");
       out.println("<tr>");
       
       %><form action="selec_tarea4" method="POST"><%
                                
       //out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	//out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
       //out.println("<td>"+rs.getString("fecha")+"</td>");            
       out.println("<td width=240 valign=top>"+rs.getString("fecha")+" "+rs.getString("nombre")+":</td>");
                
       out.println("<td>"+rs.getString("mensaje")+"</td>");
                   
                   //out.println("<td><input type=submit value='Responder'/></td>");
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
                 
            <form action="ingresoenforo" method="post">
                <table>
                <textarea name="mensaje" rows="10" cols="50" placeholder="Tu mensaje..." maxlength="1000"></textarea>
            <p><div align="right"><input type="submit" value="Enviar" /></p></div>
            
            <p><input type="text" style="visibility: hidden"name="idusuario"value="<%=idusuario%>"/></p>
            <p><input type="text" style="visibility: hidden"name="codtarea"value="<%=codtarea%>"/></p>
        </table>
             </form>
                    
        </div>
            </div>
    </body>
</html>
