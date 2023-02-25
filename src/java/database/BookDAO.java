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
import model.Book;
import tool.JDBCUtils;
/**
 *
 * @author ADMIN
 */
public class BookDAO implements DAOInterface<Book>{

    @Override
    public ArrayList<Book> selectAll() {
        Connection conn = null;
        ArrayList<Book> lists = null;
        try{
            conn = JDBCUtils.makeConnection();
            lists = new ArrayList<>();
            if(conn != null){
                String sql = "select PID,PName,price,[status],Categories.CateName\n" +
                "	from Plants join Categories on Plants.CateID = Categories.CateID";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                while(rs.next()){
                    int bookID = rs.getInt("PID");
                    String bookName = rs.getString("PName");
                    int price = rs.getInt("price");
                    int status = rs.getInt("status");
                    String cateName = rs.getString("CateName");
                    lists.add(new Book(bookID, bookName, price, "", "", status, 0, cateName));
                }
            }
            
            conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return lists;
    }
    
    public ArrayList<Book> search(String keyword, String searchBy) {
        Connection conn = null;
        ArrayList<Book> list = new ArrayList<>();
        try{
            conn = JDBCUtils.makeConnection();
            if(conn != null && searchBy != null){
                String sql = "select PID, PName, price, imgPath, description,status,Plants.CateID as 'CateID',CateName\n"
                            + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
                if(searchBy.equalsIgnoreCase("byname"))
                    sql = sql + "where Plants.PName like ?";
                else
                    sql += "where CateName like ?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setString(1, "%"+keyword+"%");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateId = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    Book book = new Book(id, name, price, imgPath, description, status, cateId, cateName);
                    list.add(book);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    
    @Override
    public Book selectById(Book t) {
        Book result = null;
        Connection conn = null;
        try{
            conn = JDBCUtils.makeConnection();
            if(conn != null && t != null){
                String sql = "select PID, PName, price, imgPath, description,status,Plants.CateID as 'CateID',CateName\n"
                            + "from Plants join Categories on Plants.CateID=Categories.CateID\n"
                            + "where Plants.PID=?";
                PreparedStatement pst = conn.prepareStatement(sql);
                pst.setInt(1, t.getId());
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                    int id = rs.getInt("PID");
                    String name = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateId = rs.getInt("CateID");
                    String cateName = rs.getString("CateName");
                    result = new Book(id, name, price, imgPath, description, status, cateId, cateName);
            }
        }
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    public HashMap<Integer,String> selectALlCateName(){
        HashMap<Integer,String> result = null;
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn != null){
               result = new HashMap<>();
               String sql = "Select CateID,CateName from Categories";
               Statement st = conn.createStatement();
               ResultSet rs = st.executeQuery(sql);
               while(rs.next()){
                   int cateid = rs.getInt("CateID");
                   String cateName = rs.getString("CateName");
                   result.put(cateid, cateName);
                }
                       
           }    
           conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    public int selectCateIdByCateName(String cateName){
        Connection conn = null;
        int result = 0;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn != null){
               String sql = "Select CateID from Categories where CateName = ?";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, cateName);
               ResultSet rs = pst.executeQuery();
               while(rs.next()){
                   result = rs.getInt("CateID");
                }
                       
           }    
           conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
        
    @Override
    public boolean insert(Book t) {
        Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
            String sql = "insert Plants (PName,price,imgPath,[description],[status],CateID) values(?,?,?,?,?,?)";
                System.out.println(t.getCateId() + "id in database");
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getName());
               pst.setInt(2, t.getPrice());
               pst.setString(3, t.getImgPath());
               pst.setString(4, t.getDecription());
               pst.setInt(5, t.getStatus());
               pst.setInt(6, t.getCateId());
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
    public int insertAll(ArrayList<Book> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(Book t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int deleteAll(ArrayList<Book> list) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Book t) {
         Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
            String sql = "update Plants\n" +
                        "set PName = ?,\n" +
                        "price = ?,\n" +
                        "imgPath = ?,\n" +
                        "description = ? ,\n" +
                        "CateID = ?\n" +
                        "	where PID = ?";

               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, t.getName());
               pst.setInt(2, t.getPrice());
               pst.setString(3, t.getImgPath());
               pst.setString(4, t.getDecription());
               pst.setInt(5, t.getCateId());
               pst.setInt(6, t.getId());
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
    
    public boolean updateStatus(int status, int bookID){
          Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
            String sql = "update Plants\n" +
                        "set status = ?\n" +
                        "where PID = ?";

               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setInt(1, status);
               pst.setInt(2, bookID);
               pst.executeUpdate();
               conn.close();
               return true;
           }
        }catch(Exception e){
            e.printStackTrace();
        } 
        return false;
    }
    
    public boolean updateImgPath(String imgPath, int bookID){
          Connection conn = null;
        try{
           conn = JDBCUtils.makeConnection();
           if(conn !=null){
            String sql = "update Plants\n" +
                        "set imgPath = ?\n" +
                        "where PID = ?";

               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, imgPath);
               pst.setInt(2, bookID);
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
