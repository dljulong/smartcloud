package com.github.dljulong.cloud.smartauth.mq;

import org.springframework.cloud.stream.annotation.Output;
import org.springframework.messaging.MessageChannel;

public interface MyMQInterface {
 
    @Output("test-string") MessageChannel stringChanel();
 
    @Output("test-json")
    MessageChannel jsonChanel();
 
    @Output("test-bean")
    MessageChannel beanChanel();
}