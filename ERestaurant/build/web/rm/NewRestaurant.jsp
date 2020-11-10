<%-- 
    Document   : NewRestaurant
    Created on : May 29, 2018, 12:36:29 PM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Restaurant</title>
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
               function getValidatetable(event){
                    //alert("Check.")   
                      
                   var keyCode = event.which || event.keyCode;
                   //alert(keyCode);
                   if(keyCode>=48 && keyCode<=57){
                       
                   }else if(keyCode == 8){
                   
                   }else{
                       var nooftab = document.getElementById("nooftables").value;
                   //alert(phno);
                   var nooftabsize = nooftab.length;
                    //alert(phnosize);
                    nooftab = nooftab.substr(0, nooftabsize-1);
                    //alert(phno);
                    
                    //alert(document.getElementById("phno").value);
                    alert("Enter only Numbers");
                    document.getElementById("nooftables").value = nooftab;
                   }
               }
               function Check(){
                   var resname = document.getElementById("resname").value;
                   var address = document.getElementById("resaddress").value;
                   var phno = document.getElementById("phno").value;
                   var nooftable = document.getElementById("nooftables").value;
                   
                   if(resname == "" || address == "" || phno == ""||nooftable==""){
                       alert("Invalid details");
                       return false;
                   }else{
                       return true;
                   }
               }
                   </script>
    </head>
    <body style="background-color: #006600">
         <div>
          <a href="http://localhost:8080/ERestaurant/RmHome"><img src="images/Home2.png"></a>
          <a href="http://localhost:8080/ERestaurant/NewRestaurant"><img src="images/New2.png"></a>
          <a href="http://localhost:8080/ERestaurant/ViewBooking"><img src="images/Booking2.png"></a>
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
         </div>
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
            <br><br>
            <h1 style="text-align: center">New Restaurant</h1>
            <br><br><br>
            <form method="POST" action="SaveNewRestaurant">
        <table style="width: 600px;" id="table1">
        <tr>
            <td>Restaurant Name :</td><td><input type="text" name="resname" id="resname" style="width: 150px;"></td>
            
        </tr>
        <tr>
            <td>Restaurant Address :</td>
            <td><textarea name="resaddress" id="resaddress" rows="5" cols="50"></textarea></td>
        </tr>
        <tr>
            <td>Phone No :</td>
            <td><input type="text" name="phno" id="phno" style="width: 150px;" onkeyup="getValidatephno(event)"></td>
        </tr>
        <tr>
            <td>No of Tables :</td>
            <td><input type="text" name="nooftables" id="nooftables" style="width: 150px;" onkeyup="getValidatetable(event)"></td>
            
        </tr>
        <tr>
            <td colspan=2 align=center><input type=submit value="Submit" onclick="return Check()"></td>
        
        </tr>
        <br>
        </table>
            </form>
        </div>
    </body>
</html>
