package com.julong.cloud.smartadmin.config;


import com.julong.cloud.smartcommon.jpa.BaseRepositoryFactoryBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages = "com.julong.cloud",repositoryFactoryBeanClass = BaseRepositoryFactoryBean.class)
public class JPAConfig {

}
