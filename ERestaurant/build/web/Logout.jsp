<%-- 
    Document   : Logout
    Created on : MAY 29, 2018, 11:57:56 AM
    Author     : server
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        </head>
    <body>
        <%
                request.getSession().invalidate();
                response.setHeader("Cache-Control","no-cache"); 
                response.setDateHeader("Expires", 0);
                response.setHeader("Pragma","no-cache"); 
                response.sendRedirect("http://localhost:8080/ERestaurant/Home");
        %>
    </body>
</html>

