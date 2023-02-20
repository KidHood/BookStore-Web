/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public interface DAOInterface <T>{
    public ArrayList<T> selectAll();

    public T selectById(T t);

    public boolean insert(T t);

    public int insertAll(ArrayList<T> list);

    public boolean delete(T t);

    public int deleteAll(ArrayList<T> list);

    public boolean update(T t);
}
