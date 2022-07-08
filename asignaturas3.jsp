<%-- 
    Document   : asignaturas3
    Created on : Jul 17, 2015, 6:04:07 PM
    Author     : Victor
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="servlets.Asignaturas_1"%>
<%@page import="servlets.asignat"%>
<%@page import="java.util.Vector"%>
<%@page import="servlets.Sql"%>
<%@page import="servlets.ConsultaAsg"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi app</title>
    </head>
    <body>
         <img src="imagenes/logo.jpg" width="XXpx" height="YYpx" alt="logo portoviejo">
         <h1>
             
             
         <table border="1"align="center">
             <form action="selec_asg3" method="POST">
<tr>

</tr>
<%
LinkedList<Asignaturas_1> lista = ConsultaAsg.getAsignaturas();
for (int i=0;i<lista.size();i++)
{
   out.println("<tr>");
   //out.println("<td>"+lista.get(i).getId()+"</td>");
   out.println("<td><input type=submit name=nomasg value= '" + lista.get(i).getNombre() + "' style='width:300px; height:40px'/></td>"); 
   //out.println("<td><a href=tareas.jsp>"+lista.get(i).getNombre()+"</a></td>");
   out.println("</tr>");
   
}
%>
         </form>
         </table>
       
        
          </h1>
        
    </body>
</html>

