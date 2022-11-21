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
public class UserDTO {

    private String userID;
    private String password;
    private String roleID;
    private String name;
    private String email;
    private String phone;
    private String address;

    public UserDTO() {
        this.userID = "";
        this.password = "";
        this.roleID = "";
        this.name = "";
        this.email = "";
        this.phone = "";
        this.address = "";
    }

    public UserDTO(String userID, String password, String roleID, String name, String email, String phone, String address) {
        this.userID = userID;
        this.password = password;
        this.roleID = roleID;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
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

}
