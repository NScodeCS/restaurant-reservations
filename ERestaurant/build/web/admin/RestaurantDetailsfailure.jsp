<%-- 
    Document   : RestaurantDetailsfailure
    Created on : May 29, 2018, 3:53:50 PM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script>
            function goToProductPage(){
                 window.location="http://localhost:8080/ERestaurant/Home";
            }
        </script>
    </head>
    <body style="background-color: #006600">
        <h1>Restaurant Details Failure!</h1><br><br>
        <div style="text-align: left"><input type="button" name="ok" value="Ok" onclick="goToProductPage()"></div>
    </body>
</html>
