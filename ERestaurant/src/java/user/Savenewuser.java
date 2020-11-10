/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MY-PC
 */
@WebServlet(name = "Savenewuser", urlPatterns = {"/Savenewuser"})
public class Savenewuser extends HttpServlet {

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
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phno = request.getParameter("phno");
        Long phnolong = Long.parseLong(phno);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        /*System.out.println("Name : "+name);
        System.out.println("Address : "+address);
        System.out.println("Phno : "+phno);
        System.out.println("Username : "+username);
        System.out.println("Password : "+password);
        System.out.println("Role : "+role);*/
        
        Connection con = SetDBConnection.getConnection();
            try{
                Boolean status = true;
                String checkquery = "select * from users where username =\""+username+"\"";
                Statement st3 = con.createStatement();
            ResultSet rs3 = st3.executeQuery(checkquery);
            while(rs3.next()){
                status = false;
            }
            if(status == true){
            String query = "insert into users (name,address,phno,username,password,role) values (?,?,?,?,?,?)";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, name);
            preparedStmt.setString(2, address);
            preparedStmt.setLong(3, phnolong);
            preparedStmt.setString(4, username);
            preparedStmt.setString(5, password);
            preparedStmt.setString(6, role);
            
            // execute the java preparedstatement
            preparedStmt.execute();
            request.getRequestDispatcher("/user/Home.jsp").forward(request, response);
            }else if(status == false){
               request.getRequestDispatcher("/user/Usernamecheck.jsp").forward(request, response); 
            }
            }catch(Exception ex){
                ex.printStackTrace();
                request.getRequestDispatcher("/user/Newregistrationfailure.jsp").forward(request, response);
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
