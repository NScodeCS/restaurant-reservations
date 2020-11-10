/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "SaveNewRestaurant", urlPatterns = {"/SaveNewRestaurant"})
public class SaveNewRestaurant extends HttpServlet {

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
        
        
        String resname = request.getParameter("resname");
        String resaddress = request.getParameter("resaddress");
        String phno = request.getParameter("phno");
        Long phnolong = Long.parseLong(phno);
        String nooftables = request.getParameter("nooftables");
        Integer nooftableint = Integer.parseInt(nooftables);
        String status = new String("unapproved");
        
        Connection con = SetDBConnection.getConnection();
            try{
            String query = "insert into restaurant (name,address,phno,nooftables,status) values (?,?,?,?,?)";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, resname);
            preparedStmt.setString(2, resaddress);
            preparedStmt.setLong(3, phnolong);
            preparedStmt.setInt(4, nooftableint);
            preparedStmt.setString(5, status);
            
            
            // execute the java preparedstatement
            preparedStmt.execute();
               request.getRequestDispatcher("/rm/Rm.jsp").forward(request, response);
            }catch(Exception ex){
                ex.printStackTrace();
                request.getRequestDispatcher("/rm/Newrestaurantfailure.jsp").forward(request, response);
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
