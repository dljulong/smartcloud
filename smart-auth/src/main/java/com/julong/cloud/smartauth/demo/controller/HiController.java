package com.julong.cloud.smartauth.demo.controller;

import com.julong.cloud.smartauth.demo.feign.SchedualServiceHi;
import com.julong.cloud.smartcommon.annotation.IgnoreUserToken;
import com.julong.cloud.smartcommon.rest.RestResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HiController {
    @Autowired
    private SchedualServiceHi schedualServiceHi;
    @RequestMapping(value = "/hi")
    public RestResult sayHi(@RequestParam String name){
        String msg = schedualServiceHi.sayHiFromClientOne(name);
        return new RestResult(msg);
    }
}
