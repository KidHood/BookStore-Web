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
        String pattern = "\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b";
        String phone  = "vanthong@07012002.com";
        System.out.println(phone.matches(pattern));
        String test = " ";
        
        
    }
}
