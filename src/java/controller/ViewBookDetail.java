/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Book;

/**
 *
 * @author ADMIN
 */
public class ViewBookDetail extends HttpServlet {

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
            String bookId = request.getParameter("bid");
            //lay account
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("account");
             //lay ra book object
            BookDAO boDAO = new BookDAO();
            Book book = null;
            if(bookId != null && !bookId.isEmpty()){
                int Id = Integer.parseInt(bookId.trim());
                book = boDAO.selectById(new Book(Id));
            }
            
            if(book != null){
                request.setAttribute("bookDetail", book);
            }
            if(acc != null){
                if(acc.getRole() == 0)
                    request.getRequestDispatcher("client/bookDetail.jsp").forward(request, response);
                else if(acc.getRole() == 1){
                   HashMap<Integer,String> list = boDAO.selectALlCateName();
                    request.setAttribute("listcate", list);
                    request.getRequestDispatcher("admin/updateBook.jsp").forward(request, response);
                }
            }else
            request.getRequestDispatcher("client/bookDetail.jsp").forward(request, response);
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
