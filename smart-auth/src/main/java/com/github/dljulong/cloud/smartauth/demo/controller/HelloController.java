package com.github.dljulong.cloud.smartauth.demo.controller;

import com.github.dljulong.cloud.smartcommon.annotation.IgnoreUserToken;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@IgnoreUserToken
public class HelloController {
    @Value("${server.port}")
    private int port;
    @RequestMapping("hello")
    public String hello(){
            return "hello"+this.port;
    }
}
