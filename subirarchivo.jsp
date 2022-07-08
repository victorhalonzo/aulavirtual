
<%@page import="java.util.List"%>

<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
   String ubicacionArchivo="C://Users/Victor//Documents//NetBeansProjects//Appweb//web"; 
   DiskFileItemFactory factory=new DiskFileItemFactory();
   factory.setSizeThreshold(1024);
   factory.setRepository(new File(ubicacionArchivo));
   
   ServletFileUpload upload=new ServletFileUpload(factory);
   
   try
   {
       List<FileItem> partes=upload.parseRequest(request);
   }
   catch(FileUploadException ex)
   }
%>