package com.github.dljulong.cloud.smartauth.mq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.integration.support.MessageBuilder;
import org.springframework.stereotype.Component;

import java.util.Date;

@EnableBinding(MyMQInterface.class)
@Component
public class Sender {

 @Autowired
 MyMQInterface myInterface;

    public void sendString() {
		String context = "hello " + new Date();
        System.out.println("Sender : " + context);
        
        myInterface.stringChanel().send(MessageBuilder.withPayload(context).build());
    }

}
