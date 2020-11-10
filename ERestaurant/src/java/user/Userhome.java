/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MY-PC
 */
@WebServlet(name = "Userhome", urlPatterns = {"/Userhome"})
public class Userhome extends HttpServlet {

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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String usernamestr = new String("admin");
        String adminpassword = new String("admin");
        
        if(username.equalsIgnoreCase(usernamestr)&& password.equalsIgnoreCase(adminpassword)){
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            request.getRequestDispatcher("/admin/Admin.jsp").forward(request, response);
        }else{
            Connection con = SetDBConnection.getConnection();
            try{
                Boolean status = false;
                String passwordstr = new String();
                String role = new String();
                String checkquery = "select * from users where username =\""+username+"\"";
                Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(checkquery);
            while(rs.next()){
                status = true;
                passwordstr = rs.getString(6);
                role = rs.getString(7);
            }
            if(status == true){
            if(password.equals(passwordstr)){
                if(role.equalsIgnoreCase("user")){
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    request.getRequestDispatcher("/user/User.jsp").forward(request, response);
                }else if(role.equalsIgnoreCase("rm")){
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    request.getRequestDispatcher("/rm/Rm.jsp").forward(request, response);
                }
            }else{
                request.getRequestDispatcher("/user/Passwordcheck.jsp").forward(request, response);
            }
            }else if(status == false){
                request.getRequestDispatcher("/user/Usercheck.jsp").forward(request, response);
            }
            }catch(Exception ex){
                
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
