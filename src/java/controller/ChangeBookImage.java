/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.BookDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ADMIN
 */
public class ChangeBookImage extends HttpServlet {

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
            String id = request.getParameter("bid");
            BookDAO  booDAO = new BookDAO();
            
            int bookID = 1;
//            bookID = Integer.parseInt(id.trim());
            Book book = booDAO.selectById(new Book(bookID));

                String folder = getServletContext().getRealPath("productImage");
				System.out.println(folder);
                
                DiskFileItemFactory factory = new DiskFileItemFactory();
                
                //configure a reposittory
                ServletContext servletContext =  this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);
                ServletFileUpload upload = new ServletFileUpload(factory);
                try{
                  List<FileItem> items = upload.parseRequest(request);
                  for(FileItem item : items){
                      if(item.getFieldName().equals("imgPath")){
                          String originalFileName = item.getName();
                          System.out.println(originalFileName);
                          int index = originalFileName.lastIndexOf(".");
                          String ext = originalFileName.substring(index+1);
                          String fileName = System.currentTimeMillis() + "." +ext;
                          String folder1 = folder + "/" + fileName;
                          
                          File file = new File(folder1);
                          
                          book.setImgPath(fileName);
                          boolean flag = booDAO.update(book);
                          if(flag){
                              request.setAttribute("MSG", "ok");
                          }else{
                              request.setAttribute("MSG", "false");
                          }
                          item.write(file);
                      }else if(item.getFieldName().equals("bid")){
                         System.out.println(item.getString());
                      }
                  }
                  request.getRequestDispatcher("view-all-book").forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
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
