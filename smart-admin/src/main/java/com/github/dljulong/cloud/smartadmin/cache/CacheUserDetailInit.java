package com.github.dljulong.cloud.smartadmin.cache;

import com.github.dljulong.cloud.smartadmin.simple.repository.UserRepository;
import com.github.dljulong.cloud.smartadmin.simple.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.Cache;
import org.springframework.data.domain.Sort;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;

@Service
public class CacheUserDetailInit {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RedisCacheManager redisCacheManager;
    @PostConstruct
    public void loadUserDetailAll(){
        List<User> users = userRepository.findAll(Sort.by("username"));
        Cache cache = redisCacheManager.getCache("userdetail_");
       if(users!=null){
           for(User user:users){
               cache.put(user.getUsername(),user);
           }
       }
    }
    @PreDestroy
    public  void anothedMethod(){
        Cache cache = redisCacheManager.getCache("userdetail_");
        cache.clear();
    }
}
