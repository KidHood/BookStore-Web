/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import database.AccountDAO;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class TestConnection {
    public static void main(String[] args) {
        AccountDAO acDAO = new AccountDAO();
        Account acc = acDAO.selectById(new Account(1, "asfasf", "123", "", 1, null, 1));
        if(acc != null){
            if(acc.getRole() == 1)
                System.out.println("i am an admin");
            else
                System.out.println("i am a user");
        }else
            System.out.println("login fail");
        
    }
}
