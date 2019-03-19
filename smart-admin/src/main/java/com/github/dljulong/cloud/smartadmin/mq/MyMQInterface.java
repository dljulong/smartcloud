package com.github.dljulong.cloud.smartadmin.mq;

import org.springframework.cloud.stream.annotation.Input;
import org.springframework.messaging.SubscribableChannel;

public interface MyMQInterface {
 @Input("test-string") SubscribableChannel stringChannel();
 @Input("test-json")
    SubscribableChannel jsonChannel();
 @Input("test-bean")
    SubscribableChannel beanChannel();
 
}