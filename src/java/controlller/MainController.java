/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class MainController extends HttpServlet {

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
            String action = request.getParameter("action");
            String url = "";
            switch (action){
                case "login":
                    url = "do-login";
                    break;
                case "register":
                    url="do-register";
                    break;
                case "search":
                    url="do-search";
                    break;
                case "logout":
                    url="do-logout";
                    break;
                case "change-infor":
                    url="do-change-infor";
                    break;
                case "change-pwd":
                    url="do-change-pwd";
                    break;
                case "view-book-detail":
                    url="view-book-detail";
                    break;
                case "add-to-cart":
                    url="add-to-cart";
                    break;
                case "view-cart":
                    url="client/cart.jsp";
                    break;
                case "remove-book-cart":
                    url="remove-book-cart";
                    break;
                case "update-quantity":
                    url="update-quantity-cart";
                    break;
                case "checkout":
                    url="check-out";
                    break;
                case "history-order":
                    url="history-order";
                    break;
                case "change-status":
                    url="change-status";
                    break;
                case "filter-by-date":
                    url="filter-by-date";
                    break;
                case "view-order-detail":
                    url="view-order-detail";
                    break;
                case "home":
                    url="home";
                    break;
            }
            System.out.println("controller");
            request.getRequestDispatcher(url).forward(request, response);
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
