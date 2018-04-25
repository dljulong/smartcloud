package com.github.dljulong.cloud.smartadmin.simple.controller;

import com.github.dljulong.cloud.smartadmin.simple.model.User;
import com.github.dljulong.cloud.smartadmin.simple.repository.UserRepository;
import com.github.dljulong.cloud.smartcommon.annotation.IgnoreUserToken;
import com.github.dljulong.cloud.smartcommon.context.BaseContextHandler;
import com.github.dljulong.cloud.smartcommon.jwt.JwtTokenUtil;
import com.github.dljulong.cloud.smartcommon.rest.RestResult;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@RestController
public class AuthenticationRestController {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder encoder;

    @IgnoreUserToken
    @RequestMapping(value = "auth/login", method = RequestMethod.POST)
    public ResponseEntity<?> createAuthenticationToken(@RequestBody Map<String,String> authenticationRequest){

        String username = authenticationRequest.get("username");
        String password = authenticationRequest.get("password");
        User user= userRepository.findByUsername(username);
        if (encoder.matches(password, user.getPassword())) {
            Map<String, Object> claims = new HashMap<String, Object>();
            BeanUtils.copyProperties(user, claims);
            String userid = user.getId().toString();
            String token = jwtTokenUtil.generateToken(userid,claims);
            return ResponseEntity.ok(new RestResult(token));
        }else{
            return ResponseEntity.ok(new RestResult(401,"获取token失败"));
        }

    }

    @RequestMapping(value = "refresh", method = RequestMethod.GET)
    public ResponseEntity<?> refreshAndGetAuthenticationToken(HttpServletRequest request) {
        String token = BaseContextHandler.getToken();
        String refreshedToken = jwtTokenUtil.refreshToken(token);
        return ResponseEntity.ok(new RestResult(refreshedToken));
    }



}
