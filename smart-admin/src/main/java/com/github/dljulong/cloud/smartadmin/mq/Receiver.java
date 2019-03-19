package com.github.dljulong.cloud.smartadmin.mq;

import com.github.dljulong.cloud.smartadmin.simple.model.User;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.annotation.StreamListener;
import org.springframework.stereotype.Component;

@Component
@EnableBinding(MyMQInterface.class)
public class Receiver {

 @StreamListener("test-string")
 public void onReceive1(String content){
	 System.out.println("Receiver String : " + content);
 }
 
 @StreamListener("test-json")
 public void onReceive2(String jsb){
        System.out.println("Receiver Json : " + jsb);
 }
 
 @StreamListener("test-bean")
 public void onReceive3(String user){
        System.out.println("Receiver Bean : 姓名" + user);
 }
}
