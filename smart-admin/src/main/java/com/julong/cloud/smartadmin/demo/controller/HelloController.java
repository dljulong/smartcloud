package com.julong.cloud.smartadmin.demo.controller;

import com.julong.cloud.smartadmin.feigin.SchedualHelloService;
import com.julong.cloud.smartcommon.annotation.IgnoreUserToken;
import com.julong.cloud.smartcommon.rest.RestResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@IgnoreUserToken
public class HelloController {
    @Value("${server.port}")
    private int port;
    @Autowired
    private SchedualHelloService schedualHelloService;

    @RequestMapping("hello")
    public String hello(){
            return "hello"+this.port;
    }
    @RequestMapping("helloother")
    public RestResult helloother(){
        return new RestResult(schedualHelloService.hello());
    }
}
