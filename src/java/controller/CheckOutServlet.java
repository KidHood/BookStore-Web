/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.AccountDAO;
import database.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class CheckOutServlet extends HttpServlet {

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
           //b1: check login trc
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
            if(acc==null){
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                Account accTemp = new Account(0, System.currentTimeMillis()+"", null, fullname, 0, phone, 0);
                AccountDAO acDAO = new AccountDAO();
                boolean rs = acDAO.insert(accTemp);
                if(rs){
                    //lay acc id moi insert
                    int accid = acDAO.selectNewAccId();
                    HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
                    OrderDAO orDAO  = new OrderDAO();
                    int kq = orDAO.insertOrders(accid, cart);
                    if(kq > 0){
                       session.removeAttribute("cart");
                    request.setAttribute("MSG", "Mua hàng thành công!");
                    request.getRequestDispatcher("client/cart.jsp").forward(request, response);
                    }
                }
            }else{
                //b2: lay user id cua ng login
                int accId = acc.getAccID();
                HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
                //b3: chen 1 dong recore vao bang order
                //b4: lay order id cuar b3 
                //b5: duyet cai gio hang de chen order detail
                OrderDAO orDAO = new OrderDAO();
                int rs = orDAO.insertOrders(accId, cart);
                //b6: xoa gio hang
                if(rs > 0){
                session.removeAttribute("cart");
                request.setAttribute("MSG", "Mua hàng thành công!");
                request.getRequestDispatcher("client/cart.jsp").forward(request, response);
                }
            }
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
