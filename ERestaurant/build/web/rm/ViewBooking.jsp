<%-- 
    Document   : ViewBooking
    Created on : May 29, 2018, 5:26:39 PM
    Author     : MY-PC
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Booking</title>
        <script>
            <% 
            List residlist = (List)request.getAttribute("residlist");
            List resnamelist=(List)request.getAttribute("resnamelist");
            %>
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
            <h1 style="text-align: center">View Booking</h1>
            <br><br><br>
            <form method="POST" action="ViewBookingDetails">
        <table style="margin-left: 250px" id="table1">
            <tr>
            <td>Date : </td>
            <td>
                <select id="date" name="date">
                    <%
                    for(int i=1;i<=31;i++){
                    %>
                    <option value="<%=i%>"><%=i%></option>
                    <%
                    }
                    %>
                </select>
            
            Month : 
            
                <select id="month" name="month">
                    <%
                    for(int i=1;i<=12;i++){
                    %>
                    <option value="<%=i%>"><%=i%></option>
                    <%
                    }
                    %>
                </select>
            
            Year : 
            
                <select id="year" name="year">
                    
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    
                </select>
            </td>
            
        </tr>
        <tr>
            <td>Restaurant Name :</td>
            <td>
                <select id="resid" name="resid" style="width: 150px">
                    <%
                    for(int i=0;i<residlist.size();i++){
                        Integer resid = (Integer)residlist.get(i);
                        String residstr = resid.toString();
                        String resname = (String)resnamelist.get(i);
                    %>
                    <option value="<%=residstr%>"><%=resname%></option>
                    <%
                    }
                    %>
                </select>
            </td>
        </tr>
         <tr>
            <td colspan=2 align=center><input type=submit name="submitbutton" value="Fetch"></td>
        
        </tr>
        </table>
            </form>
        </div>
    </body>
</html>
