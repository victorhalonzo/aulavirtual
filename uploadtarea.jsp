<%-- 
    Document   : uploadtarea
    Created on : Jul 17, 2015, 6:15:04 PM
    Author     : Victor
--%>



<%@page import="clases.CorregirRuta"%>
<%@page import="clases.renombrar"%>
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
String ubicacionArchivo = "C://Users/Victor//Documents//NetBeansProjects//Appweb//web//archivos";

DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); 
factory.setRepository(new File(ubicacionArchivo));

ServletFileUpload upload = new ServletFileUpload(factory);




try
{
List<FileItem> partes = upload.parseRequest(request);

for(FileItem item : partes)
{
//File file1 = new File( ubicacionArchivo, item.getName() );

//renombrar filex=new renombrar();
String filex;

filex=renombrar.stripAccents(item.getName());

if(!filex.isEmpty()){

File file1 = new File( ubicacionArchivo, filex );

File file2=new File(filex);
String cadena="archivos/"+file2;
item.write(file1);

String codigopersona = (String) session.getAttribute("cod");//Recoge la session
String codigotarea = (String) session.getAttribute("cod_tarea");
String codigoasg = (String) session.getAttribute("cod_asg2");
String nomtarea = (String) session.getAttribute("nomtar");
String idcurso = (String) session.getAttribute("cod_curso");
String maxtarea=(String)session.getAttribute("maxtarea");
 //String fecha=new SimpleDateFormat("yyyy/MM/dd").format(dateChooserFechaVencimiento.getDate());
//String titulo = request.getParameter("titulo");;

String strRutaArchivo;
         //Instanciamos la clase que corrige la ruta del archivo
         CorregirRuta ruta1 = new CorregirRuta(file1.toString(),"\\", "\\\\");
         //CORREGIR LA RUTA
         strRutaArchivo = ruta1.obtenerRutaCorregidaWindows();

Conexion c=new Conexion();
        Connection con=c.getConnection();
        Statement st=con.createStatement();
   st.execute("update apli_tareas set tarea_ruta='"+cadena+"' where id='"+maxtarea+"'");
out.write("El archivo se ha subido correctamente al aula virtual de javadavadu") ;
out.println("<br><a href=tareas.jsp>volver</a>");
}else{
out.println("No se ha seleccionado ningun archivo");
    out.println("<br><a href=subirtareas.jsp>volver</a>");

}

}


}
catch(FileUploadException ex)
{
out.write("Error al subir archivo "+ex.getMessage());
}


//File file = new File( ubicacionArchivo, item.getName() );

%>