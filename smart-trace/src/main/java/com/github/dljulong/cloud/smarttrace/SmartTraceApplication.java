package com.github.dljulong.cloud.smarttrace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import zipkin.server.EnableZipkinServer;

@EnableZipkinServer
@SpringBootApplication
public class SmartTraceApplication {

	public static void main(String[] args) {
		SpringApplication.run(SmartTraceApplication.class, args);
	}
}
