<%-- 
    Document   : ViewBookingDetails
    Created on : May 29, 2018, 6:00:26 PM
    Author     : MY-PC
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.omg.CORBA.TIMEOUT"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Details</title>
        <script>
            <% 
                  List tabnolist = (List)request.getAttribute("tabnolist");
                  String resname = (String)request.getAttribute("resname");
                  List bookeddatelist = (List)request.getAttribute("bookeddatelist");
                  List bookedtablelist = (List)request.getAttribute("bookedtablelist");
                  List bookedtimelist = (List)request.getAttribute("bookedtimelist");
                  List bookedbylist = (List)request.getAttribute("bookedbylist");
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
            <h1 style="text-align: center">Booking Details</h1>
            <br><br><br>
            <form method="POST" action="">
        <table style="width: 300px;margin-left: 250px;" id="table1">
            <tr>
                <td>Restaurant Name :</td><td><input type="text" name="resname" id="resname" style="width: 150px;" value="<%=resname%>" disabled></td>
            
        </tr>
        </table>
        <table style="width: 600px;background-color: lightpink;overflow: auto; margin-left: 100px" border="5" id="table2">
               <tr>
                <th style="width: 100px">Table No</th>
                <th style="width: 200px">Booking Status</th>
                <th style="width: 200px">Booked by</th>
                <th style="width: 200px">Booking Date</th>
                <th style="width: 200px">Booking Time</th>
                
            </tr> 
            <%
            for(int i=0;i<tabnolist.size();i++){
                Integer tabno = (Integer)tabnolist.get(i);
                String tabnostr = tabno.toString();
                String status = "UnBooked";
                String bookedby = "";
                String datestr = "";
                String bookedtimestr = "";
                   
                    if(bookedtablelist.contains(tabno)){
                        int tabindex = bookedtablelist.indexOf(tabno);
                    //int j=1;
                    status = "Booked";
                    bookedby = (String)bookedbylist.get(tabindex);
                    Date bookeddate = (Date)bookeddatelist.get(tabindex);
                    Date bookedtime = (Date)bookedtimelist.get(tabindex);
                   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                   datestr = sdf.format(bookeddate);
                   String[] datestrsplit = datestr.split("-");
                   datestr = datestrsplit[2]+"-"+datestrsplit[1]+"-"+datestrsplit[0];
                   bookedtimestr = bookedtime.toString();
                }
                    
            %>
            <tr>
                <td style="width: 100px"><%=tabnostr%></td>
                <td style="width: 200px"><%=status%></td>
                <td style="width: 200px"><%=bookedby%></td>
                <td style="width: 200px"><%=datestr%></td>
                <td style="width: 200px"><%=bookedtimestr%></td>
                
            </tr> 
            <%
            }
            %>
        </table>
            </form>
        </div>
    </body>
</html>
