package com.sgt.socialmedia.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Repository
public class PostRepository {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Map<String,Object> insertSavedPosts(int userid, int postID){
        return jdbcTemplate.queryForMap("EXEC socialmedia.sp_SavePost ?,?",userid,postID);
    }

    public int deleteSavedPost(int post_id,int user_id){
        return jdbcTemplate.update("EXEC socialmedia.sp_UnSavePost ?,?",post_id,user_id);
    }
}