package com.teamfive.nettest.base;


import com.teamfive.nettest.context.WebContext;
import com.teamfive.nettest.domain.User;
import com.teamfive.nettest.utility.ModelMapperSingle;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author TeamFive|LYL\LMX\GYD
 */
public class BaseApiController {
    protected final static String DEFAULT_PAGE_SIZE = "10";
    protected final static ModelMapper modelMapper = ModelMapperSingle.Instance();
    @Autowired
    protected WebContext webContext;

    protected User getCurrentUser() {
        return webContext.getCurrentUser();
    }
}
