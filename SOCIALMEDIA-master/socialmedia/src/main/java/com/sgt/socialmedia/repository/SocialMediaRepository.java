package com.sgt.socialmedia.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class SocialMediaRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Map<String,Object>> fetchAllPosts(int user_id){
        return jdbcTemplate.queryForList("EXEC social_media.sp_fetch_all_posts ?",user_id);
    }

    public List<Map<String,Object>> fetchFollowers(int user_id){
        return jdbcTemplate.queryForList("EXEC social_media.sp_fetch_followers ?",user_id);
    }

    public List<Map<String,Object>> fetchFollowing(int user_id){
        return jdbcTemplate.queryForList("EXEC social_media.sp_fetch_following ?",user_id);
    }


}
