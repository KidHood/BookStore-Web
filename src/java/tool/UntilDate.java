/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tool;

import java.sql.Date;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class UntilDate {
    public static Date addDate(Date d, int plus){
        Calendar c = Calendar.getInstance(); 
        c.setTime(d); 
        c.add(Calendar.DATE, plus);
        d = new Date(c.getTimeInMillis());
        return d;
    } 
}
