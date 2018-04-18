package com.julong.cloud.module_auth;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@EnableEurekaClient
@SpringBootApplication
public class ModuleAuthApplication {

	public static void main(String[] args) {
		SpringApplication.run(ModuleAuthApplication.class, args);
	}
}
