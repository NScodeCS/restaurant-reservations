<%-- 
    Document   : Newregistration
    Created on : May 29, 2018, 9:42:05 AM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Registration</title>
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
            function getValidatephno(event){
                    //alert("Check.")   
                      
                   var keyCode = event.which || event.keyCode;
                   //alert(keyCode);
                   if(keyCode>=48 && keyCode<=57){
                       
                   }else if(keyCode == 8){
                   
                   }else{
                       var phno = document.getElementById("phno").value;
                   //alert(phno);
                   var phnosize = phno.length;
                    //alert(phnosize);
                    phno = phno.substr(0, phnosize-1);
                    //alert(phno);
                    
                    //alert(document.getElementById("phno").value);
                    alert("Enter only Numbers");
                    document.getElementById("phno").value = phno;
                   }
               }
               function Checkpassword(){
                   var password = document.getElementById("password").value;
                   var conpassword = document.getElementById("confirmpassword").value;
                   var name = document.getElementById("name").value;
                   var username = document.getElementById("username").value;
                   var phno = document.getElementById("phno").value;
                   var address = document.getElementById("address").value;
                   var password = document.getElementById("password").value;
                   if(name =="" || username == "" || phno == "" || address == "" ||password ==""){
                       alert("Invalid details");
                       return false;
                   }else if(password == conpassword){
                       return true;
                   }else{
                       alert("Password dosn't match ");
                       return false;
                   }
               }
        </script>
    </head>
    <body style="background-color: #006600">
        <div>
          
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
        </div>
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
           <br><br><h1 style="text-align: center">Registration</h1>
            <br><br><br><br>
            
            <form method="POST" action="Savenewuser">
        <table style="width: 600px;" id="table1">
        <tr>
            <td>Name :</td>
            <td><input type="text" name="name" id="name" style="width: 150px;"></td>
        </tr>
        <tr>
            <td>Address :</td>
            <td><textarea name="address" id="address" rows="5" cols="50"></textarea></td>
        </tr>
        <tr>
            <td>Phone No :</td>
            <td><input type="text" name="phno" id="phno" style="width: 150px;" onkeyup="getValidatephno(event)"></td>
        </tr>
        <tr>
            <td>User Name :</td>
            <td><input type="text" name="username" id="username"  style="width: 150px;"></td>
        </tr>
         <tr>
            <td>Password :</td>
            <td><input type="password" name="password" id="password" style="width: 150px;"></td>
        </tr>
         <tr>
            <td>Confirm Password :</td>
            <td><input type="password" name="confirmpassword" id="confirmpassword" style="width: 150px;"></td>
        </tr>
        <tr>
            <td>Role :</td>
            <td>
                <select id="roleid" name="role" style="width: 100px;">
                    <option value="user">User</option>
                    <option value="rm">RM</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan=2 align=center><input type=submit value="Submit" onclick="return Checkpassword()"></td>
        </tr>
        </table>
            </form>
        </div>
    </body>
</html>
