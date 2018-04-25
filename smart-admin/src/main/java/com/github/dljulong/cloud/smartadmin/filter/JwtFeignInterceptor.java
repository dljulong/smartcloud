package com.github.dljulong.cloud.smartadmin.filter;

import com.github.dljulong.cloud.smartcommon.context.BaseContextHandler;
import com.github.dljulong.cloud.smartcommon.util.StringUtils;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 为每个feign请求添加token
 */
@Component
public class JwtFeignInterceptor implements RequestInterceptor {

    @Value("${jwt.header:Authorization}")
    private String tokenHeader;


    @Override
    public void apply(RequestTemplate template) {

        if (!template.headers().containsKey(tokenHeader)) {
            String currentToken = BaseContextHandler.getToken();
            if (!StringUtils.isEmpty(currentToken)){
                template.header(tokenHeader, currentToken);
            }
        }
    }
}