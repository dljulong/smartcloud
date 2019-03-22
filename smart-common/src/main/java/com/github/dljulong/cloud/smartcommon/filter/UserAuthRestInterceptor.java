package com.github.dljulong.cloud.smartcommon.filter;

import com.github.dljulong.cloud.smartcommon.annotation.IgnoreUserToken;
import com.github.dljulong.cloud.smartcommon.exception.UserTokenException;
import com.github.dljulong.cloud.smartcommon.jwt.JwtTokenUtil;
import com.github.dljulong.cloud.smartcommon.context.BaseContextHandler;
import com.github.dljulong.cloud.smartcommon.util.StringUtils;
import io.jsonwebtoken.Claims;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * jwt权限校验token
 */
public class UserAuthRestInterceptor extends HandlerInterceptorAdapter {
    private Logger logger = LoggerFactory.getLogger(UserAuthRestInterceptor.class);


    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Value("${jwt.header:Authorization}")
    private String tokenHeader;

    @Override public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            @Nullable ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(this.tokenHeader);
        if(!StringUtils.isEmpty(token)){
            BaseContextHandler.setToken(token);
        }
        if(handler instanceof HandlerMethod){
            HandlerMethod handlerMethod = (HandlerMethod) handler;
            // 配置该注解，说明不进行用户拦截
            IgnoreUserToken annotation = handlerMethod.getBeanType().getAnnotation(IgnoreUserToken.class);
            if (annotation == null) {
                annotation = handlerMethod.getMethodAnnotation(IgnoreUserToken.class);
            }
            if (annotation != null) {
                return super.preHandle(request, response, handler);
            }
            if ("1".equals(request.getParameter("i"))) {
                return super.preHandle(request, response, handler);
            }

            if (token != null && token.startsWith("Bearer ")) {
                String authToken = token.substring(7);
                String userid = jwtTokenUtil.getUseridFromToken(authToken);
                Claims claims = jwtTokenUtil.getAllClaimsFromToken(authToken);
                BaseContextHandler.setUsername((String)claims.get("username"));
                BaseContextHandler.setUser(claims);
                BaseContextHandler.setUserID(userid);
            } else {
                throw new UserTokenException("token 验证失败");
            }
        }
        return super.preHandle(request, response, handler);
    }


    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        BaseContextHandler.remove();
        super.afterCompletion(request, response, handler, ex);
    }
}
