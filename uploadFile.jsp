<%-- 
    Document   : uploadFile
    Created on : Jul 9, 2015, 7:06:11 AM
    Author     : Victor
--%>

<%@page import="clases.renombrar"%>
<%@page import="clases.CorregirRuta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="servlets.Conexion"%>
<%@page import="java.io.File"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%> 
<%@ page import="java.util.*" %> 
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@ page import="org.apache.commons.fileupload.disk.*"%> 
<%@ page import="org.apache.commons.fileupload.servlet.*"%> 
<%@ page import="org.apache.commons.io.*"%> 
 

<%
String usuario = (String) session.getAttribute("usu");    
 File directorio=new File("C://Users/Victor//Documents//NetBeansProjects//Appweb//web//archivos recibidos//"+usuario); 
directorio.mkdir(); 

String ubicacionArchivo = "C://Users/Victor//Documents//NetBeansProjects//Appweb//web//archivos recibidos//"+usuario;

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); 
factory.setRepository(new File(ubicacionArchivo));

ServletFileUpload upload = new ServletFileUpload(factory);



try
{
List<FileItem> partes = upload.parseRequest(request);



for(FileItem item : partes)
{
 

String filex;
filex=renombrar.stripAccents(item.getName());    

if(!filex.isEmpty()){
    
    
File file = new File( ubicacionArchivo,filex );
File file2=new File(filex);
String cadena="archivos recibidos/"+usuario+"/"+file2;
item.write(file);

String codigopersona = (String) session.getAttribute("cod");//Recoge la session
String codigotarea = (String) session.getAttribute("cod_tarea");
String codigoasg = (String) session.getAttribute("cod_asg2");
String nomtarea = (String) session.getAttribute("nomtar");//Recoge la session
String idcurso = (String) session.getAttribute("cod_curso");
 //String fecha=new SimpleDateFormat("yyyy/MM/dd").format(dateChooserFechaVencimiento.getDate());


String strRutaArchivo;
         //Instanciamos la clase que corrige la ruta del archivo
         CorregirRuta ruta1 = new CorregirRuta(file.toString(),"\\", "\\\\");
         //CORREGIR LA RUTA
         strRutaArchivo = ruta1.obtenerRutaCorregidaWindows();

Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   st.execute("insert into tareas_recibidas (idtarea,idpersona,idcurso,idasg,tarea_enviada,nombre_tarea,fecha)values('"+codigotarea+"','"+codigopersona+"','"+idcurso+"','"+codigoasg+"','"+cadena+"','"+nomtarea+"',curdate())");

out.write("El archivo se ha subido correctamente") ;
out.println("<br><a href=tareas.jsp>volver</a>");
}else{
out.println("No se ha seleccionado ningun archivo");
    out.println("<br><a href=enviartarea.jsp>volver</a>");

}  
}


}

catch(FileUploadException ex)
{
out.write("Error al subir archivo "+ex.getMessage());
}


//}
//File file = new File( ubicacionArchivo, item.getName() );

%>