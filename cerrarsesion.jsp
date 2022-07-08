<%-- 
    Document   : cerrarsesion
    Created on : Jul 31, 2015, 6:13:33 PM
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<% 
    HttpSession sesionOk=request.getSession();
    sesionOk.invalidate();
            %>
            <jsp:forward page="index.jsp"/>