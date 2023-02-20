/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import model.Order;
import tool.JDBCUtils;
/**
 *
 * @author ADMIN
 */
public class OrderDAO implements DAOInterface<Order>{

    @Override
    public ArrayList<Order> selectAll() {
        ArrayList<Order> lists = null;
        Connection cn= null;
        try {
            cn = JDBCUtils.makeConnection();
            if(cn != null){
                lists = new ArrayList<>();
                String sql = "select OrderID, OrdDate,shipdate,[status],AccID \n" +
                            "	from Orders";

                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    int orderId = rs.getInt("OrderID");
                    Date ordDate = rs.getDate("OrdDate");
                    Date shipdate = rs.getDate("shipdate");
                    //fix loi sai 2 ngay cua sql
                    Calendar c = Calendar.getInstance(); 
                    c.setTime(ordDate); 
                    c.add(Calendar.DATE, 2);
                    ordDate = new Date(c.getTimeInMillis());
                    
                    c.setTime(shipdate); 
                    c.add(Calendar.DATE, 2);
                    shipdate = new Date(c.getTimeInMillis());
                    
                    int status = rs.getInt("status");
                    int accId = rs.getInt("AccID");
                    Order or = new Order(orderId, ordDate, shipdate, status, accId);
                    lists.add(or);
                }
                if(lists != null && lists.size() > 0){
                    Collections.sort(lists, new Comparator<Order>() {
                        @Override
                        public int compare(Order or1, Order or2) {
                            return or2.getOrderID() - or1.getOrderID();
                        }
                    });
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lists;
    }
    
    public ArrayList<Order> selectAllByAccID(int accid) {
        ArrayList<Order> lists = null;
        Connection cn= null;
        try {
            cn = JDBCUtils.makeConnection();
            if(cn != null){
                lists = new ArrayList<>();
                String sql = "select OrderID, OrdDate,shipdate,[status],AccID \n" +
                            "	from Orders where AccID = ? ";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setQueryTimeout(5);
                pst.setInt(1, accid);
                ResultSet rs = pst.executeQuery();
                while(rs.next() && rs != null){
                    int orderId = rs.getInt("OrderID");
                    Date ordDate = rs.getDate("OrdDate");
                    Date shipdate = rs.getDate("shipdate");
                    //fix loi lech 2 ngay
                    Calendar c = Calendar.getInstance(); 
                    c.setTime(ordDate); 
                    c.add(Calendar.DATE, 2);
                    ordDate = new Date(c.getTimeInMillis());
                    
                    c.setTime(shipdate); 
                    c.add(Calendar.DATE, 2);
                    shipdate = new Date(c.getTimeInMillis());
                    int status = rs.getInt("status");
                    int accId = rs.getInt("AccID");
                    Order or = new Order(orderId, ordDate, shipdate, status, accId);
                    lists.add(or);
                }
                if(lists != null && lists.size() > 0){
                    Collections.sort(lists, new Comparator<Order>() {
                        @Override
                        public int compare(Order or1, Order or2) {
                            return or2.getOrderID() - or1.getOrderID();
                        }
                    });
                }
            }
            cn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lists;
    }

    @Override
    public Order selectById(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public HashMap<Integer, Integer> selectOrderDetailById(int orderId){
        HashMap<Integer, Integer> result = null;
        Connection cn= null;
        try {
            cn = JDBCUtils.makeConnection();
            if(cn != null){
                result = new HashMap<>();
                String sql = "select FID,quantity from OrderDetails \n" +
                        "	where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderId);
                ResultSet rs = pst.executeQuery();
                while(rs.next() && rs != null){
                    int bookId = rs.getInt("FID");
                    int quantity = rs.getInt("quantity");
                    result.put(bookId, quantity);
                }
            }
            cn.close(); 
        } catch (Exception e) {
        }
        return result;
    }

    @Override
    public boolean insert(Order t) {
         throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public int insertOrders(int accid, HashMap<Integer, Integer> cart){
        Connection cn= null;
        int rs = 0;
            try{    
            cn = JDBCUtils.makeConnection();
            if(cn!=null){
             cn.setAutoCommit(false);//khong cho auto tren thang vao bang chinh
             String sql = "insert Orders (OrdDate,shipdate,[status],AccID) values(?,?,?,?)";
             PreparedStatement pst = cn.prepareStatement(sql);
             Date d = new Date(System.currentTimeMillis());
             pst.setDate(1, d);
             pst.setDate(2, d);
             pst.setInt(3, 1); //1<>peding
             pst.setInt(4, accid);
             rs = pst.executeUpdate();
             if(rs > 0){
                 sql = "select top 1 OrderID from Orders order by OrderID desc";
                 pst = cn.prepareStatement(sql);
                 ResultSet rSet = pst.executeQuery();
                 if(rSet != null && rSet.next()){
                     int orderid = rSet.getInt("OrderID");
                     if(cart != null && cart.size() > 0){
                         for(int bookid : cart.keySet()){
                             int quantity  = cart.get(bookid);
                             sql = "insert OrderDetails (OrderID,FID,quantity) values(?,?,?)";
                             pst = cn.prepareStatement(sql);
                             pst.setInt(1, orderid);
                             pst.setInt(2, bookid);
                             pst.setInt(3, quantity);
                             rs = pst.executeUpdate();
                     }
                 }
             }
         }
             cn.commit();
             cn.setAutoCommit(true);
             cn.close();
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs; 
    }

    @Override
    public int insertAll(ArrayList<Order> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteAll(ArrayList<Order> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Order t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public boolean updateStatus(int orderid, int status) {
        Connection cn= null;
        try {
            cn = JDBCUtils.makeConnection();
            if(cn != null){
                String sql = "update Orders\n" +
                        "	set status = ?\n" +
                        "	where OrderID = ?";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderid);
                int rs = pst.executeUpdate();
                cn.close();
               return true;
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
