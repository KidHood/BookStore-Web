/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Order;

/**
 *
 * @author ADMIN
 */
public class FilterHistoryOrderServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            //lay ngay de loc
            String dateFrom = request.getParameter("datefrom");
            String dateTo = request.getParameter("dateto");
            Date dateFromTemp = null;
            if(dateFrom != null && !dateFrom.equals("null")){
                dateFromTemp = Date.valueOf(dateFrom);
                Calendar c = Calendar.getInstance(); 
                c.setTime(dateFromTemp); 
                c.add(Calendar.DATE, -1);
                dateFromTemp = new Date(c.getTimeInMillis());
            }
            
            Date dateToTemp = new Date(System.currentTimeMillis()+24*60);
            if(dateTo != null && !dateTo.isEmpty()){
                dateToTemp = Date.valueOf(dateTo);
                Calendar c = Calendar.getInstance(); 
                c.setTime(dateToTemp); 
                c.add(Calendar.DATE, 1);
                dateToTemp = new Date(c.getTimeInMillis());
            }
            
            Date dateFromReal = dateFromTemp;
            Date dateToReal = dateToTemp;
            if(dateFromReal.after(dateToReal)){
                request.setAttribute("MSG", "Ngày lọc sai!");
            }else if (acc != null && dateFromReal != null){
                OrderDAO orDAO = new OrderDAO();
                ArrayList<Order> lists = orDAO.selectAllByAccID(acc.getAccID());
                if(lists != null && lists.size() > 0){
                    List<Order> listsReal = lists.stream().filter(a -> a.getOrderDate().after(dateFromReal)&&
                                 a.getOrderDate().before(dateToReal)).collect(Collectors.toList()
                                    );
                    request.setAttribute("historyorder", listsReal);
                    request.setAttribute("dateFrom", dateFrom);
                    request.setAttribute("dateTo", dateTo);
                }
            }
            request.getRequestDispatcher("client/historyOrder.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
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
