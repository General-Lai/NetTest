package com.teamfive.nettest.listener;

import com.teamfive.nettest.event.UserEvent;
import com.teamfive.nettest.service.UserEventLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class UserLogListener implements ApplicationListener<UserEvent> {

    private final UserEventLogService userEventLogService;

    @Autowired
    public UserLogListener(UserEventLogService userEventLogService) {
        this.userEventLogService = userEventLogService;
    }

    @Override
    public void onApplicationEvent(UserEvent userEvent) {
        userEventLogService.insertByFilter(userEvent.getUserEventLog());
    }

}
