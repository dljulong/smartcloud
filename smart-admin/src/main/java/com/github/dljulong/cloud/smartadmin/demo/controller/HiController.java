package com.github.dljulong.cloud.smartadmin.demo.controller;

import com.github.dljulong.cloud.smartcommon.annotation.IgnoreUserToken;
import com.github.dljulong.cloud.smartcommon.exception.UserTokenException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
@IgnoreUserToken
@RestController
public class HiController {
    @Value("${server.port}")
    String port;
    @RequestMapping("/hi")
    public String home(@RequestParam String name) {
        System.out.println(Thread.currentThread().getName()+"come in home!");
        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println(Thread.currentThread().getName()+" done!");
        return "hi "+name+",i am from port:" +port;
    }
    @RequestMapping("/haha")
    public String haha(@RequestParam String name) {
        boolean f =true;
         if(f){
             throw new UserTokenException("TOKEN CUOWU");
         }
        return "hi "+name+",i am from port:" +port;
    }
}
