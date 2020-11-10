/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package rm;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
import user.SetDBConnection;

/**
 *
 * @author MY-PC
 */
@WebServlet(name = "ViewBookingDetails", urlPatterns = {"/ViewBookingDetails"})
public class ViewBookingDetails extends HttpServlet {

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
        String resid = request.getParameter("resid");
        Integer residint = Integer.parseInt(resid);
        String date = request.getParameter("date");
        String month = request.getParameter("month");
        String year = request.getParameter("year");
        String datestr = date+"-"+month+"-"+year;
        String resname = new String();
        List tabnolist = new ArrayList();
        
        List bookedbylist = new ArrayList();
        List bookedtablelist = new ArrayList();
        List bookeddatelist = new ArrayList();
        List bookedtimelist = new ArrayList();
        //System.out.println("res ID : "+resid);
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                       Date date2 = null;
                       try{
                           date2 = sdf.parse(datestr);
                       }catch(ParseException ex){
                           ex.printStackTrace();
                       }
                       String datestr2 = sdf2.format(date2);
        try{
                   String query = "select * from restaurant where restaurantid ="+residint;
                   Statement st = con.createStatement();
                   ResultSet rs = st.executeQuery(query);
                  while(rs.next()){
                   resname = rs.getString(2);
                  }
                  
                  String query2 = "select * from restauranttable where restaurantid ="+residint;
                   Statement st2 = con.createStatement();
                   ResultSet rs2 = st2.executeQuery(query2);
                  while(rs2.next()){
                   Integer tabno = rs2.getInt(3);
                                     
                   tabnolist.add(tabno);
                   
                  }
                  
                  String getbookingtablequery = "select * from tablebooking where restaurantid ="+residint+" AND bookingdate =\""+datestr2+"\"";
                     Statement st3 = con.createStatement();
                     ResultSet rs3 = st3.executeQuery(getbookingtablequery);
                     while(rs3.next()){
                     Integer tabno = rs3.getInt(3);
                     Date bookeddate = rs3.getDate(4);
                     Time bookedtime = rs3.getTime(5);
                     String bookedby = rs3.getString(6);
                     bookedtablelist.add(tabno);
                     bookeddatelist.add(bookeddate);
                     bookedtimelist.add(bookedtime);
                     bookedbylist.add(bookedby);
                     }
                     
                  
                  request.setAttribute("tabnolist", tabnolist);
                  request.setAttribute("resname", resname);
                  request.setAttribute("bookeddatelist", bookeddatelist);
                  request.setAttribute("bookedtablelist", bookedtablelist);
                  request.setAttribute("bookedtimelist", bookedtimelist);
                  request.setAttribute("bookedbylist", bookedbylist);
                  
                  request.getRequestDispatcher("/rm/ViewBookingDetails.jsp").forward(request, response);
                  
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
