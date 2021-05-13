package com.teamfive.nettest.controller.wx;

import com.teamfive.nettest.context.WxContext;
import com.teamfive.nettest.domain.User;
import com.teamfive.nettest.domain.UserToken;
import com.teamfive.nettest.utility.ModelMapperSingle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseWXApiController {
    protected final static ModelMapper modelMapper = ModelMapperSingle.Instance();
    @Autowired
    private WxContext wxContext;

    protected User getCurrentUser() {
        return wxContext.getCurrentUser();
    }

    protected UserToken getUserToken() {
        return wxContext.getCurrentUserToken();
    }
}
