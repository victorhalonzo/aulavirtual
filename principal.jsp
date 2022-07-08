<%-- 
    Document   : principal
    Created on : Jun 29, 2015, 6:52:14 PM
    Author     : Victor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%

   String codigo = (String) session.getAttribute("cod");//Recoge la session
   String apellidos = (String) session.getAttribute("ape");//Recoge la session
   String nombres = (String) session.getAttribute("nom");//Recoge la session
   String usuario = (String) session.getAttribute("usu");//Recoge la session
   //String rol = (String) session.getAttribute("rol");//Recoge la session
   String foto = (String) session.getAttribute("foto");//Recoge la session
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="stylesheet" href="css/barra2.css">
        <link href="imagenes/logo2.ico" rel="shortcut icon" />
    </head>
    <body>
        <div align="center">
        <img src="imagenes/logojp.gif" width="80px" height="100px" alt="logo portoviejo">
        <h2>"No existe conocimiento sin amor, ni amor sin conocimiento"</h2>
        </div>
        
        <nav>
        <!-- Listado de Navegación -->
        <ul class="menu">  
            <li><a href="principal.jsp">Jean Piaget - Aula Virtual</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/historia/">Quiénes Somos</a></li>
            <li><a href="http://jeanpiaget.edu.ec/definiciones/">Qué es un aula virtual</a></li>
            
        </ul>    
</nav>
        <div align="center">
        <h1>
            <br>
            
        <img src="<%=foto%>"width="80px"height="80px">
        <%=nombres%> <%=apellidos%>
        </h1>
        </div>
        <link rel="stylesheet" href="css/portal.css">  
 
   
   <div align="center">            
    <menu><a href="principal.jsp">Inicio</a></menu>
    
    <menu><a href='miperfil.jsp'>Perfil</a></menu>
    <menu><a href='cursos.jsp'>Cursos</a></menu>
    
        <%
              Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   ResultSet rs=st.executeQuery("select idrol from usuarios where persona_idpersona='"+codigo+"'");
   while(rs.next()) {         
   Integer idr=rs.getInt("idrol");
            switch(idr){
                case 1:
                %> 
                <menu><a href='administracion.jsp'style="display:inline;">Administración</a></menu>
                
                <%break;
                case 2: 
                %>
              <menu><a href='administracion.jsp'style='display:none;'>Administración</a></menu>
              
                <% break;
                case 3: 
                %>
              <menu><a href='administracion.jsp'style='display:none;'>Administración</a></menu>
              
                <% break;
            
                    }
                    }
   rs.close();
         st.close();
        %>
        
              <menu><a href="cerrarsesion.jsp">Salir</a></menu>    
   </div>
        <br>
       <div align="center"> 
       <img src="imagenes/imagen principal.jpg" width="224px" height="168px" alt="img"> 
       </div>
    </body>
</html>
