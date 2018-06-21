package com.github.dljulong.cloud.smartauth.config;


import com.github.dljulong.cloud.smartcommon.jpa.BaseRepositoryFactoryBean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages = "com.github.dljulong.cloud",repositoryFactoryBeanClass = BaseRepositoryFactoryBean.class)
public class JPAConfig {

}
