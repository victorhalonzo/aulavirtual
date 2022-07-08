<%-- 
    Document   : cursosdetalle
    Created on : Jul 30, 2015, 8:03:00 PM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
String codcurso = (String) session.getAttribute("cod_curso2");//Recoge la session
String nomcurso = (String) session.getAttribute("nom_curso2");//Recoge la session
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Jean Piaget - Aula Virtual</title>
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
        <div align="center"><h1><%=nomcurso%></h1></div>
        
        
        <h3>
        <table border="1" align="center">
             <tr>
                
                <th> # </th>
            <th> Nombre </th>
      <th> Profesor </th>
      
      </tr>
        <%
            
            
            Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select * from asignaturas");
   while(rs.next()) { 
	//String idtar=rs.getString("id");
       %><form action="detallecurso" method="POST">
            <input type="text" style="visibility: hidden"name="codcurso"value="<%=codcurso%>"/><%
       out.println("<tr>");
                   //+ "id_asg="+rs.getString("id_asg")+
		     //  " Titulo="+rs.getString("titulo_tarea")+
       out.println("<td><input type=text name=idtar readonly=readonly style='width:30px' value='"+rs.getString("id")+"'></td>");
	//out.println("<td><a href='"+rs.getString("tarea_ruta")+"'>"+rs.getString("titulo_tarea")+"</a></td>");
                   //out.println("<td>"+rs.getString("fecha")+"</td>");
                    out.println("<td><input type=checkbox name=idasg value='"+rs.getString("id")+"'><label>"+rs.getString("nombre")+"</label></td>");
                    out.println("<input type=text style=visibility:hidden name=idasg2 value='"+rs.getString("id")+"'/>");
                    out.println("<td><input type=text name=profesor required pattern=[a-zA-Z áéíóúÁÉÍÓÚ]*/></td>");
                    out.println("<td><input type=submit value=Guardar /></td>");
                   //out.println("<td>"+rs.getString("nombre")+"</td>");
                   //out.println("<td><input type=submit value='Guardar'/></td>");
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
</h3>


    </body>
</html>
