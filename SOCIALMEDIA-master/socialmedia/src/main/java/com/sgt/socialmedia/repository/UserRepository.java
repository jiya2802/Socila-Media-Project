package com.sgt.socialmedia.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class UserRepository {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public int insertUser(String user_name,String email,String contact ,String password){
        return jdbcTemplate.update("EXEC dbo.sp_registerUser ?,?,?,?",user_name,email,contact ,password);
    }
    public Map<String , Object> loginUser(String user_name , String password){
        return jdbcTemplate.queryForMap(" EXEC social_media.sp_LoginUser ?,?",user_name , password);
    }

    public Map<String , Object> validateToken(Integer user_id , String token){
        return jdbcTemplate.queryForMap("  dbo.sp_validate_token ?,?",user_id,token);
    }

    public Map<String, Object> validateEmail(String email){
        return jdbcTemplate.queryForMap(" EXEC  dbo.sp_validateEmail ?",email);
    }

    public Map<String, Object> generateToken(String email){
        return jdbcTemplate.queryForMap(" EXEC  dbo.sp_generateFPToken ?",email);
    }

}
