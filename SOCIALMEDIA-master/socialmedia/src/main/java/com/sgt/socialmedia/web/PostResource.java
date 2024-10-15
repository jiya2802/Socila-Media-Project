package com.sgt.socialmedia.web;

import com.sgt.socialmedia.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RequestMapping("/api")
@RestController
public class PostResource {
    @Autowired
    PostService postService;

    @PostMapping("{userid}/{postID}")
    public Map<String,Object> getSavedPosts(@PathVariable int userid, @PathVariable int postID){
        return postService.insertSavedPosts(userid,postID);
    }

    @PutMapping("/savedpost")
    public ResponseEntity<String> deleteSavedPost(@RequestBody Map<String,Object> body){
        return postService.deleteSavedPost(body);
    }
}