/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
public class LoginServlet extends HttpServlet {
    public final String FIRST_TOKEN = "aqkb-212A@f";
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
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            String save = request.getParameter("remember_me");
            
            password = Encode.toSHA1(password);
            String url = "";
            String error = "";
            
            AccountDAO accDAO = new AccountDAO();
            Account acc = accDAO.selectById(new Account(0, user, password, null, 0, null, 0));
            if(acc != null ){
                //admin
                if(acc.getRole() == 1){
                    url="admin/adminHome.jsp";
                    HttpSession session  = request.getSession();
                    session.setAttribute("account", acc);
                //guest    
                }else{
                    url = "/main-controller?action=home&numberpage=1";
                    HttpSession session  = request.getSession();
                    session.setAttribute("account", acc);
                    if(save != null ){
                        Cookie c1 = new Cookie("email", acc.getEmail());
                        c1.setMaxAge(24*60*60);
                        //tao token
                        String token = FIRST_TOKEN + System.currentTimeMillis();
                        token = Encode.toSHA1(token);
                        Cookie c2 = new Cookie("token", token);
                        c2.setMaxAge(24*60*60);
                        accDAO.updateToken(acc, token);
                        //them cookie
                        response.addCookie(c1);
                        response.addCookie(c2);
                    }
                }
            //sai pass or user
            }else{
                url = "/common/login.jsp";
                error = "Tài khoản mật khẩu không chính xác";
                request.setAttribute("error", error);
            }
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
