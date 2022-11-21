/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Admin
 */
public class UserError {

    private String userID;
    private String password;
    private String confirm;
    private String roleID;
    private String name;
    private String email;
    private String phone;
    private String address;
    private String errorMsg;

    public UserError() {
        this.userID = "";
        this.password = "";
        this.confirm = "";
        this.roleID = "";
        this.name = "";
        this.email = "";
        this.phone = "";
        this.address = "";
        this.errorMsg = "";
    }

    public UserError(String userID, String password, String confirm, String roleID, String name, String email, String phone, String address, String errorMsg) {
        this.userID = userID;
        this.password = password;
        this.confirm = confirm;
        this.roleID = roleID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.errorMsg = errorMsg;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String comfirm) {
        this.confirm = comfirm;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

}
