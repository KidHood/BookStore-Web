/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import database.AccountDAO;
import model.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class FirstPage extends HttpServlet {

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
            Cookie[] c = request.getCookies();
            if(c != null){
                String token = "";
                String email = "";
                String keyword = "";
                for(Cookie temp : c){
                    if(temp.getName().equals("email")){
                        email = temp.getValue();
                    }else if(temp.getName().equals("token")){
                        token = temp.getValue();
                    }else if(temp.getName().equals("topic")){
                        keyword = temp.getValue();
                    }
                }
                if(!token.isEmpty() && !email.isEmpty()){
                    AccountDAO accDAO = new AccountDAO();
                    Account acc = accDAO.selectEmailToken(email, token);
                    HttpSession session = request.getSession();
                    session.setAttribute("account", acc);
                }
                if(!keyword.isEmpty()){
                    keyword = keyword.replaceAll("_", " ");
                }
                request.getRequestDispatcher("main-controller?action=search&txtsearch="+keyword+"&searchby=byname").forward(request, response);
            }else{
                request.getRequestDispatcher("main-controller?action=search&txtsearch=&searchby=byname").forward(request, response);
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
