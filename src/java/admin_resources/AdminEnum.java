/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin_resources;

/**
 *
 * @author ADMIN
 */
public enum AdminEnum {
    //view 
    ViewAllAccount("ViewAllAccount", "/view-all-account"),
    ViewAllBook("ViewAllBook","/view-all-book"),
    ViewBookDetail("ViewBookDetail","/view-book-detail"),
    ViewOrderDetail("ViewOrderDetail","/view-order-detail"),
    ViewAllCategories("ViewAllCategories","/view-all-categories"),
    ViewAllOrder("ViewAllOrder","/view-all-order"),
    //update
    UpdateOrder("UpdateOrder","/update-order-admin"),
    UpdateCategories("UpdateCategories","/update-categories"),
    ChangeAccountStatus("ChangeAccountStatus", "/change-account-status"),
    UpdateBook("UpdateBook","/update-book"),
    ChangeBookStatus("ChangeBookStatus", "/change-book-status");
    
    private String action;
    private String url;

    private AdminEnum(String action, String url) {
        this.action = action;
        this.url = url;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
    
    
}
