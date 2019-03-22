package com.github.dljulong.cloud.smartadmin.config;

import com.github.dljulong.cloud.smartcommon.filter.UserAuthRestInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
@EnableWebMvc
public class WebMvcConfig  implements WebMvcConfigurer{

            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("*")
                        .allowedHeaders("*").exposedHeaders("userid","username")
                        .allowCredentials(true).maxAge(3600);
            }

            @Override
            public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
            }
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                registry.addInterceptor(getUserAuthRestInterceptor()).
                        addPathPatterns("/**/*")
                        .excludePathPatterns("/**/fonts/*")
                        .excludePathPatterns("/**/*.css")
                        .excludePathPatterns("/**/*.js")
                        .excludePathPatterns("/**/*.png")
                        .excludePathPatterns("/**/*.gif")
                        .excludePathPatterns("/**/*.jpg")
                        .excludePathPatterns("/**/*.jpeg")
                        .excludePathPatterns("/**/*.html")
                        .excludePathPatterns("/static/*");
            }


    @Bean
    UserAuthRestInterceptor getUserAuthRestInterceptor() {
        return new UserAuthRestInterceptor();
    }

}
