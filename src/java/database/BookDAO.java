/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
        ArrayList<Book> list = new ArrayList<>();
        try{
            conn = JDBCUtils.makeConnection();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
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

    @Override
    public boolean insert(Book t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
