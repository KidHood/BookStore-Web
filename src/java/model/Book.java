/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Book {

    private int id;
    private String name;
    private int price;
    private String imgPath;
    private String decription;
    private int status;
    private int cateId;
    private String catename;

    public Book() {
    }
    
    public Book(int id) {
        this.id = id;
    }
    public Book(int id, String name, int price, String imgPath, String decription, int status, int cateId, String catename) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgPath = imgPath;
        this.decription = decription;
        this.status = status;
        this.cateId = cateId;
        this.catename = catename;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCateId() {
        return cateId;
    }

    public void setCateId(int cateId) {
        this.cateId = cateId;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

}
