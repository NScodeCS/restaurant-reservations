/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.SetDBConnection;

/**
 *
 * @author MY-PC
 */
@WebServlet(name = "SetRestaurantApproval", urlPatterns = {"/SetRestaurantApproval"})
public class SetRestaurantApproval extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            Connection con = SetDBConnection.getConnection();
            String residstr = request.getParameter("residhidden2");
            Integer residint = Integer.parseInt(residstr);
            String status = request.getParameter("approve");
            //System.out.println("Res ID is : "+residstr);
            if(status.equalsIgnoreCase("unapproved")){
                
            request.getRequestDispatcher("/admin/Admin.jsp").forward(request, response);
            
            }else if(status.equalsIgnoreCase("approved")){
                //System.out.println("Status  : "+status);
                
                Integer nooftable = new Integer(0);
                try{
                   String query = "update restaurant set status =? where restaurantid ="+residint; 
                   PreparedStatement preparedStmt = con.prepareStatement(query);
                   preparedStmt.setString(1, status); 
                   preparedStmt.executeUpdate();
                   
                   String gettablequery = "select * from restaurant where restaurantid ="+residint;
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery(gettablequery);
                  while(rs.next()){
                   nooftable = rs.getInt(5);
                  }
                  String tablestatus = new String("unbooked");
                  for(int i=1;i<=nooftable;i++){
                      String tablequery = "insert into restauranttable (restaurantid,tableno,status) values (?,?,?)";
                      PreparedStatement preparedStmt2 = con.prepareStatement(tablequery);
                      preparedStmt2.setInt(1, residint);
                      preparedStmt2.setInt(2, i);
                      preparedStmt2.setString(3, tablestatus);
                      preparedStmt2.execute();
                  }
                  
                  
            
            request.getRequestDispatcher("/admin/Admin.jsp").forward(request, response);
                  
                }catch(Exception ex){
                    ex.printStackTrace();
                }
            }
            
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
