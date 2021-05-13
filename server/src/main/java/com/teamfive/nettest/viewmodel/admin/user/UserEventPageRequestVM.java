package com.teamfive.nettest.viewmodel.admin.user;

import com.teamfive.nettest.base.BasePage;


/**
 * @author TeamFive|LYL\LMX\GYD
 */


public class UserEventPageRequestVM extends BasePage {

    private Integer userId;

    private String userName;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
