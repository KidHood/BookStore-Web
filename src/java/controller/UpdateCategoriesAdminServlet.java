/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.BookDAO;
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
public class UpdateCategoriesAdminServlet extends HttpServlet {

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
           String action = request.getParameter("actionAdmin");
           
           BookDAO bookDAO = new BookDAO();
           String msg = "";
           String url = "/admin-controller?action=ViewAllCategories";
           
           if(action.equals("addNew")){
              String catename = request.getParameter("newcatename");
                    //check xem coi co insert thanh cong khong
                boolean check = bookDAO.insertCatename(catename);
               if(check){
                   msg = "Thêm mới thành công";
               }else{
                   msg = "Thêm mới thất bại";
               }
           }else if(action.equals("update")){
               String id = request.getParameter("cateid");
               String catename = request.getParameter("catename");
               int cateId = 0;
               try {
                   cateId = Integer.parseInt(id.trim());
                   boolean check = bookDAO.updateCategories(cateId, catename);
                   if(check){
                       msg = "Cập nhật thành công";
                   }else{
                       msg = "Cập nhật thất bại";
                   }
               } catch (Exception e) {
               }
               
               
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
