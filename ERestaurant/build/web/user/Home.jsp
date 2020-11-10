<%-- 
    Document   : Home
    Created on : May 29, 2018, 9:24:15 AM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style type="text/css">
        
        
        form {
            margin: 0 auto; 
            width:250px;
        }
        html, body {
        height: 100%;
        width: 100%;
        padding: 0;
        margin: 0;
      }

      #full-screen-background-image {
        z-index: -999;
        min-height: 100%;
        min-width: 100%;
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        
      }
            
        </style>
       
        <script>
            function Check(){
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                if(username == ""){
                    alert("Please Enter username.");
                    return false;
                }else if(password == ""){
                     alert("Please Enter password.");
                    return false;
                }else{
                    return true;
                }
            }
        </script>
    </head>
    <body style="background-color: #006600">
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
            <br><br><br><br><br><br><br>
            <h1 style="text-align: center">Login</h1>
            <form method="POST" action="Userhome">
        <table style="width: 400px;" id="table1">
        <tr>
            <td>User Name :</td><td><input type="text" name="username" id="username" style="width: 150px;"></td>
            
        </tr>
        <tr>
            <td>Password :</td><td><input type="password" name="password" id="password" style="width: 150px;"></td>
            
        </tr>
        <tr>
            <td colspan=2 align=center><input type=submit value="Submit" onclick="return Check()"></td>
        
        </tr>
        <br>
        <tr>
            <td colspan=2 align=center >
                <a href="http://localhost:8080/ERestaurant/Newregistration">New User Registration</a><br>
            </td>
        </tr>
        </table>
            </form>
        </div>
    </body>
</html>
