<%-- 
    Document   : RestaurantDetails
    Created on : May 29, 2018, 3:53:37 PM
    Author     : MY-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant Details</title>
        <script>
            <% 
            Integer resid = (Integer)request.getAttribute("resid");
            String residstr = resid.toString();
            String resname = (String)request.getAttribute("resname");
            String resaddress = (String)request.getAttribute("resaddress");
            Long phno = (Long)request.getAttribute("phno");
            String phnostr = phno.toString();
            %>
        </script>
    </head>
    <body style="background-color: #006600">
        <div>
          <a href="http://localhost:8080/ERestaurant/NewApprovals"><img src="images/Approvals2.png"></a>
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
         </div>
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
            <br><br>
            <h1 style="text-align: center">Restaurant Details</h1>
            <br><br><br>
            <form method="POST" id="submitformid" action="SetRestaurantApproval">
        <table style="width: 600px;" id="table1">
            <tr>
            <td>Restaurant Id :</td>
            <td><input type="text" name="resid" id="resid" style="width: 150px;" value="<%=residstr%>" disabled></td>
        </tr>
            <tr>
            <td>Restaurant Name :</td>
            <td><input type="text" name="resname" id="resname" style="width: 150px;" value="<%=resname%>" disabled></td>
        </tr>
        <tr>
            <td>Restaurant Address :</td>
            <td><textarea name="resaddress" id="resaddress" rows="5" cols="50" disabled><%=resaddress%></textarea></td>
        </tr>
        <tr>
            <td>Phone No :</td>
            <td><input type="text" name="phno" id="phno" style="width: 150px;" value="<%=phnostr%>" disabled></td>
        </tr>
        <tr>
            <td>Approved Status</td>
            <td>
                <select id="approveid" name="approve" style="width: 100px;">
                    <option value="unapproved">Disapproved</option>
                    <option value="approved">Approved</option>
                </select>
            </td>
        </tr>
        
        <tr>
            <td colspan=2 align=center><input type=submit name="submitbutton" value="Submit"></td>
        
        </tr>
        
        <input type="hidden" name="residhidden2" id="residhidden2" value="<%=residstr%>">
        </table>
            </form>
        </div>
</html>
