package com.sgt.socialmedia.web;

import com.sgt.socialmedia.service.SocialMediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200")

public class SocialMediaResource {

    @Autowired
    SocialMediaService socialMediaService;

    @GetMapping("/fetchpost/{user_id}")
    public List<Map<String,Object>> fetchAllPosts(@PathVariable int user_id ){
        return socialMediaService.fetchAllPost(user_id);
    }

    @GetMapping("/followers/{user_id}")
    public List<Map<String,Object>> fetchFollowers(@PathVariable int user_id ){
        return socialMediaService.fetchFollowers(user_id);
    }

    @GetMapping("/following/{user_id}")
    public List<Map<String,Object>> fetchFollowing(@PathVariable int user_id ){
        return socialMediaService.fetchFollowing(user_id);
    }

}
