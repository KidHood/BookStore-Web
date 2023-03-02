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
public class UpdateBook extends HttpServlet {

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
            BookDAO booDAO = new BookDAO();
            Book book = null;
            //set flag check thong bao
            boolean flag = false;
            //check add hay update
            boolean isAdd = false;
            
            String folder = getServletContext().getRealPath("productImage");
            System.out.println(folder);
            //set file size
            int maxFileSize = 50*1024*1024;
            int maxMemSize = 50*1024*1024;
                                
            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(maxMemSize);
            //configure a reposittory
            ServletContext servletContext =  this.getServletConfig().getServletContext();
//            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
//            factory.setRepository(repository);
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(maxMemSize);
            upload.setHeaderEncoding("UTF-8");
            try{
              List<FileItem> items = upload.parseRequest(request);
              //check chi gan gia chi book dua tren bid 1 lan duy nhat
              boolean  checkBookIsRun = false;
              for(FileItem item : items){
                if(item.getFieldName().equals("newbook")){
                    book = new Book();
                    isAdd = true;
                }else{ 
                    if(item.getFieldName().equals("bid") ){
                        if(!item.getString().trim().isEmpty() && !checkBookIsRun){
                            checkBookIsRun = true;
                            isAdd = false;
                            int realBookID = Integer.parseInt(item.getString().trim());
                            book = booDAO.selectById(new Book(realBookID));
                            System.out.println(item.getString());
                        }
                    }
                }
                if(book != null){
                    if(item.getFieldName().equals("bookname")){
                     System.out.println(item.getString());
                     book.setName(item.getString());
                     flag = true;
                    }else if(item.getFieldName().equals("price")){
                        int price = Integer.parseInt(item.getString().trim());
                        book.setPrice(price);
                       System.out.println(item.getString());
                       flag = true;
                    }else if(item.getFieldName().equals("decription")){
                        book.setDecription(item.getString());
                       System.out.println(item.getString());
                       flag = true;
                    }else if(item.getFieldName().equals("cateName")){
                       int cateID = booDAO.selectCateIdByCateName(item.getString().trim());
                       System.out.println(cateID + "cateID");
                       book.setCateId(cateID);
                       flag = true;
                    }else if(item.getFieldName().equals("imgPath")){
                        if(item.getSize() > 0){
                            String originalFileName = item.getName();
                            int index = originalFileName.lastIndexOf(".");
                            String ext = originalFileName.substring(index + 1);
                            String fileName = System.currentTimeMillis() + "." +ext;
                            String folder1 = folder + "/" + fileName;
                            File file = new File(folder1);
                            System.out.println("img name " + fileName);
                            book.setImgPath(fileName);
                            flag = true;
                            item.write(file);
                            }
                    }
                }
          }
        if(isAdd){
             book.setStatus(1);
             boolean temp = booDAO.insert(book);
             System.out.println("Bo may insert");
             if(!temp){
                 flag = false; 
             }
         }else{
             boolean temp = booDAO.update(book);
             System.out.println("Bo may update");
             if(!temp){
                 flag = false; 
             }
         }
          if(flag){
              request.setAttribute("MSG", "Thành Công");
          }else{
              request.setAttribute("MSG", "Thất bại");
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
