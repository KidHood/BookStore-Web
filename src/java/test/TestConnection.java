/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import database.BookDAO;
import java.util.HashMap;



/**
 *
 * @author ADMIN
 */
public class TestConnection {
    public static void main(String[] args) {
        BookDAO bo_DAO = new BookDAO();
        System.out.println(bo_DAO.selectCatename("Truyen Tranh"));
        
    }
}
