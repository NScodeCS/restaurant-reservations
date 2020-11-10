<%-- 
    Document   : Newregistrationfailure
    Created on : May 29, 2018, 10:51:58 AM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Failure</title>
        <script>
            function goToProductPage(){
                 window.location="http://localhost:8080/ERestaurant/Home";
            }
        </script>
    </head>
    <body style="background-color: #006600">
        <h1>Registration Failure!</h1><br><br>
        <div style="text-align: left"><input type="button" name="ok" value="Ok" onclick="goToProductPage()"></div>
    </body>
</html>
