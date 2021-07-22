package com.skilldistillery.Contracting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class ContractManagementSystemApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(ContractManagementSystemApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(ContractManagementSystemApplication.class, args);
	}

}
