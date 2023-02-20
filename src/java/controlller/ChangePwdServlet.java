/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import database.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import tool.Encode;

/**
 *
 * @author ADMIN
 */
public class ChangePwdServlet extends HttpServlet {

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
            String currentPwd = request.getParameter("currentPwd");
            String newPwd = request.getParameter("newPwd");
            String confirmPwd = request.getParameter("confirmPwd");
            currentPwd = Encode.toSHA1(currentPwd);
            //lay acc
            Object obj = session.getAttribute("account");
            Account acc = (Account) obj;
            String error = "";
            String url = "client/changePwd.jsp";
            if(acc != null){
                //check mk hien tai
                if(currentPwd.equals(acc.getPassword())){
                    //check mk moi va nhap lai
                    if(newPwd.equals(confirmPwd)){
                        //check mk moi va mk hien tai
                        newPwd = Encode.toSHA1(newPwd);
                        if(newPwd.equals(currentPwd)){
                            error="Mật khẩu mới giống với mật khẩu hiện tại";
                        }else{
                            AccountDAO accDAO = new AccountDAO();

                            acc.setPassword(newPwd);
                            boolean rs = accDAO.updatePwd(acc);
                            if(rs){
                                error="<h1 style='color:green;'>Thay đổi mật khẩu thành công!</h1>";
                            }else{
                                error="Thay đổi mật khẩu không thành công";
                            }
                        }
                    //mk moi va nhap lai sai
                    }else{
                        error="Mật khẩu nhập lại không chính xác";
                    }
                //mk hien tai khong dung
                }else{
                    error="Mật khẩu hiện tại không chính xác";
                }
               
                request.setAttribute("error", error);
                request.getRequestDispatcher(url).forward(request, response);
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
