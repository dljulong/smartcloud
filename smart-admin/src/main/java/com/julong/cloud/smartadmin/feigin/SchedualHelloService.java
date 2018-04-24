package com.julong.cloud.smartadmin.feigin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Administrator on 2018/4/24/024.
 */
@FeignClient(value = "smart-auth")
public interface SchedualHelloService {
    @RequestMapping(value = "/hello")
    String hello();
}
