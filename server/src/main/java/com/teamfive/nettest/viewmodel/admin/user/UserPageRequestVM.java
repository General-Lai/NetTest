package com.teamfive.nettest.viewmodel.admin.user;

import com.teamfive.nettest.base.BasePage;


/**
 * @author TeamFive|LYL\LMX\GYD
 */


public class UserPageRequestVM extends BasePage {

    private String userName;
    private Integer role;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
