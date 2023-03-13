/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_resources;

import java.util.HashMap;
import java.util.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author ADMIN
 */
public class ContextInitActionAdmin implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        HashMap<String, String> map = new HashMap<>();
        ServletContext context = sce.getServletContext();
        Set<AdminEnum> set = EnumSet.allOf(AdminEnum.class);
        for(AdminEnum enumItem : set){
            map.put(enumItem.getAction(), enumItem.getUrl());
        }
        context.setAttribute("mapAdminAction", map);
        
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
