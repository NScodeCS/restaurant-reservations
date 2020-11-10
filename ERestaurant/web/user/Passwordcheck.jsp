<%-- 
    Document   : Passwordcheck
    Created on : May 29, 2018, 11:50:21 AM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Password Mismatch</title>
        <script>
            function goToProductPage(){
                 window.location="http://localhost:8080/ERestaurant/Home";
            }
        </script>
    </head>
    <body style="background-color: #006600">
        <div>
          
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
        </div>
        <h1>Please Enter Correct Password..!</h1><br><br>
        <div style="text-align: left"><input type="button" name="ok" value="Ok" onclick="goToProductPage()"></div>
    </body>
</html>
