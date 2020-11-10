/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
@WebServlet(name = "SaveTableBooking", urlPatterns = {"/SaveTableBooking"})
public class SaveTableBooking extends HttpServlet {

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
                HttpSession session = request.getSession();
                String user = (String)session.getAttribute("username");
                 Connection con = SetDBConnection.getConnection();
                //String user = request.getRemoteUser();
               // Principal prin = request.getUserPrincipal();
                List tabidlist = new ArrayList();
                String resid = request.getParameter("residstr");
                Integer residint = Integer.parseInt(resid);
                String datestr = request.getParameter("datestr");
                String hr = request.getParameter("hr");
                String min = request.getParameter("mints");
                String sessionstr = request.getParameter("session");
                String time = hr+":"+min+" "+sessionstr;
                String indexvalue = request.getParameter("tabcount");
                Integer indexint = Integer.parseInt(indexvalue);
                for(int i=0;i<indexint;i++){
                String tabid = request.getParameter("tabid"+i);
                Integer tabidint = Integer.parseInt(tabid);
                //System.out.println("Table Id :"+tabid);
                tabidlist.add(tabidint);
                           
                       }
                SimpleDateFormat sdf = new SimpleDateFormat("h:mm a");
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                Date datetime = null;
                try{
                    datetime = sdf.parse(time);
                }catch(ParseException ex){
                    ex.printStackTrace();
                }
                //String timestr = sdf.format(datetime);
                Date finaldate = null;
                try{
                finaldate = sdf2.parse(datestr);
                }catch(ParseException ex){
                    ex.printStackTrace();
                }
                Time finaltime = new java.sql.Time(datetime.getTime());
                java.sql.Date finalsqldate = new java.sql.Date(finaldate.getTime());
                
                
                /*System.out.println("User : "+user);
                System.out.println("Res Id : "+residint);
                System.out.println("Date : "+finaldate);
                System.out.println("Time : "+finaltime);*/
                
                try{
                    for(int i=0;i<tabidlist.size();i++){
                        Integer tabid = (Integer)tabidlist.get(i);
                    String query = "insert into tablebooking (restaurantid,tableno,bookingdate,bookingtime,userid) values (?,?,?,?,?)";
                    PreparedStatement preparedStmt = con.prepareStatement(query);
                    preparedStmt.setInt(1, residint);
                    preparedStmt.setInt(2, tabid);
                    preparedStmt.setDate(3, finalsqldate);
                    preparedStmt.setTime(4, finaltime);
                    preparedStmt.setString(5, user);
                    preparedStmt.execute();
                    
                    }
                    request.getRequestDispatcher("/user/User.jsp").forward(request, response);
                    
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
