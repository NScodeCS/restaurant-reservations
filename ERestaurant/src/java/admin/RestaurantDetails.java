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
@WebServlet(name = "RestaurantDetails", urlPatterns = {"/RestaurantDetails"})
public class RestaurantDetails extends HttpServlet {

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
        
            //System.out.println("Check");
       
        String resid = request.getParameter("residhidden");
        Integer residint = Integer.parseInt(resid);
        String resname = new String();
        String resaddress = new String();
        Long phnolong = new Long(0);
         try{
                String checkquery = "select * from restaurant where restaurantid ="+residint;
                Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkquery);
            while(rs.next()){
                resname = rs.getString(2);
                resaddress = rs.getString(3);
                phnolong = rs.getLong(4);
            }
            request.setAttribute("resid", residint);
            request.setAttribute("resname", resname);
            request.setAttribute("resaddress", resaddress);
            request.setAttribute("phno", phnolong);
            
            request.getRequestDispatcher("/admin/RestaurantDetails.jsp").forward(request, response);
         }catch(Exception ex){
             request.getRequestDispatcher("/admin/RestaurantDetailsfailure.jsp").forward(request, response);
             ex.printStackTrace();
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
