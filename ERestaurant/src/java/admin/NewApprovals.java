/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "NewApprovals", urlPatterns = {"/NewApprovals"})
public class NewApprovals extends HttpServlet {

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
        String status = new String("unapproved");
        List residlist = new ArrayList();
        List resnamelist = new ArrayList();
        List resaddresslist = new ArrayList();
        List resphnolist = new ArrayList();
            try{
                String checkquery = "select * from restaurant where status =\""+status+"\"";
                Statement st3 = con.createStatement();
            ResultSet rs3 = st3.executeQuery(checkquery);
            while(rs3.next()){
                Integer recid = rs3.getInt(1);
                String name = rs3.getString(2);
                String address = rs3.getString(3);
                Long phno = rs3.getLong(4);
                String phnostr = phno.toString();
                residlist.add(recid);
                resnamelist.add(name);
                resaddresslist.add(address);
                resphnolist.add(phno);
                
            }
            
            request.setAttribute("residlist", residlist);
            request.setAttribute("resnamelist", resnamelist);
            request.setAttribute("resaddresslist", resaddresslist);
            request.setAttribute("resphnolist", resphnolist);
            
        request.getRequestDispatcher("/admin/NewApprovals.jsp").forward(request, response);
        }catch(Exception ex){
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
