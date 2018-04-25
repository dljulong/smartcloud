package com.github.dljulong.cloud.smartcenter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@EnableEurekaServer
@SpringBootApplication
public class SmartCenterApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartCenterApplication.class, args);
	}
}
