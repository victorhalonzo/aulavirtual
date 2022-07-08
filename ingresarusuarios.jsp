<%-- 
    Document   : ingresarusuarios
    Created on : Jul 18, 2015, 8:12:33 AM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jean Piaget - Aula Virtual</title>
         <link rel="stylesheet" href="css/formulario.css">
         <link rel="stylesheet" href="css/barra3.css">
         <link href="imagenes/logo2.ico" rel="shortcut icon" />
    </head>
    <body>
        <img src="imagenes/logojp.gif" width="80px" height="100px" alt="logo portoviejo">
         <nav>
        <!-- Listado de Navegación -->
        <ul class="menu">  
            <li><a href="principal.jsp">Inicio</a></li>  
            <li><a href="http://jeanpiaget.edu.ec/historia/">Quienes Somos</a></li>
            <li><a href="http://jeanpiaget.edu.ec/definiciones/">Qué es un aula virtual</a></li>
        </ul>    
</nav>
        <form action="ingreso_usuarios" method="post">
            <br>
            <h1>Ingreso de usuarios</h1>
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
        <label style="font-weight: bold;">Rol:</label>
        <div>
            <label>Administrador</label>
            <input type="radio" name="rol" value="1" />
         </div>  
            
        <div>
            <label>Profesor</label>  
            <input type="radio" name="rol" value="3" checked />
            </div>
 
        <input type="submit" value="Guardar" />
            </fieldset>
        </form>
    </body>
</html>