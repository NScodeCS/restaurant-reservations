<%-- 
    Document   : GetAvailableTable
    Created on : May 30, 2018, 10:55:14 AM
    Author     : MY-PC
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Tables</title>
        <script>
            <% 
            String resname = (String)request.getAttribute("resname");
            String datestr = (String)request.getAttribute("Datestr");
            List tabnolist = (List)request.getAttribute("tablist");
            Integer resid = (Integer)request.getAttribute("resid");
            String residstr = resid.toString();
            
            %>
                function getTables(){
                    var formname = document.getElementById("submitformid").name;
                            var form = document.forms[formname];
                            var table = document.getElementById("table2");
                var rowCount = table.rows.length;
                
                var selectedindex = 0;
                var checkstatus = false;
                for(var i=1; i<rowCount; i++) {

                    var row = table.rows[i];
                    
                    var chkbox = row.cells[1].childNodes[0];
                    if(null != chkbox && true == chkbox.checked) {
                        checkstatus = true;
                        var tabid = row.cells[0].innerHTML;
                        
                        
                        var element = document.createElement("input");
                            element.setAttribute("type", "hidden");
                            element.setAttribute("name", "tabid"+selectedindex);
                            element.setAttribute("value", tabid);
                            
                            form.appendChild(element);
                            selectedindex++;
                        }
                    }
                    if(checkstatus == false){
                    alert("Please Select Table.");
                    return false;
                }
                
                var element2 = document.createElement("input");
                            element2.setAttribute("type", "hidden");
                            element2.setAttribute("name", "tabcount");
                            element2.setAttribute("value", selectedindex);
                            form.appendChild(element2);
                            
                            form.submit();
           
            return true;
                    
                }
        </script>
    </head>
    <body style="background-color: #006600">
        <div>
          <a href="http://localhost:8080/ERestaurant/Booking"><img src="images/Booking2.png"></a>
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
        </div>
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
            <br><br>
            <h1 style="text-align: center">Available Tables</h1>
            <br><br><br>
            <form method="POST" name="submitformid" id="submitformid" action="SaveTableBooking">
                <table style="width: 300px;margin-left: 250px;" id="table1">
            <tr>
                <td>Restaurant Name :</td><td><input type="text" name="resname" id="resname" style="width: 150px;" value="<%=resname%>" disabled></td>
        </tr>
        </table>
        <table style="width: 600px;background-color: lightpink;overflow: auto; margin-left: 100px" border="5" id="table2">
            <tr>
                <th style="width: 50px">Table No</th>
                <th style="width: 50px">Select</th>
               
            </tr>
            <%
            for(int i=0;i<tabnolist.size();i++){
                Integer tabno = (Integer)tabnolist.get(i);
                String tabnostr = tabno.toString();
                    
            %>
            <tr>
                <td style="width: 50px"><%=tabnostr%></td>
                <td style="width: 50px"><input type="checkbox" name="select" id="select" style="width: 20px;height: 20px"></td>
               </tr> 
            <%
            }
            %>
            
            
        </table>
                <table style="width: 400px;margin-left: 250px;" id="table3">
            <tr>
            <td>Time : </td>
           
            <td>
                Hr :
                <select id="hr" name="hr">
                    <%
                    for(int i=1;i<=12;i++){
                    %>
                    <option value="<%=i%>"><%=i%></option>
                    <%
                    }
                    %>
                </select>
            
            Mints : 
            
                <select id="mints" name="mints">
                    <option value="00">00</option>
                    <option value="15">15</option>
                    <option value="30">30</option>
                    <option value="45">45</option>
                     
                </select>
            Session :
            <select id="session" name="session">
                    <option value="am">AM</option>
                    <option value="pm">PM</option>
            </select>
            </td>
            </tr>
            <tr>
                <td colspan=2 align=center><input type=submit name="submitbutton" value="Submit" onclick="return getTables()"></td>
        
        </tr>
        <input type="hidden" name="datestr" id="datestr" value="<%=datestr%>">
        <input type="hidden" name="residstr" id="residstr" value="<%=residstr%>">
        </table>
            </form>
        </div>
    </body>
</html>
