package com.sgt.socialmedia.web;

import com.sgt.socialmedia.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:4200" , allowCredentials = "true")
public class UserResources {

    @Autowired
    UserService userService;

    @PostMapping("/register")
    public ResponseEntity<Map<String, String>> insertUser(@RequestBody Map<String,Object> body){
        return userService.insertUser(body);
    }

    @PostMapping("/login")
    public Map<String,Object> loginUser(@RequestBody Map<String , Object> body){

        return userService.loginUser(body);
    }
    @GetMapping("/students")
    public List<String> getStudentsNames(HttpServletRequest httpServletRequest){
        return  userService.getStudentsNames(httpServletRequest);
    }
    @PostMapping("/sendMail")
    public void ValidateandSendMail(@RequestBody Map<String , Object> body){
        userService.ValidateandSendMail(body);
    }
}
