package com.github.dljulong.cloud.smartcommon.restclient;

import com.github.dljulong.cloud.smartcommon.context.BaseContextHandler;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

/**
 * 为了feign rest请求能携带token
 */
public class ClientTokenInterceptor implements RequestInterceptor {

    private Logger logger = LoggerFactory.getLogger(ClientTokenInterceptor.class);

    @Value("${jwt.header}")
    private String tokenHeader;

    @Override
    public void apply(RequestTemplate requestTemplate) {
        try {
            requestTemplate.header(tokenHeader, BaseContextHandler.getToken());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
