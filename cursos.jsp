<%-- 
    Document   : cursos
    Created on : Jul 21, 2015, 3:50:47 PM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page import="servlets.consultacursos"%>
<%@page import="servlets.Cursos"%>
<%@page import="java.util.LinkedList"%>
<%@page import="servlets.Asignaturas_1"%>
<%@page import="servlets.asignat"%>
<%@page import="java.util.Vector"%>
<%@page import="servlets.Sql"%>
<%@page import="servlets.ConsultaAsg"%>
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
         <img src="imagenes/logojp.gif" width="80px" height="100px" alt="logo portoviejo">
         <nav>
        <!-- Listado de Navegación -->
        <ul class="menu">  
            <li><a href="principal.jsp">Jean Piaget - Aula Virtual</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/historia/">Quienes Somos</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/definiciones/">Qué es un aula virtual</a></li>
        </ul>    
</nav>
         <%
             String codigo = (String) session.getAttribute("cod");//Recoge la session
              Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select idrol from usuarios where persona_idpersona='"+codigo+"'");
   while(rs.next()) {         
   Integer idr=rs.getInt("idrol");
            switch(idr){
                case 1:
                %> 
                                                      
         <h1>    
         <table border="1"align="center">
             <tr>

</tr>
<%
LinkedList<Cursos> lista = consultacursos.getCursos();
for (int i=0;i<lista.size();i++)
{
    %><form action="selec_curso" method="POST"><%
   out.println("<tr>");
   out.println("<input type=text style=visibility:hidden name=id value='"+lista.get(i).getId()+"'/>");
   out.println("<td><input type=submit name=nomcurso value= '" + lista.get(i).getNombre() + "' style='width:300px; height:40px'/></td>"); 
   //out.println("<td><a href=tareas.jsp>"+lista.get(i).getNombre()+"</a></td>");
   out.println("</tr>");
   %></form><%
}
%>
         
         </table>
                         </h1>
<%break;
                case 2:
                    %> 
                                                      
         <h1>    
         <table border="1"align="center">
             <tr>

</tr>
<%
                   
      Statement st2=con.createStatement();
   ResultSet rs2=st2.executeQuery("SELECT * FROM `cursos` WHERE id in(SELECT idcurso from usuarios where persona_idpersona='"+codigo+"')");  
   while(rs2.next()) { 
	
       %><form action="selec_curso" method="POST"><%
   out.println("<tr>");
   out.println("<input type=text style=visibility:hidden name=id value='"+rs2.getString("id")+"'/>");
   out.println("<td><input type=submit name=nomcurso value= '" + rs2.getString("nombre") + "' style='width:300px; height:40px'/></td>"); 
   //out.println("<td><a href=tareas.jsp>"+lista.get(i).getNombre()+"</a></td>");
   out.println("</tr>");
   %></form><%
   }
   rs2.close();
   st2.close();
   %>
</table>
                         </h1>
<%

       
              break;
              case 3:
                %> 
                                                      
         <h1>    
         <table border="1"align="center">
             <tr>

</tr>
<%
LinkedList<Cursos> lista2 = consultacursos.getCursos();
for (int i=0;i<lista2.size();i++)
{
    %><form action="selec_curso" method="POST"><%
   out.println("<tr>");
   out.println("<input type=text style=visibility:hidden name=id value='"+lista2.get(i).getId()+"'/>");
   out.println("<td><input type=submit name=nomcurso value= '" + lista2.get(i).getNombre() + "' style='width:300px; height:40px'/></td>"); 
   //out.println("<td><a href=tareas.jsp>"+lista.get(i).getNombre()+"</a></td>");
   out.println("</tr>");
   %></form><%
}
%>
         
         </table>
                         </h1>
<%break;
            }
            
   }
   rs.close();
         st.close();
                %>
        
    </body>
</html>

