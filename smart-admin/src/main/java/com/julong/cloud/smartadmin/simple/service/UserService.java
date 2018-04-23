package com.julong.cloud.smartadmin.simple.service;

import com.julong.cloud.smartadmin.simple.model.User;
import com.julong.cloud.smartadmin.simple.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;

/**
 * Created by stephan on 20.03.16.
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RedisCacheManager redisCacheManager;

    public User findByUsername(String username) {

        Cache cache = redisCacheManager.getCache("userdetail_");
        User user = cache.get(username,User.class);
        return user;
    }
}
