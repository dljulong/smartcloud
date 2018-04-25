package com.github.dljulong.cloud.smartauth.demo.controller;

import com.github.dljulong.cloud.smartauth.demo.feign.SchedualServiceHi;
import com.github.dljulong.cloud.smartcommon.rest.RestResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
