/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import database.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;

/**
 *
 * @author ADMIN
 */
public class HomePage extends HttpServlet {
   private final int NUM_PRODUCT = 8;
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
            String num = request.getParameter("numberpage");
            BookDAO bookD = new BookDAO();
            ArrayList<Book> list = bookD.search("", "byname");
            if(list != null){
                int maxPage = (int) Math.ceil(list.size()-NUM_PRODUCT);
                int numPage = 1;
                try {
                    numPage = Integer.parseInt(num.trim());
                    if(numPage >= maxPage) {
                        numPage = 1;
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                List<Book> listTemp = null;
                try {
                    int minProduct = numPage;
                    if(minProduct >= 1){
                        minProduct = (minProduct-1) * NUM_PRODUCT;
                    }
                    int maxProduct = numPage*NUM_PRODUCT;
                    if(maxProduct >= list.size()){
                        maxProduct = list.size();
                    }
                    listTemp = list.subList(minProduct, maxProduct);
                } catch (Exception e) {
                    listTemp = list.subList(0, NUM_PRODUCT);
                    numPage = 1;
                }
                
                request.setAttribute("list", listTemp);
                request.setAttribute("numpage", numPage);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
            
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
