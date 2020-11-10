<%-- 
    Document   : NewApprovals
    Created on : May 29, 2018, 3:00:21 PM
    Author     : MY-PC
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            <%
            List residlist = (List)request.getAttribute("residlist");
            List resnamelist = (List)request.getAttribute("resnamelist");
            List resaddresslist = (List)request.getAttribute("resaddresslist");
            List resphnolist = (List)request.getAttribute("resphnolist");
            %>
                
            function analyseComplaint(_row)
                 {
                     //alert(_row);
                            
        var row = document.getElementById("row"+_row);
                            //document.getElementById("Enquiryid").value=_tempregno;
                           // document.hiddenform.submit();
                            
                            var formname = document.getElementById("submitformid").name;
                            var form = document.forms[formname];
        
                            
                             // var isselect = row.cells[5].childNodes[0];
                             var resid = row.cells[0].innerHTML;
                             //alert(resid);
                              var element = document.createElement("input");
                             element.setAttribute("type","hidden");
                             element.setAttribute("name","residhidden");
                             element.setAttribute("value", resid);
                             form.appendChild(element);
                                form.submit();
                          
                             
                             }
        </script>
    </head>
    <body style="background-color: #006600">
        <div>
          <a href="http://localhost:8080/ERestaurant/NewApprovals"><img src="images/Approvals2.png"></a>
          <a style="text-align: right;float: right" href="http://localhost:8080/ERestaurant/Logout"><img src="images/Logout2.png"></a>
         </div>
        <div style="background-color: #ffff66;margin-top: 100px;margin-bottom: 50px;margin-left: 200px;margin-right: 200px;height: 500px" >
            <br><br>
            <h1 style="text-align: center">Restaurants</h1>
            <br><br><br>
            <form method="POST" name="submitformid" id="submitformid" action="RestaurantDetails">
        <table style="width: 600px;background-color: lightpink;overflow: auto; margin-left: 100px" border="5" id="table1">
            <tr>
                <th style="width: 50px">Rec Id</th>
                <th style="width: 80px">Name</th>
                <th style="width: 300px">Address</th>
                <th style="width: 80px">Phno</th>
            </tr>
            <%
            for(int i=0;i<residlist.size();i++){
                Integer recid = (Integer)residlist.get(i);
                String recidstr = recid.toString();
                String name = (String)resnamelist.get(i);
                String address = (String)resaddresslist.get(i);
                Long phno = (Long)resphnolist.get(i);
                String phnostr = phno.toString();
                String data = "row"+i;
                %>
            <tr id="<%=data%>">
                <td style="width: 50px" ondblclick="analyseComplaint(<%=i%>)"><%=recidstr%></td>
                <td style="width: 80px" ondblclick="analyseComplaint(<%=i%>)"><%=name%></td>
                <td style="width: 300px" ondblclick="analyseComplaint(<%=i%>)"><%=address%></td>
                <td style="width: 80px" ondblclick="analyseComplaint(<%=i%>)"><%=phnostr%></td>
            </tr>
            <%
            }
            %>
            
        </table>
            </form>
        </div>
    </body>
</html>
