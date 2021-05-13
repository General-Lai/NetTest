package com.teamfive.nettest.event;

import com.teamfive.nettest.domain.User;
import org.springframework.context.ApplicationEvent;

/**
 * @author TeamFive|LYL\LMX\GYD
 */
public class OnRegistrationCompleteEvent extends ApplicationEvent {


    private final User user;


    public OnRegistrationCompleteEvent(final User user) {
        super(user);
        this.user = user;
    }

    public User getUser() {
        return user;
    }

}