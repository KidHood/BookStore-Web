/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;



/**
 *
 * @author ADMIN
 */
public class TestConnection {
    public static void main(String[] args) {
        String pattern = "^0\\d{9,10}";
        String phone  = "0212345678";
        System.out.println(phone.matches(pattern));
        
    }
}
