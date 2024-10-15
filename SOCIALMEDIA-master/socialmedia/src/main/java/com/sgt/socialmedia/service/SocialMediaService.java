package com.sgt.socialmedia.service;

import com.sgt.socialmedia.repository.SocialMediaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.print.attribute.standard.JobKOctets;
import java.util.List;
import java.util.Map;

@Service
public class SocialMediaService {

    @Autowired
    SocialMediaRepository socialMediaRepository;

    public List<Map<String,Object>> fetchAllPost(int user_id){
        return socialMediaRepository.fetchAllPosts(user_id);
    }

    public List<Map<String,Object>> fetchFollowers(int user_id){
        return socialMediaRepository.fetchFollowers(user_id);
    }

    public List<Map<String,Object>> fetchFollowing(int user_id){
        return socialMediaRepository.fetchFollowing(user_id);
    }


}
