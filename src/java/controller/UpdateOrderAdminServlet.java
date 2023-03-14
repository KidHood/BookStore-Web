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
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import tool.UntilDate;

/**
 *
 * @author ADMIN
 */
public class UpdateOrderAdminServlet extends HttpServlet {

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
            String action = request.getParameter("actionAdmin");
            String msg = "";
            String url = "/admin-controller?action=ViewAllOrder";
            OrderDAO orDAO = new OrderDAO();
            
            if(action.equals("update") ){
                String shipdate = request.getParameter("shipdate");
                Date shiDate = Date.valueOf(shipdate);
                String status = request.getParameter("status");
                int sta = Integer.parseInt(status.trim());
                String orderid = request.getParameter("orderid");
                int id = Integer.parseInt(orderid.trim());
                boolean check = orDAO.update(new Order(id, null, shiDate, sta, 0));
                if(check){
                    msg = "Cập nhật thành công";
                }
            }else if(action.equals("filterdate") ){
                String from = request.getParameter("fromdate");
                String to = request.getParameter("todate");
                Date fromDate = null;
                Date toDate = null;
                Date fromCheck = null;
                Date toCheck = null;
                
                //parse from
                if(!from.trim().isEmpty() && from != null){
                    fromDate = Date.valueOf(from);
                    fromCheck = fromDate;
                    fromDate = UntilDate.addDate(fromDate, -1);
                //khoi tao todate neu null
                }
                if(!to.isEmpty() && to != null){
                    toDate = Date.valueOf(to);
                }
                toCheck= toDate;
                if(to.trim().isEmpty() || to == null || to.equals("null")){
                    toDate = new Date(System.currentTimeMillis());
                }
                if(fromCheck.after(toDate)){
                    msg = "Khoảng lọc sai";
                    request.setAttribute("action", "filterdate");
                    request.setAttribute("fromdate", from);
                    request.setAttribute("todate", to);
                }else {
                    toDate = UntilDate.addDate(toDate, 1);
                    Date tempFromDate = fromDate;
                    Date tempToDate = toDate;

                    ArrayList<Order> list = orDAO.selectAll();
                    List<Order> listTemp = list.stream().filter(a -> a.getOrderDate().after(tempFromDate) 
                            && a.getOrderDate().before(tempToDate)).collect(Collectors.toList());
                    
                    request.setAttribute("action", "filterdate");
                    request.setAttribute("fromdate", from);
                    request.setAttribute("todate", to);
                    request.setAttribute("listOrder", listTemp);
                    url="/admin/order.jsp";
                }
            }else if(action.equals("filterusername") ){
                String accid = request.getParameter("accid");
                String email = request.getParameter("email");
                int accIdReal = Integer.parseInt(accid.trim());
                ArrayList<Order> lists = orDAO.selectAllByAccID(accIdReal);
                request.setAttribute("action", "filterusername");
                request.setAttribute("email", email);
                request.setAttribute("listOrder", lists);
                url="/admin/order.jsp";
            }
            request.setAttribute("MSG", msg);
            request.getRequestDispatcher(url).forward(request, response);
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
