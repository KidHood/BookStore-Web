/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import model.Account;
import tool.JDBCUtils;

/**
 *
 * @author ADMIN
 */
public class AccountDAO implements DAOInterface<Account>{

    @Override
    public ArrayList<Account> selectAll() {
        ArrayList<Account> result = null;
        Connection conn = null;
        try{
            conn = JDBCUtils.makeConnection();
            if(conn != null){
                result = new ArrayList<>();
                String sql = "select accID,email,fullname,phone,status,role from Accounts\n" +
                    "	where email like '%@%'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    int accId = rs.getInt("accID");
                    String email = rs.getString("email");
                    String fullName = rs.getString("fullname");
                    String phone = rs.getString("phone");
                    int status = rs.getInt("status");
                    int role = rs.getInt("role");
                    result.add(new Account(accId, email, "", fullName, status, phone, role));
                }
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public HashMap<Integer, String> selectAccidEmail() {
        HashMap<Integer, String> result = null;
        Connection conn = null;
        try{
            conn = JDBCUtils.makeConnection();
            if(conn != null){
                result = new HashMap<>();
                String sql = "select accID,email from Accounts \n" +
                "	where email like '%@%'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    int accId = rs.getInt("accID");
                    String email = rs.getString("email");
                    result.put(accId, email);
                }
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
     public HashMap<Integer, String> selectAllAccidEmail() {
        HashMap<Integer, String> result = null;
        Connection conn = null;
        try{
            conn = JDBCUtils.makeConnection();
            if(conn != null){
                result = new HashMap<>();
                String sql = "select accID,email from Accounts";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    int accId = rs.getInt("accID");
                    String email = rs.getString("email");
                    result.put(accId, email);
                }
            }
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    @Override
    public Account selectById(Account t) {
        Connection conn = null;
        Account acc = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "select accID,email,password,fullname,phone,status,role\n"
                        +"from dbo.Accounts\n"
                       +"where status = 1 and email = ? and password =? COLLATE Latin1_General_CS_AS";
                   PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getEmail());
               pst.setString(2, t.getPassword());
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   int accID = rs.getInt("accID");
                   String email = rs.getString("email");
                   String password = rs.getString("password");
                   String fullname = rs.getString("fullname");
                   String phone = rs.getString("phone");
                   int status = rs.getInt("status");
                   int role = rs.getInt("role");
                   return acc = new Account(accID, email, password, fullname, status, phone, role);
                   
               }
               conn.close();
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return null;
    }
    
    public boolean selectByUSer(String user) {
        Connection conn = null;
        Account acc = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "select accID,email,password,fullname,phone,status,role\n"
                        +"from dbo.Accounts\n"
                       +"where status = 1 and email = ?";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, user);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   return true;
               }
               conn.close();
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
    
     public Account selectAccByEmail(String emailUser) {
        Connection conn = null;
        Account acc = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "select accID,email,password,fullname,phone,status,role\n"
                        +"from dbo.Accounts\n"
                       +"where email = ?";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, emailUser);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   int accID = rs.getInt("accID");
                   String email = rs.getString("email");
                   String password = rs.getString("password");
                   String fullname = rs.getString("fullname");
                   String phone = rs.getString("phone");
                   int status = rs.getInt("status");
                   int role = rs.getInt("role");
                   acc = new Account(accID, email, password, fullname, status, phone, role);;
               }
               conn.close();
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return acc;
    }
    
     public Account selectEmailToken(String email, String token) {
         Connection conn = null;
        Account acc = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "select accID,[password],fullname,phone,[status],[role] from Accounts\n" +
                    "	where email = ? AND token = ?";
                   PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, email);
               pst.setString(2, token);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   int accID = rs.getInt("accID");
                   String password = rs.getString("password");
                   String fullname = rs.getString("fullname");
                   String phone = rs.getString("phone");
                   int status = rs.getInt("status");
                   int role = rs.getInt("role");
                   return acc = new Account(accID, email, password, fullname, status, phone, role);
                   
               }
               conn.close();
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return null;
    }
     
    public int selectNewAccId(){
        Connection conn = null;
        int result = 0;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "select top 1 accID from Accounts order by accID desc ";
               PreparedStatement pst = conn.prepareStatement(sql);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   result = rs.getInt("accID");
               }
               conn.close();
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return result;
    }
        
    
    @Override
    public boolean insert(Account t) {
        Connection conn = null;
        Account acc = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "insert into Accounts(email,[password],fullname,phone,[status],[role]) values (?,?,?,?,?,?)";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getEmail());
               pst.setString(2, t.getPassword());
               pst.setString(3, t.getFullname());
               pst.setString(4, t.getPhone());
               pst.setInt(5, t.getStatus());
               pst.setInt(6, t.getRole());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }

    @Override
    public int insertAll(ArrayList<Account> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Account t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteAll(ArrayList<Account> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Account t) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "update Accounts \n" +
                            "set fullname = ?,\n" +
                            " phone = ?\n" +
                            "where accID = ?";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getFullname());
               pst.setString(2, t.getPhone());
               pst.setInt(3, t.getAccID());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
    
    public boolean updateInfor(Account t) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "update Accounts \n" +
                            "set fullname = ?,\n" +
                            " phone = ?\n" +
                            "where accID = ?";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getFullname());
               pst.setString(2, t.getPhone());
               pst.setInt(3, t.getAccID());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
     public boolean updateToken(Account t, String token) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "update Accounts\n" +
                    "	set token = ?\n" +
                    "	where accID = ?";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, token);
               pst.setInt(2, t.getAccID());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
     
     public boolean updatePwd(Account t) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "update Accounts\n" +
                            "set [password] = ?\n" +
                            "where accID = ?";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getPassword());
               pst.setInt(2, t.getAccID());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
     
     public boolean updateStatus(int status, int accID) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
               String sql = "update Accounts\n" +
                            "set [status] = ?\n" +
                            "where accID = ?";
                       
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setInt(1, status);
               pst.setInt(2, accID);
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
     
}
