package com.julong.cloud.smartgate;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@EnableZuulProxy
@SpringBootApplication
public class SmartGateApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartGateApplication.class, args);
	}
}
