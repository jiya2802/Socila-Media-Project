package com.sgt.socialmedia.service;

import com.sgt.socialmedia.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Service
public class PostService {
    @Autowired
    PostRepository postRepository;

    public Map<String,Object> insertSavedPosts(int userid, int postID){
        return postRepository.insertSavedPosts(userid, postID);
    }

    public ResponseEntity<String> deleteSavedPost(Map<String,Object> body){
        int user_id=(int) body.get("user_id");
        int post_id=(int) body.get("post_id");
        int noOfRows=postRepository.deleteSavedPost(user_id,post_id);
        if(noOfRows>0){
            return ResponseEntity.ok("saved post deleted successfully");
        }
        return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).body("saved post deletion failed");
    }
}