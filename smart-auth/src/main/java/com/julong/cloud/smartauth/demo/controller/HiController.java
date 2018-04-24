package com.julong.cloud.smartauth.demo.controller;

import com.julong.cloud.smartauth.demo.feign.SchedualServiceHi;
import com.julong.cloud.smartcommon.annotation.IgnoreUserToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@IgnoreUserToken
public class HiController {
    @Autowired
    private SchedualServiceHi schedualServiceHi;
    @RequestMapping(value = "/hi")
    public String sayHi(@RequestParam String name){
        return schedualServiceHi.sayHiFromClientOne(name);
    }
}
